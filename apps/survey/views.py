# -*- coding: utf-8 -*-
from datetime import datetime

from django import forms
from django.template import Context, loader, RequestContext
from django.http import HttpResponse, HttpResponseRedirect, Http404
from django.db import connection, transaction, DatabaseError
from django.core.urlresolvers import reverse
from django.shortcuts import render_to_response
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
                if survey_user.user.is_active == False:
                        err = True

            if err:
                specialPrint("User not active, logout this one!")
                messages.error(request,_('This account is inactive.'))
                logout(request)

            return survey_user
        except models.SurveyUser.DoesNotExist:
            raise ValueError()

def _decode_person_health_status(status):
    if status == "NO-SYMPTOMS":
        diag = _('No symptoms')
    elif status == "ILI":
        diag = _('Flu symptoms')
    elif status == "COMMON-COLD":
       diag = _('Cold / allergy')
    elif status == "GASTROINTESTINAL":
       diag = _('Gastrointestinal symptoms')
    elif status == "NON-SPECIFIC-SYMPTOMS":
       diag = _('Other non-influenza symptons')
    elif status == "ILI-and-GASTROINTESTINAL":
       diag = _('ILI / gastro')
    elif status == "COMMON-COLD-and-GASTROINTESTINAL":
       diag = _('Cold / gastro')
    else:
       diag = _('Unknown')
    return diag

def _get_person_health_status(request, survey, global_id):
    data = survey.get_last_participation_data(request.user.id, global_id)
    status = None
    if data:
        cursor = connection.cursor()
        params = { 'weekly_id': data["id"] }
        query = """
            SELECT S.status
              FROM pollster_health_status_hrpt20131 S
             WHERE S.pollster_results_weekly_id = %(weekly_id)s"""

        cursor.execute(query, params)
        status = cursor.fetchone()[0]
    return (status, _decode_person_health_status(status))

def _get_health_history(request, survey):
    return []



@login_required
def thanks(request):

    try:
        survey_user = get_active_survey_user(request)
        if(survey_user is None):
            specialPrint('No gid in url go to select page!')
            url = '%s?next=%s' % (reverse(select_user), '/valkommen/')
            return HttpResponseRedirect(url)
    except ValueError:
        pass

    #Check idcode
    redirect = checkIdCode('apps.survey.views.thanks',survey_user)
    if redirect != None:
        return HttpResponseRedirect(redirect)

    view_data = {
        'base_template': "base/twocol.html",
        'mobile': False,
        'multi_profile_allowed': settings.MULTI_PROFILE_ALLOWED,
        'person': survey_user,
        'persons': [],
        'history': []
    }
    return render_to_response('survey/thanks.html', view_data, context_instance=RequestContext(request))



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
def select_user(request, template='survey/select_user.html'):
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

def checkIdCode(str_url_next,survey_user):
    idcode = models.SurveyIdCode.objects.filter(surveyuser_global_id=survey_user.global_id)
    if not idcode:
        specialPrint("redirect to idcode page!!")
        url = reverse('apps.survey.views.idcode_open')
        url_next = reverse(str_url_next)
        url = '%s?gid=%s&next=%s' % (url, survey_user.global_id, url_next)
        specialPrint(url)
        return url
    else:
        return None

@login_required
def index(request):
    try:
        survey_user = get_active_survey_user(request)
    except ValueError:
        raise Http404()
        #pass
    #return render_to_response('survey/utvardering.html',{'person': survey_user}, context_instance=RequestContext(request))
    if survey_user is None:
        url = '%s?next=%s' % (reverse(select_user), reverse(index))
        return HttpResponseRedirect(url)

    #Check idcode
    redirect = checkIdCode('apps.survey.views.index',survey_user)
    if redirect != None:
        return HttpResponseRedirect(redirect)

    # Check if the user has filled user profile
    profile = pollster_utils.get_user_profile(request.user.id, survey_user.global_id)
    if profile is None:
        messages.add_message(request, messages.INFO,
            _('Before we take you to the symptoms questionnaire, please complete the short background questionnaire below. You will only have to complete this once.'))
        url = reverse('apps.survey.views.profile_index')
        url_next = reverse('apps.survey.views.index')
        url = '%s?gid=%s&next=%s' % (url, survey_user.global_id, url_next)
        return HttpResponseRedirect(url)

    try:
        survey = pollster.models.Survey.get_by_shortname('weekly')
    except:
        raise Exception("The survey application requires a published survey with the shortname 'weekly'")

    next = None
    if 'next' not in request.GET:
        next = reverse(thanks)

    senaste = survey_user.get_last_weekly_survey_date_text()
    idag = datetime.date.today().strftime('%W')
    upd = False

    if senaste != None:
        dt = datetime.datetime.strptime(senaste, '%Y-%m-%d')
        senaste = dt.strftime('%W')
        # specialPrint("compare senaste with idag:" + senaste + " and " + idag)

    if senaste != None and senaste == idag:
        upd = True

    return pollster_views.survey_run(request, survey.shortname, next=next,update=upd)

@login_required
def profile_index(request):
    #TODO: get rid of this crazyness. This is painful.

    # What is all this spaghetti-y ...?  I don't even....
    try:
        survey_user = get_active_survey_user(request)
    except ValueError:
        raise Http404()
    if survey_user is None:
        url = '%s?next=%s' % (reverse(select_user), reverse(profile_index))
        return HttpResponseRedirect(url)

    #Check idcode
    redirect = checkIdCode('apps.survey.views.profile_index',survey_user)
    if redirect != None:
        return HttpResponseRedirect(redirect)


    #this is crazy, let's not check if an 'intake' survey exists
    # what are we doing in here if if doesn't, really
    try:
        survey = pollster.models.Survey.get_by_shortname('intake')
    except:
        raise Exception("The survey application requires a published survey with the shortname 'intake'")

    next = None
    if 'next' not in request.GET:
        next = reverse(thanks)

    return pollster_views.survey_run(request, survey.shortname, next=next,update=True)


################################################################################
################################################################################

@login_required
def show_survey(request, survey_short_name):

    #TODO: get replies to This
    #TODO: Load the replies from db
    #TODO: inject replies in form and see if they show
    #TODO: update if data exists? Or maybe just save a new row and allways retrieve the most recent one.
    #TODO: set the translation???? maybe? Like this: survey.set_translation_survey(translation)


    language = get_language()
    #locale_code = locale.locale_alias.get(language)

    survey = pollster.models.Survey.get_by_shortname(survey_short_name)

    global_id = request.GET.get('gid', None)
    survey_user = models.SurveyUser.objects.get(global_id=global_id, user=request.user)

    last_participation_data = survey.get_last_participation_data(request.user.id, global_id)

    if last_participation_data:
        return HttpResponseRedirect('svarad-enkat')

    form = survey.as_form()(last_participation_data)

    if request.method == 'POST':
        data = request.POST.copy()
        data['user'] = request.user.id
        data['global_id'] = global_id
        data['timestamp'] = datetime.datetime.now()

        form = survey.as_form()(data)

        if form.is_valid():
            form.save()
            return HttpResponse("Form submited successfully!!!!!")
        else:
            survey.set_form(form)

    return render_to_response(
        'pollster/survey_run.html',
        {
            "language": language,
            "locale_code": "sv-SE", # let's just hardcode this for now
            "survey": survey,
            "default_postal_code_format": pollser_field_types.PostalCodeField.get_default_postal_code_format(),
            "last_participation_data_json": {}, # try removing this crap # Edit: soooo... this is injected inside javascript code. The horror!
            "form": form,
            "person": survey_user
        },
        context_instance=RequestContext(request)  #don't know why this is necessairy, nobody does apparently. See https://github.com/django-compressor/django-compressor/issues/483#issuecomment-52243164
    )


################################################################################
################################################################################



@login_required
def people_edit(request):
    try:
        survey_user = get_active_survey_user(request)
    except ValueError:
        raise Http404()
    if survey_user is None:
        url = '%s?next=%s' % (reverse(select_user), reverse(people_edit))
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
