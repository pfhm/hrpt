# -*- coding: utf-8 -*-
from datetime import datetime
import time

from django import forms
from django.template import Context, loader, RequestContext
from django.http import HttpResponse, HttpResponseRedirect, Http404
from django.db import connection, transaction, DatabaseError
from django.core.urlresolvers import reverse
from django.shortcuts import render_to_response, get_object_or_404
from django.contrib.auth.decorators import login_required
from django.conf import settings
from django.utils.safestring import mark_safe
from django.utils.translation import ugettext_lazy as _
from django.contrib import messages
from django.db import connection
from django.utils.datastructures import MultiValueDictKeyError
from django.utils.translation import to_locale, get_language
import re, locale

from apps.survey import utils, models, forms

from apps.pollster.models import TranslationSurvey
from apps.pollster import views as pollster_views
from apps.pollster import utils as pollster_utils
from apps.pollster import fields as pollser_field_types
from .survey import ( Specification,
                      FormBuilder,
                      JavascriptBuilder,
                      get_survey_context, )
import apps.pollster as pollster
import pickle
from django.contrib.auth import logout

import sys
import datetime
from django.conf import settings
import json


survey_form_helper = None
profile_form_helper = None


def get_active_survey_user(request):
    gid = request.GET.get('gid', None)
    if gid is None:
        return None
    else:
        try:
            survey_user = models.SurveyUser.objects.get(global_id=gid,
                                                 user=request.user)
            err = False
            if survey_user.user == None:
                err = True
            else:
                # WTF... why isn't this in the above query? Kill me now.
                #TODO: fix it, obviously.
                if survey_user.user.is_active == False:
                        err = True

            if err:
                logout(request)

            return survey_user
        except models.SurveyUser.DoesNotExist:
            raise ValueError()



@login_required
def thanks(request):
    try:
        survey_user = get_active_survey_user(request)
        if not survey_user:
            specialPrint('No gid in url go to select page!')
            url = '%s?next=%s' % (reverse(select_survey_user), reverse(thanks))
            return HttpResponseRedirect(url)
    except ValueError:
        #TODO: this cannot be... we should probably remove thte try...except
        pass

    #Check idcode
    redirect = _get_redirect_url_if_not_idcode('apps.survey.views.thanks',survey_user)
    if redirect:
        # it didn't have an idcode in the url, so we got a url in redirect, now with idcode
        # don't balme me for this spaghetti
        return HttpResponseRedirect(redirect)

    # if we're here, he have an idcode!!!!! And a survey_user!!!
    # the road was long and painful

    return HttpResponseRedirect('/valkommen/?gid=%s' % survey_user.global_id)



@login_required
def thanks_profile(request):
    try:
        survey_user = get_active_survey_user(request)
    except ValueError:
        pass

    return render_to_response('survey/thanks_profile.html', {'base_template': "survey/base.html", 'person': survey_user},
        context_instance=RequestContext(request))

@login_required
def idcode_save(request):
    idcode_id = None
    fodelsedatum = None
    gid = None
    error = False
    idcode = None
    survey_user = None

    try:
        idcode_id = request.POST['idkod']
        fodelsedatum = request.POST['fodelsedatum']
        gid = request.POST['global_id']
        survey_user = models.SurveyUser.objects.get(global_id=gid)
        specialPrint("idcode_save person:" + gid)
    except MultiValueDictKeyError:
        messages.add_message(request, messages.ERROR, (u'Ett tekniskt fel skedde då formuläret skickades in.'))
        error = True

    if not error:
        specialPrint("idcode_save person:" + gid)
        if idcode_id == None or idcode_id == '':
            error = True
            messages.add_message(request, messages.ERROR, (u'Du måste ange en kod.'))

        if fodelsedatum == None or fodelsedatum == '':
            error = True
            messages.add_message(request, messages.ERROR, (u'Du måste ange ett födelsedatum.'))
        elif re.match('^[0-9]{4}$', fodelsedatum) is None:
            error = True
            messages.add_message(request, messages.ERROR, (u'Födelsedatum måste vara angivet i formatet ÅÅÅÅ.'))
        else:
            year = int(fodelsedatum)
            current_year = datetime.date.today().year
            old_age_threshold = current_year - 85
            if year > current_year or year < old_age_threshold:
                error = True
                messages.add_message(request, messages.ERROR, ('Årtalet måste vara mellan' + str(old_age_threshold) + ' och ' + str(current_year) + '.'))

    if not error:
        try:
            idcode = models.SurveyIdCode.objects.get(idcode=idcode_id)
        except:
            error = True
            specialPrint("Hittade inte idkod med varde" + idcode_id)
            messages.add_message(request, messages.ERROR, ('Hittade ingen kod med värdet ' + str(idcode_id) + '. Var vänlig kontrollera att du matat in koden rätt.'))

        if idcode != None and idcode.surveyuser_global_id!=None and idcode.surveyuser_global_id!=survey_user.global_id:
            error = True
            specialPrint("Idkod med varde" + idcode_id + "ar redan upptaget")
            messages.add_message(request, messages.ERROR, ('Koden ' + str(idcode_id) + ' är redan upptagen'))

        if idcode != None and idcode.fodelsedatum!=None and idcode.fodelsedatum != fodelsedatum:
            error = True
            messages.add_message(request, messages.ERROR, ('Angivet födelsedatum verkar inte stämma'))

    if error:

        return render_to_response('survey/id_code.html', {'idcode': idcode_id,
                                                          'birthdate': fodelsedatum,
                                                          'base_template': "survey/base.html",
                                                          'person': survey_user},
                                  context_instance=RequestContext(request))

    idcode.surveyuser_global_id = gid
    if idcode.fodelsedatum == None:
        idcode.fodelsedatum = fodelsedatum
    idcode.save()
    return thanks(request)


@login_required
def select_survey_user(request, template='survey/select_user.html'):
    next = request.GET.get('next', None)
    if next is None:
        next = reverse(index)

    users = models.SurveyUser.objects.filter(user=request.user, deleted=False)
    total = len(users)
    if total == 0:
        survey_user = models.SurveyUser.objects.create(
            user=request.user,
            name=request.user.username,
        )
        url = '%s?gid=%s' % (next, survey_user.global_id)
        return HttpResponseRedirect(url)

    elif total == 1:
        survey_user = users[0]
        url = '%s?gid=%s' % (next, survey_user.global_id)
        return HttpResponseRedirect(url)

    return render_to_response(template, {
        'users': users,
        'next': next,
    }, context_instance=RequestContext(request))

def specialPrint(msg):
    print >> sys.stderr,msg

@login_required
def idcode_open(request):
    try:
        survey_user = get_active_survey_user(request)
    except ValueError:
        raise Http404()

    return render_to_response(
        'survey/id_code.html',
        {
            'base_template': "survey/base.html",
            'person': survey_user},
        context_instance=RequestContext(request)
    )

def _get_redirect_url_if_not_idcode(str_url_next,survey_user):
    idcode = models.SurveyIdCode.objects.filter(surveyuser_global_id=survey_user.global_id)
    if not idcode:
        specialPrint("redirect to idcode page!!")
        url = reverse('apps.survey.views.idcode_open')
        url_next = reverse(str_url_next)
        url = '%s?gid=%s&next=%s' % (url, survey_user.global_id, url_next)
        specialPrint(url)
        return url
    return None



# Some sane code...
@login_required
def show_survey(request, survey_short_name):

    #Saving the response drafts so the users don't loose their replies
    #this should be put in its own route
    if "draft" in request.GET and request.method == 'POST':
        _save_survey_response_draft(request)
        return HttpResponse("Form state saved")

    # until we update to django 1.8, get_language() will allways return LANGUAGE_CODE
    # which is defined in the settings. But the best at this point, is removing translations altogether
    language = get_language()

    #locale_code = locale.locale_alias.get(language)

    survey = get_object_or_404(pollster.models.Survey, shortname=survey_short_name, status="PUBLISHED")

    translation = TranslationSurvey.objects.get(survey=survey, language=language, status="PUBLISHED")
    survey.set_translation_survey(translation)

    global_id = request.GET.get('gid', None)
    survey_user = models.SurveyUser.objects.get(global_id=global_id, user=request.user)

    if survey.get_last_participation_data(request.user.id, global_id):
        return HttpResponseRedirect('/already-answered')

    IdCodeObject = get_object_or_404(models.SurveyIdCode, surveyuser_global_id=global_id)


    try:
        survey_response_draft = models.SurveyResposeDraft.objects.get( global_id = global_id, survey_id=survey.id)
        prefilled_data = json.loads(survey_response_draft.form_data)
    except:
        prefilled_data = {}

    # we inject the birthyear that was provided with the idcode so we know how old
    # the user is. There must be a question with this name in the survey for this to be usable
    # tipically it would be set to hidden.
    prefilled_data['PREFIL_BIRTHYEAR'] = IdCodeObject.fodelsedatum

    form = survey.as_form()(prefilled_data)
    #survey.set_form(form)

    if request.method == 'POST':
        data = request.POST.copy()
        data['user'] = request.user.id
        data['global_id'] = global_id
        data['timestamp'] = datetime.datetime.now()

        form = survey.as_form()(data)

        if form.is_valid():
            form.save()
            return HttpResponseRedirect('/survey-successfully-submited')
        else:
            survey.set_form(form)

    return render_to_response(
        'pollster/survey_run.html',
        {
            "language": language,
            "locale_code": "sv-SE", # let's just hardcode this for now
            "survey": survey,
            "default_postal_code_format": pollser_field_types.PostalCodeField.get_default_postal_code_format(),
            "last_participation_data_json": json.dumps(prefilled_data),
            "form": form,
            "person": survey_user
        },
        context_instance=RequestContext(request)  #don't know why this is necessairy, nobody does apparently. See https://github.com/django-compressor/django-compressor/issues/483#issuecomment-52243164
    )


def _save_survey_response_draft(request):
    raw_data = json.loads(request.raw_post_data) # on django 1.4 and latter, this changes to request.body instead
    survey_id = raw_data['survey_id']
    questions_data = raw_data['form_data']

    global_id = request.GET.get('gid')

    #this is to make sure the guid belongs to this user
    # it will blow up otherwise as it should.
    models.SurveyUser.objects.get(global_id=global_id, user=request.user)

    try:
        survey_draft = models.SurveyResposeDraft.objects.get( global_id = global_id, survey_id=survey_id)
    except:
        survey_draft = models.SurveyResposeDraft(
            global_id = global_id,
            survey_id = survey_id
        )

    survey_draft.timestamp = int(time.time())
    survey_draft.form_data = json.dumps(raw_data['form_data'])
    survey_draft.save()


def no_thanks(request):
    """
    redirects to link in survey generator.
    This is the main
    """
    return HttpResponseRedirect('https://reply.surveygenerator.com/go.aspx?U=22277ih5v4DGFEKv7gWjt')

# end of sane code.
# ------------------------------------------------------------------------------

@login_required
def people_edit(request):
    try:
        survey_user = get_active_survey_user(request)
    except ValueError:
        raise Http404()
    if survey_user is None:
        url = '%s?next=%s' % (reverse(select_survey_user), reverse(people_edit))
        return HttpResponseRedirect(url)
    elif survey_user.deleted == True:
        raise Http404()

    if request.method == 'POST':
        form = forms.AddPeople(request.POST)
        if form.is_valid():
            survey_user.name = form.cleaned_data['name']
            survey_user.save()

            return HttpResponseRedirect(reverse(people))
    else:
        form = forms.AddPeople(initial={'name': survey_user.name})

    return render_to_response('survey/people_edit.html', {'base_template': "survey/base.html",'form': form},
                              context_instance=RequestContext(request))



@login_required
def people_remove(request):
    try:
        survey_user = get_active_survey_user(request)
    except ValueError:
        raise Http404()

    if survey_user is None:
        url = reverse(people)
        return HttpResponseRedirect(url)
    elif survey_user.deleted == True:
        raise Http404()

    confirmed = request.POST.get('confirmed', None)

    if confirmed == 'Y':
        survey_user.deleted = True
        survey_user.save()

        url = reverse(people)
        return HttpResponseRedirect(url)

    elif confirmed == 'N':
        url = reverse(people)
        return HttpResponseRedirect(url)

    else:
        return render_to_response('survey/people_remove.html', {'person': survey_user},
                              context_instance=RequestContext(request))

@login_required
def people_add(request):
    if request.method == 'POST':
        form = forms.AddPeople(request.POST)
        if form.is_valid():
            survey_user = models.SurveyUser()
            survey_user.user = request.user
            survey_user.name = form.cleaned_data['name']
            survey_user.save()

            messages.add_message(request, messages.INFO,
                _('A new person has been added.'))

            next = request.GET.get('next', None)
            if next is None:
                url = reverse(people)
            else:
                url = '%s?gid=%s' % (next, survey_user.global_id)
            return HttpResponseRedirect(url)

    else:
        form = forms.AddPeople()

    return render_to_response('survey/people_add.html', {'form': form},
                              context_instance=RequestContext(request))

@login_required
def people(request):
    return HttpResponseRedirect(reverse(thanks))
