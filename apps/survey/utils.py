import urllib2
import errno
from django import forms
from django.forms.util import ErrorList
from django.contrib.auth.models import User

from apps.survey import definitions as d
from apps.survey import models
from apps.survey import signals

from django.conf import settings
from epidb_client import EpiDBClient, ResponseError, InvalidResponseError

from datetime import datetime, date

from .survey import Specification, parse_specification

try:
    import cPickle as pickle
except ImportError:
    import pickle

import simplejson as json

_specifications = {}

class UnknownSurveyError(Exception):
    def __init__(self, survey_id):
        self.survey_id = survey_id
        msg = 'Unknown survey id: %s' % self.survey_id
        Exception.__init__(self, msg)

def load_specification(survey_id):
    spec = _specifications.get(survey_id, None)
    if spec is not None:
        return spec

    try:
        data = models.Survey.objects.get(survey_id=survey_id)
    except models.Survey.DoesNotExist:
        raise UnknownSurveyError(survey_id)

    survey = parse_specification(data.specification)
    spec = Specification(survey)

    _specifications[survey_id] = spec
    return spec

def _format_data(type, data):
    if data is None:
        return data

    # TODO: complete this: text, options-single, options-multiple
    if type == 'date':
        data = data.strftime("%Y-%m-%d")
    return data

def _create_answers(spec, cleaned_data):
    data = {}

    for question in spec.questions:
        if not question.private:
            if question.id in cleaned_data:
                data[question.id] = _format_data(question.type,
                                                 cleaned_data[question.id])

    return data

def add_survey_participation(survey_user, survey_id, id=None):
    survey = models.Survey.objects.get(survey_id=survey_id)
    participation = models.Participation()
    participation.user = survey_user
    participation.survey = survey
    participation.epidb_id = id
    participation.previous_participation = survey_user.last_participation
    participation.previous_participation_date = survey_user.last_participation_date
    participation.save()

    survey_user.last_participation = participation
    survey_user.last_participation_date = participation.date
    survey_user.save()

    return participation

def add_extra_survey_participation(survey_user, survey_id, id=None):
    survey = models.Survey.objects.get(survey_id=survey_id)

    participation = models.Participation()
    participation.user = survey_user
    participation.survey = survey
    participation.epidb_id = id
    participation.previous_participation = None
    participation.previous_participation_date = None
    participation.save()

    return participation

def add_response_queue(participation, spec, cleaned_data):
    user_id = participation.user.global_id
    survey_id = spec.survey.id
    answers = pickle.dumps(_create_answers(spec, cleaned_data))

    queue = models.ResponseSendQueue()
    queue.participation = participation
    queue.date = datetime.utcnow()
    queue.user_id = user_id
    queue.survey_id = survey_id
    queue.answers = answers
    queue.save()

    signals.response_submit.send(sender=queue,
                                 user=participation.user,
                                 date=queue.date,
                                 user_id=user_id,
                                 survey_id=survey_id,
                                 answers=answers)

def add_profile_queue(survey_user, spec, cleaned_data):
    user_id = survey_user.global_id
    profile_survey_id = spec.survey.id
    answers = pickle.dumps(_create_answers(spec, cleaned_data))

    queue = models.ProfileSendQueue()
    queue.owner = survey_user
    queue.date = datetime.utcnow()
    queue.user_id = user_id
    queue.survey_id = profile_survey_id
    queue.answers = answers
    queue.save()

    signals.profile_update.send(sender=queue,
                                user=survey_user,
                                date=queue.date,
                                user_id=user_id,
                                survey_id=profile_survey_id,
                                answers=answers)

def get_user_profile(survey_user):
    try:
        profile = models.Profile.objects.get(user=survey_user)
        if not profile.valid or not profile.data:
            return None
        return pickle.loads(str(profile.data))
    except models.Profile.DoesNotExist:
        return None
    except StandardError:
        return None

def get_last_response(survey_user):
    try:
        response = models.LastResponse.objects.get(user=survey_user)
        if not response.data:
            return None
        return pickle.loads(str(response.data))
    except models.LastResponse.DoesNotExist, e:
        return None
    except StandardError:
        return None

def format_profile_data(spec, data):
    res = {}
    for question in spec.questions:
        value = data.get(question.id, None)
        if value is not None:
            if question.type in ['options-single']:
                value = value.strip()
                if value == '':
                    value = None
                else:
                    value = int(value)
            elif question.type in ['options-multiple']:
                value = map(lambda x: int(x), value)

        res[question.id] = value

    return res

def format_response_data(spec, data):
    # FIXME
    return format_profile_data(spec, data)

def save_profile(survey_user, survey_id, data):
    try:
        profile = models.Profile.objects.get(user=survey_user)
    except models.Profile.DoesNotExist:
        profile = models.Profile()
        profile.user = survey_user

    survey = models.Survey.objects.get(survey_id=survey_id)

    profile.data = pickle.dumps(data)
    profile.survey = survey
    profile.valid = True
    profile.save()

def save_last_response(survey_user, participation, data):
    try:
        response = models.LastResponse.objects.get(user=survey_user)
    except models.LastResponse.DoesNotExist:
        response = models.LastResponse()
        response.user = survey_user

    response.participation = participation
    response.data = pickle.dumps(data)
    response.save()

class DateEncoder(json.JSONEncoder):
    """Encode dates and datetimes as lists."""
    def default(self, o):
        if isinstance(o, datetime):
            return [o.year, o.month, o.day, o.minute, o.second, o.microsecond]
        elif isinstance(o, date):
            return [o.year, o.month, o.day]
        return json.JSONEncoder.default(self, o)

def save_response_locally(user_id, survey_id, answers, date):
    """Save the response to the LocalResponse table."""
    if settings.STORE_RESPONSES_LOCALLY:
        if not date:
            from datetime import datetime
            date = datetime.now()
        lr = models.LocalResponse(date = date,
                                  user_id = user_id,
                                  survey_id = survey_id,
                                  answers = json.dumps(answers, cls=DateEncoder))
        lr.save()
    else:
      pass
