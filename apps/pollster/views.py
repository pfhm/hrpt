# -*- coding: utf-8 -*-
from django.utils import simplejson
from django.core.urlresolvers import get_resolver, reverse
from django.http import HttpResponse, HttpResponseRedirect, Http404
from django.contrib.auth.decorators import login_required
from django.shortcuts import render, render_to_response, redirect, get_object_or_404
from django.utils.safestring import mark_safe
from django.utils.translation import to_locale, get_language
from django.template import RequestContext
from django.contrib import messages
from django.contrib.admin.views.decorators import staff_member_required
from django.contrib.auth.views import redirect_to_login
from django.contrib.auth import authenticate, login
from django.conf import settings
from django.core import serializers

from django.db.models import get_model


import itertools
from collections import namedtuple

from cms import settings as cms_settings
from apps.survey.models import SurveyUser, SurveyIdCode
from .utils import get_user_profile
import json as vanilajson
from . import models, forms, fields, parser, json
import re, datetime, locale, csv, urlparse, urllib
import sys

hardcoded_survey= """{
  "question_columns": [
    {
      "pk": 2,
      "model": "pollster.questioncolumn",
      "fields": {
        "ordinal": 1,
        "question": 87,
        "title": "what is this"
      }
    },
    {
      "pk": 3,
      "model": "pollster.questioncolumn",
      "fields": {
        "ordinal": 2,
        "question": 87,
        "title": "this is great"
      }
    },
    {
      "pk": 4,
      "model": "pollster.questioncolumn",
      "fields": {
        "ordinal": 3,
        "question": 87,
        "title": "ok cool"
      }
    },
    {
      "pk": 5,
      "model": "pollster.questioncolumn",
      "fields": {
        "ordinal": 1,
        "question": 91,
        "title": "foo"
      }
    },
    {
      "pk": 6,
      "model": "pollster.questioncolumn",
      "fields": {
        "ordinal": 2,
        "question": 91,
        "title": "bar"
      }
    }
  ],
  "translation_column": [
    {
      "pk": 2,
      "model": "pollster.translationquestioncolumn",
      "fields": {
        "column": 2,
        "translation": 6,
        "title": "bra!!!"
      }
    },
    {
      "pk": 3,
      "model": "pollster.translationquestioncolumn",
      "fields": {
        "column": 3,
        "translation": 6,
        "title": "this is gread"
      }
    },
    {
      "pk": 4,
      "model": "pollster.translationquestioncolumn",
      "fields": {
        "column": 4,
        "translation": 6,
        "title": "bra!!!"
      }
    },
    {
      "pk": 5,
      "model": "pollster.translationquestioncolumn",
      "fields": {
        "column": 5,
        "translation": 6,
        "title": "foo"
      }
    },
    {
      "pk": 6,
      "model": "pollster.translationquestioncolumn",
      "fields": {
        "column": 6,
        "translation": 6,
        "title": "bar"
      }
    }
  ],
  "rules": [],
  "question_rows": [
    {
      "pk": 5,
      "model": "pollster.questionrow",
      "fields": {
        "ordinal": 1,
        "question": 87,
        "title": "n oidea"
      }
    },
    {
      "pk": 6,
      "model": "pollster.questionrow",
      "fields": {
        "ordinal": 2,
        "question": 87,
        "title": "aahahah i seee"
      }
    },
    {
      "pk": 7,
      "model": "pollster.questionrow",
      "fields": {
        "ordinal": 1,
        "question": 91,
        "title": "fooring"
      }
    },
    {
      "pk": 8,
      "model": "pollster.questionrow",
      "fields": {
        "ordinal": 2,
        "question": 91,
        "title": "thebaring"
      }
    }
  ],
  "object_options": [],
  "translation_option": [
    {
      "pk": 5083,
      "model": "pollster.translationoption",
      "fields": {
        "text": "I foo it",
        "translation": 6,
        "option": 386,
        "description": "ddddd"
      }
    },
    {
      "pk": 5085,
      "model": "pollster.translationoption",
      "fields": {
        "text": "dunno who foos it",
        "translation": 6,
        "option": 388,
        "description": "ddddd"
      }
    },
    {
      "pk": 5084,
      "model": "pollster.translationoption",
      "fields": {
        "text": "do you?",
        "translation": 6,
        "option": 387,
        "description": "asd"
      }
    }
  ],
  "translation_questions": [
    {
      "pk": 86,
      "model": "pollster.translationquestion",
      "fields": {
        "translation": 6,
        "error_message": "",
        "question": 59,
        "description": "",
        "title": ""
      }
    },
    {
      "pk": 140,
      "model": "pollster.translationquestion",
      "fields": {
        "translation": 6,
        "error_message": "",
        "question": 87,
        "description": "text text text",
        "title": "matriz!!!!"
      }
    },
    {
      "pk": 143,
      "model": "pollster.translationquestion",
      "fields": {
        "translation": 6,
        "error_message": "",
        "question": 91,
        "description": "",
        "title": ""
      }
    }
  ],
  "subject_options": [],
  "translation_row": [
    {
      "pk": 5,
      "model": "pollster.translationquestionrow",
      "fields": {
        "translation": 6,
        "title": "vet inte",
        "row": 5
      }
    },
    {
      "pk": 6,
      "model": "pollster.translationquestionrow",
      "fields": {
        "translation": 6,
        "title": "I seee",
        "row": 6
      }
    },
    {
      "pk": 7,
      "model": "pollster.translationquestionrow",
      "fields": {
        "translation": 6,
        "title": "fooing",
        "row": 7
      }
    },
    {
      "pk": 8,
      "model": "pollster.translationquestionrow",
      "fields": {
        "translation": 6,
        "title": "thebaring",
        "row": 8
      }
    }
  ],
  "survey_translations": [
    {
      "pk": 6,
      "model": "pollster.translationsurvey",
      "fields": {
        "status": "PUBLISHED",
        "survey": 3,
        "language": "sv",
        "title": "Test"
      }
    }
  ],
  "survey_questions": [
    {
      "pk": 59,
      "model": "pollster.question",
      "fields": {
        "ordinal": 0,
        "regex": "",
        "data_name": "timestamp",
        "is_mandatory": false,
        "description": "",
        "data_type": 6,
        "title": "Compilation Date",
        "open_option_data_type": null,
        "visual": "",
        "survey": 3,
        "error_message": "",
        "starts_hidden": false,
        "type": "builtin",
        "tags": ""
      }
    },
    {
      "pk": 87,
      "model": "pollster.question",
      "fields": {
        "ordinal": 2,
        "regex": "",
        "data_name": "wut_matrix",
        "is_mandatory": false,
        "description": "",
        "data_type": 2,
        "title": "",
        "open_option_data_type": null,
        "visual": "",
        "survey": 3,
        "error_message": "",
        "starts_hidden": false,
        "type": "matrix-entry",
        "tags": ""
      }
    },
    {
      "pk": 91,
      "model": "pollster.question",
      "fields": {
        "ordinal": 3,
        "regex": "",
        "data_name": "matt",
        "is_mandatory": false,
        "description": "",
        "data_type": 2,
        "title": "",
        "open_option_data_type": null,
        "visual": "select",
        "survey": 3,
        "error_message": "",
        "starts_hidden": false,
        "type": "matrix-select",
        "tags": ""
      }
    }
  ],
  "survey": [
    {
      "pk": 3,
      "model": "pollster.survey",
      "fields": {
        "status": "PUBLISHED",
        "updated": "2015-12-14T13:08:05",
        "parent": null,
        "created": "2015-11-04T12:11:24",
        "title": "test",
        "version": "",
        "shortname": "test"
      }
    }
  ],
  "translation_survey": [
    {
      "pk": 6,
      "model": "pollster.translationsurvey",
      "fields": {
        "status": "PUBLISHED",
        "survey": 3,
        "language": "sv",
        "title": "Test"
      }
    }
  ],
  "options": [
    {
      "pk": 386,
      "model": "pollster.option",
      "fields": {
        "ordinal": 1,
        "virtual_type": null,
        "virtual_sup": "",
        "group": "",
        "description": "",
        "column": null,
        "text": "I foo it",
        "clone": null,
        "question": 91,
        "is_virtual": false,
        "is_open": false,
        "value": "22",
        "starts_hidden": false,
        "virtual_regex": "",
        "virtual_inf": "",
        "row": null
      }
    },
    {
      "pk": 388,
      "model": "pollster.option",
      "fields": {
        "ordinal": 2,
        "virtual_type": null,
        "virtual_sup": "",
        "group": "",
        "description": "",
        "column": null,
        "text": "I don't know who foos it",
        "clone": null,
        "question": 91,
        "is_virtual": false,
        "is_open": false,
        "value": "111",
        "starts_hidden": false,
        "virtual_regex": "",
        "virtual_inf": "",
        "row": null
      }
    },
    {
      "pk": 387,
      "model": "pollster.option",
      "fields": {
        "ordinal": 3,
        "virtual_type": null,
        "virtual_sup": "",
        "group": "",
        "description": "",
        "column": null,
        "text": "somedude fooes it",
        "clone": null,
        "question": 91,
        "is_virtual": false,
        "is_open": false,
        "value": "1",
        "starts_hidden": false,
        "virtual_regex": "",
        "virtual_inf": "",
        "row": null
      }
    }
  ]
}
"""

#This stuff is ... intense
# get rid of it!
#From here....

def request_render_to_response(req, *args, **kwargs):
    kwargs['context_instance'] = RequestContext(req)
    return render_to_response(*args, **kwargs)

def get_object_or_none(model, **kwargs):
    try:
        return model.objects.get(**kwargs)
    except model.DoesNotExist:
        return None

def retry(f, *args, **kwargs):
    tries = 2
    while tries:
        try:
            return f(*args, **kwargs)
        except:
            tries -= 1
            if tries == 0:
                raise

# ... until here!


@staff_member_required
def survey_list(request):
    surveys = models.Survey.objects.all()
    form_import = forms.SurveyImportForm()
    return request_render_to_response(request, 'pollster/survey_list.html', {
        "surveys": surveys,
        "form_import": form_import
    })

@staff_member_required
def survey_add(request):
    survey = models.Survey()
    if (request.method == 'POST'):
        form = forms.SurveyXmlForm(request.POST)
        if form.is_valid():
            # create and redirect
            parser.survey_update_from_xhtml(survey, form.cleaned_data['surveyxml'])
            return redirect(survey)
    # return an empty survey structure
    virtual_option_types = models.VirtualOptionType.objects.all()
    question_data_types = models.QuestionDataType.objects.all()
    rule_types = models.RuleType.objects.all()
    return request_render_to_response(request, 'pollster/survey_edit.html', {
        "survey": survey,
        "virtual_option_types": virtual_option_types,
        "question_data_types": question_data_types,
        "rule_types": rule_types,
        "CMS_MEDIA_URL": cms_settings.CMS_MEDIA_URL,
    })

@staff_member_required
def survey_edit(request, id):
    survey = get_object_or_404(models.Survey, pk=id)
    if not survey.is_editable:
        return redirect(survey_test, id=id)
    if request.method == 'POST':
        form = forms.SurveyXmlForm(request.POST)
        if form.is_valid():
            parser.survey_update_from_xhtml(survey, form.cleaned_data['surveyxml'])
            return redirect(survey)
    virtual_option_types = models.VirtualOptionType.objects.all()
    question_data_types = models.QuestionDataType.objects.all()
    rule_types = models.RuleType.objects.all()
    return request_render_to_response(request, 'pollster/survey_edit.html', {
        "survey": survey,
        "virtual_option_types": virtual_option_types,
        "question_data_types": question_data_types,
        "rule_types": rule_types,
        "CMS_MEDIA_URL": cms_settings.CMS_MEDIA_URL,
    })

@staff_member_required
def survey_publish(request, id):
    survey = get_object_or_404(models.Survey, pk=id)
    if (request.method == 'POST'):
        errors = survey.publish()
        if errors:
            messages.error(request, 'Unable to publish the survey, please check the errors below')
            for error in errors[:5]:
                messages.warning(request, error)
        return redirect(survey)
    return redirect(survey)

@staff_member_required
def survey_unpublish(request, id):
    survey = get_object_or_404(models.Survey, pk=id)
    if (request.method == 'POST'):
        survey.unpublish()
        return redirect(survey)
    return redirect(survey)


@staff_member_required
def survey_test(request, id, language=None):
    survey = get_object_or_404(models.Survey, pk=id)

    #Notice that the language parameter passed to this as a url paramter _is ignored!_
    #TODO hardcode language, update urls, remove language paramter on this method
    language = get_language()
    translation = models.TranslationSurvey.objects.get(survey=survey, language=language)

    survey.set_translation_survey(translation)

    survey_user = SurveyUser.objects.get(user=request.user)
    IdCodeObject = get_object_or_404(SurveyIdCode, surveyuser_global_id=survey_user.global_id)
    prefilled_data = {"PREFIL_BIRTHYEAR": IdCodeObject.fodelsedatum}
    form = None

    if request.method == 'POST':
        data = request.POST.copy()
        data['user'] = request.user.id
        data['global_id'] = survey_user.global_id
        data['timestamp'] = datetime.datetime.now()
        form = survey.as_form()(data)

        #TODO: probably want to remove this next url crap
        if form.is_valid():
            if language:
                next_url = _get_next_url(request, reverse(survey_test, kwargs={'id':id, 'language': language}))
            else:
                next_url = _get_next_url(request, reverse(survey_test, kwargs={'id':id}))
            return HttpResponseRedirect(next_url)
        else:
            survey.set_form(form)

    return request_render_to_response(request, 'pollster/survey_test.html', {
        "language": language,
        "locale_code": "sv-SE", #TODO: oh well... remove internationalization
        "survey": survey,
        "default_postal_code_format": fields.PostalCodeField.get_default_postal_code_format(),
        "last_participation_data_json": json.dumps(prefilled_data),
        "language": language,
        "form": form
    })


@staff_member_required
def survey_translation_list_or_add(request, id):
    #TODO: refactor this... python pyramids of doom only take half the work to refactor! we're lucky!
    survey = get_object_or_404(models.Survey, pk=id)
    form_add = forms.SurveyTranslationAddForm()
    if request.method == 'POST':
        form_add = forms.SurveyTranslationAddForm(request.POST)
        if form_add.is_valid():
            language = form_add.cleaned_data['language']
            translations = survey.translationsurvey_set.all().filter(language=language)[0:1]
            if translations:
                translation = translations[0]
            else:
                translation = models.TranslationSurvey(survey=survey, language=language)
                survey.set_translation_survey(translation)
                survey.translation_survey.save()
                for question in survey.questions:
                    question.translation_question.save()
                    for option in question.options:
                        option.translation_option.save()
                    for row in question.rows:
                        row.translation_row.save()
                    for column in question.columns:
                        column.translation_column.save()

            return redirect(translation)
    return request_render_to_response(request, 'pollster/survey_translation_list.html', {
        "survey": survey,
        "form_add": form_add
    })


@staff_member_required
def survey_translation_edit(request, id, language):
    survey = get_object_or_404(models.Survey, pk=id)
    translation = get_object_or_404(models.TranslationSurvey, survey=survey, language=language)
    survey.set_translation_survey(translation)
    if request.method == 'POST':
        forms = []
        forms.append( survey.translation.as_form(request.POST) )
        for question in survey.questions:
            forms.append( question.translation.as_form(request.POST) )
            for row in question.rows:
                forms.append( row.translation.as_form(request.POST) )
            for column in question.columns:
                forms.append( column.translation.as_form(request.POST) )
            for option in question.options:
                forms.append( option.translation.as_form(request.POST) )
        if all(f.is_valid() for f in forms):
            for form in forms:
                form.save()
            messages.success(request, 'Translation saved successfully.')
            return redirect(translation)
    return request_render_to_response(request, 'pollster/survey_translation_edit.html', {
        "survey": survey,
        "translation": translation
    })

@staff_member_required
def survey_chart_list_or_add(request, id):
    survey = get_object_or_404(models.Survey, pk=id)
    form_add = forms.SurveyChartAddForm()
    if request.method == 'POST':
        form_add = forms.SurveyChartAddForm(request.POST)
        if form_add.is_valid():
            shortname = form_add.cleaned_data['shortname']
            charts = survey.chart_set.all().filter(shortname=shortname)[0:1]
            if charts:
                chart = charts[0]
            else:
                chart = models.Chart(survey=survey, shortname=shortname)
                chart.type = models.ChartType.objects.all().order_by('id')[0]
                chart.save()
            return redirect(chart)
    return request_render_to_response(request, 'pollster/survey_chart_list.html', {
        "survey": survey,
        "form_add": form_add
    })


@staff_member_required
def survey_chart_edit(request, id, shortname):
    survey = get_object_or_404(models.Survey, pk=id)
    chart = get_object_or_404(models.Chart, survey=survey, shortname=shortname)
    form_chart = forms.SurveyChartEditForm(instance=chart)
    if request.method == 'POST':
        form_chart = forms.SurveyChartEditForm(request.POST, instance=chart)
        if form_chart.is_valid():
            form_chart.save()
            if not chart.update_table():
                msg = 'Unable to gather some data. Please check the SQL statements.'
                if chart.is_published:
                    messages.error(request, msg)
                else:
                    messages.warning(request, msg)
            return redirect(chart)
    return request_render_to_response(request, 'pollster/survey_chart_edit.html', {
        "survey": survey,
        "chart": chart,
        "form_chart": form_chart,
    })

@staff_member_required
def survey_chart_data(request, id, shortname):
    survey = get_object_or_404(models.Survey, pk=id)
    chart = get_object_or_404(models.Chart, survey=survey, shortname=shortname)
    survey_user = _get_active_survey_user(request)
    user_id = request.user.id
    global_id = survey_user and survey_user.global_id
    return HttpResponse(chart.to_json(user_id, global_id), mimetype='application/json')

@staff_member_required
def survey_chart_map_tile(request, id, shortname, z, x, y):
    if int(z) > 22:
        raise Http404
    survey = get_object_or_404(models.Survey, pk=id)
    chart = get_object_or_404(models.Chart, survey=survey, shortname=shortname)
    survey_user = _get_active_survey_user(request)
    user_id = request.user.id
    global_id = survey_user and survey_user.global_id
    return HttpResponse(retry(chart.get_map_tile, user_id, global_id, int(z), int(x), int(y)), mimetype='image/png')

@staff_member_required
def survey_chart_map_click(request, id, shortname, lat, lng):
    survey = get_object_or_404(models.Survey, pk=id)
    chart = get_object_or_404(models.Chart, survey=survey, shortname=shortname)
    return HttpResponse(chart.get_map_click(float(lat), float(lng)), mimetype='application/json')

@staff_member_required
def survey_results_csv(request, id):
    survey = get_object_or_404(models.Survey, pk=id)
    now = datetime.datetime.now()
    response = HttpResponse(mimetype='text/csv')
    response['Content-Disposition'] = 'attachment; filename=survey-results-%d-%s.csv' % (survey.id, format(now, '%Y%m%d%H%M'))
    response.write(u'\ufeff'.encode('utf8'))
    writer = csv.writer(response)
    survey.write_csv(writer)
    return response

@staff_member_required
def survey_results_csv_extended(request, id):
    #TODO: Refactor this nightmare... jesus... how is it possible, so much crap in a single tiny function

    #TODO: initialize the form variable here, later assign its contents if the request is post
    survey = get_object_or_404(models.Survey, pk=id)
    if request.method == 'POST': # If the form has been submitted...
        form = forms.SurveyExtendedResultsForm(request.POST) # A form bound to the POST data
        if form.is_valid():
            # Process the data in form.cleaned_data
            now = datetime.datetime.now()
            response = HttpResponse(mimetype='text/csv')
            response['Content-Disposition'] = 'attachment; filename=survey-results-%d-%s.csv' % (survey.id, format(now, '%Y%m%d%H%M'))
            response.write(u'\ufeff'.encode('utf8'))
            #side effecting the response... great...
            writer = csv.writer(response)
            survey.write_csv(writer, extra_fields = form.cleaned_data)
            return response

    else:
        #this is stupid
        # Create the form in the right block (above the if) then just bind it in here
        #http://stackoverflow.com/questions/5263722/in-django-how-do-i-late-bind-an-unbound-form
        form = forms.SurveyExtendedResultsForm() # An unbound form

    return render_to_response('pollster/extended_results.html', {
        'form': form,
        'survey': survey,
    }, context_instance=RequestContext(request))

@staff_member_required
def survey_export_xml(request, id):
    survey = get_object_or_404(models.Survey, pk=id)
    now = datetime.datetime.now()
    response = render(request, 'pollster/survey_export.xml', { "survey": survey }, content_type='application/xml')
    response['Content-Disposition'] = 'attachment; filename=survey-export-%d-%s.xml' % (survey.id, format(now, '%Y%m%d%H%M'))
    return response


#TODO: put the body of these functions in their own module

@staff_member_required
def survey_export_new(request, id):
    survey = get_object_or_404(models.Survey, pk=id)
    survey_questions = survey.question_set.all()
    survey_translations = survey.translationsurvey_set.all()

    all_options_nested          = [ question.option_set.all() for question in survey_questions ]
    all_transl_questions_nested = [ trasl_survey.translationquestion_set.all() for trasl_survey in survey_translations ]
    all_transl_columns_nested   = [ trasl_survey.translationquestioncolumn_set.all() for trasl_survey in survey_translations ]
    all_transl_rows_nested      = [ translationsurvey.translationquestionrow_set.all() for translationsurvey in survey_translations ]
    all_transl_options_nested   = [ translationsurvey.translationoption_set.all() for translationsurvey in survey_translations ]
    all_rules_nested            = [ q.subject_of_rules.all() for q in survey_questions ]
    all_rows_nested             = [ q.rows for q in survey_questions ]
    all_columns_nested          = [ q.columns for q in survey_questions ]


    all_options          = flaten(all_options_nested)
    all_transl_questions = flaten(all_transl_questions_nested)
    all_transl_columns   = flaten(all_transl_columns_nested)
    all_transl_rows      = flaten(all_transl_rows_nested)
    all_transl_options   = flaten(all_transl_options_nested)
    all_rules            = flaten(all_rules_nested)
    all_rows             = flaten(all_rows_nested)
    all_columns          = flaten(all_columns_nested)


    subject_options_nested = [ rule.subject_options.all() for rule in all_rules ]
    object_options_nested  = [ rule.object_options.all() for rule in all_rules ]

    subject_options = flaten(subject_options_nested)
    object_options = flaten(object_options_nested)


    serialize_this = {
        'survey':                 serializers.serialize("python", [survey],),
        'survey_questions':       serializers.serialize("python", survey_questions),
        'survey_translations':    serializers.serialize("python", survey_translations),
        'options' :               serializers.serialize("python", all_options),
        "question_rows" :         serializers.serialize("python", all_rows),
        "question_columns" :      serializers.serialize("python", all_columns),
        "rules":                  serializers.serialize("python", all_rules),
        "translation_survey" :    serializers.serialize("python", survey_translations),
        "translation_questions" : serializers.serialize("python", all_transl_questions),
        "translation_column" :    serializers.serialize("python", all_transl_columns),
        "translation_row" :       serializers.serialize("python", all_transl_rows),
        "translation_option":     serializers.serialize("python", all_transl_options),
        "subject_options":        serializers.serialize("python", subject_options),
        "object_options":         serializers.serialize("python", object_options),
        #TODO: details of all rules
    }

    serialized_survey = vanilajson.dumps(serialize_this,indent=2)
    return HttpResponse(serialized_survey, content_type="application/json")


#TODO: move this up?
ModelKey = namedtuple('ModelKey', ['model', 'pk'])


def survey_import_new(request):

    # we use this to map old keys present in the exported file, to new keys obtained on insert
    keys_save = {}

    data_from_json = vanilajson.loads(hardcoded_survey) #TODO implement this

    _save_model_from_serialized_data(data_from_json['survey'][0])

    # survey questions


    #TODO: make this a list of named tupples instead

    import_entities_definition = (
        ("survey" ,[] ),
        ("survey_questions": ["survey", "data_type"]),
        ("survey_translations":["survey"]),
        ('options', ["question"]), # TODO: possibly row and column, check this
        ("question_rows", ["question"]),
        ("question_columns", ["question"]),
        ("rules", []), #TODO: this!!!!
        ("translation_survey", ["survey"]),
        ("translation_questions", ["translation", "survey"]),
        ("translation_column", ["translation", "column"]),
        ("translation_row", ["translation", "row"]),
        ("translation_option", ["translation", "option"]),
        ("subject_options", []), #TODO
        ("object_options", []), #TODO
        #TODO. go throught tables and check if any missing
    )



    for definition in import_entities_definition:
        for serialized_instance in data_from_json[definition[0]]:
            keys_save = _save_model_from_serialized_data(serialized_instance, definition[1], keys_save)

    return HttpResponse(str(keys_save))


def _resolve_foreign_key(serialized_instance, key_list):
    for key in key_list:
        new_key = key + "_id"

        lookup_key = ModelKey("pollster." + key, serialized_instance["fields"][key])

        if lookup_key in keys_save:
            value = keys_save[lookup_key]
        else:
            value = serialized_instance["fields"][key]

        serialized_instance["fields"][new_key] = value
        del serialized_instance["fields"][key]
    return serialized_instance


def _save_model_from_serialized_data(serialized_instance, foreign_key_field_names, keys_save):
    ModelClass = get_model(*serialized_instance["model"].split('.',1) )
    serialized_instance = _resolve_foreign_key(foreign_key_field_names)
    new_instance = ModelClass(**serialized_instance["fields"])
    new_instance.save()
    key = ModelKey(serialized_instance['model'], serialized_instance['pk'])
    keys_save[key] = new_instance.id
    return keys_save


def flaten(list2d):
    return list(itertools.chain.from_iterable(list2d))


@staff_member_required
def survey_import(request):
    form_import = forms.SurveyImportForm()
    if request.method == 'POST':
        form_import = forms.SurveyImportForm(request.POST, request.FILES)
        if form_import.is_valid():
            xml = request.FILES['data'].read()
            survey = models.Survey()
            # create and redirect
            parser.survey_update_from_xml(survey, xml)
            return redirect(survey)
    return redirect(survey_list)

def chart_data(request, survey_shortname, chart_shortname):
    chart = None
    if request.user.is_active and request.user.is_staff:
        survey = get_object_or_404(models.Survey, shortname=survey_shortname)
        chart = get_object_or_404(models.Chart, survey=survey, shortname=chart_shortname)
    else:
        survey = get_object_or_404(models.Survey, shortname=survey_shortname, status='PUBLISHED')
        chart = get_object_or_404(models.Chart, survey=survey, shortname=chart_shortname, status='PUBLISHED')
    survey_user = _get_active_survey_user(request)
    user_id = request.user.id
    global_id = survey_user and survey_user.global_id
    return HttpResponse(chart.to_json(user_id, global_id), mimetype='application/json')

def map_tile(request, survey_shortname, chart_shortname, z, x, y):
    if int(z) > 22:
        raise Http404
    chart = None
    if request.user.is_active and request.user.is_staff:
        survey = get_object_or_404(models.Survey, shortname=survey_shortname)
        chart = get_object_or_404(models.Chart, survey=survey, shortname=chart_shortname)
    else:
        survey = get_object_or_404(models.Survey, shortname=survey_shortname, status='PUBLISHED')
        chart = get_object_or_404(models.Chart, survey=survey, shortname=chart_shortname, status='PUBLISHED')
    survey_user = _get_active_survey_user(request)
    user_id = request.user.id
    global_id = survey_user and survey_user.global_id
    return HttpResponse(retry(chart.get_map_tile, user_id, global_id, int(z), int(x), int(y)), mimetype='image/png')

def map_click(request, survey_shortname, chart_shortname, lat, lng):
    chart = None
    if request.user.is_active and request.user.is_staff:
        survey = get_object_or_404(models.Survey, shortname=survey_shortname)
        chart = get_object_or_404(models.Chart, survey=survey, shortname=chart_shortname)
    else:
        survey = get_object_or_404(models.Survey, shortname=survey_shortname, status='PUBLISHED')
        chart = get_object_or_404(models.Chart, survey=survey, shortname=chart_shortname, status='PUBLISHED')
    return HttpResponse(chart.get_map_click(float(lat), float(lng)), mimetype='application/json')

# based on http://djangosnippets.org/snippets/2059/

def urls(request, prefix=''):
    """
        Returns javascript for mapping service endpoint names to urls.

        For this view to work properly, all urls that are to be made
        available and are using regular expressions for defining
        parameters must use named parameters.

        The view uses Django internal url resolver to iterate over a list
        of all currently defined url patterns.  It looks for named patterns
        and replaces each named regex group definition the group name enclosed
        in curley braces.  Url pattern names will be translated into
        javascript variable names by converting all letters to the upper
        case and replacing '-' with '_'.
        """
    resolver = get_resolver(None)

    urls = {}

    for name in resolver.reverse_dict:
        if isinstance(name, str) and name.startswith(prefix):
            url_regex = resolver.reverse_dict.get(name)[1]
            param_names = resolver.reverse_dict.get(name)[0][0][1]
            arg_pattern = r'\(\?P\<[^\)]+\)'  #matches named groups in the form of (?P<name>pattern)

            i = 0
            for match in re.findall(arg_pattern, url_regex):
                url_regex = url_regex.replace(match, "{%s}"%param_names[i])
                i += 1

            urls[name] = "/" + url_regex[:-1]

    return request_render_to_response(request, "pollster/urls.js", {'urls':urls}, mimetype="application/javascript")

def _get_active_survey_user(request):
    gid = request.GET.get('gid', None)
    if gid is None or not request.user.is_active:
        return None
    else:
        return get_object_or_404(SurveyUser, global_id=gid, user=request.user)

def _get_next_url(request, default):
    url = request.GET.get('next', default)
    survey_user = _get_active_survey_user(request)
    if survey_user:
        url = '%s?gid=%s' % (url, survey_user.global_id)
    return url


def specialPrint(msg):
    print >> sys.stderr,msg
