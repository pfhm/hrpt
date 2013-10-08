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

from apps.survey import utils, models, forms
from apps.pollster import views as pollster_views
from apps.pollster import utils as pollster_utils
from .survey import ( Specification,
                      FormBuilder,
                      JavascriptBuilder,
                      get_survey_context, )
import apps.pollster as pollster
import pickle

#Pekka
import sys
import datetime
#import time
from django.conf import settings
#Pekka

survey_form_helper = None
profile_form_helper = None

def get_active_survey_user(request):
    gid = request.GET.get('gid', None)
    if gid is None:
        return None
    else:
        try:
            return models.SurveyUser.objects.get(global_id=gid,
                                                 user=request.user)
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
    elif status == "NON-INFLUENZA":
       diag = _('Other non-influenza symptons')
    else:
       diag = _('Unknown')
    return diag

def _get_person_health_status(request, survey, global_id):
    data = survey.get_last_participation_data(request.user.id, global_id)
    status = None
    if data:
        cursor = connection.cursor()
        params = { 'weekly_id': data["id"] }
        queries = {
            'sqlite':"""
            SELECT S.status
              FROM pollster_health_status S
             WHERE S.pollster_results_weekly_id = :weekly_id""",
            'mysql':"""
            SELECT S.status
              FROM pollster_health_status S
             WHERE S.pollster_results_weekly_id = :weekly_id""",
            'postgresql':"""
            SELECT S.status
              FROM pollster_health_status S
             WHERE S.pollster_results_weekly_id = %(weekly_id)s"""
        }
        cursor.execute(queries[utils.get_db_type(connection)], params)
        status = cursor.fetchone()[0]
    return (status, _decode_person_health_status(status))

def _get_health_history(request, survey):
    results = []
    cursor = connection.cursor()
    params = { 'user_id': request.user.id }
    queries = {
        'sqlite':"""
            SELECT W.timestamp, W.global_id, S.status
              FROM pollster_health_status S, pollster_results_weekly W
             WHERE S.pollster_results_weekly_id = W.id
               AND W.user = :user_id
             ORDER BY W.timestamp""",
        'mysql':"""
            SELECT W.timestamp, W.global_id, S.status
              FROM pollster_health_status S, pollster_results_weekly W
             WHERE S.pollster_results_weekly_id = W.id
               AND W.user = :user_id
             ORDER BY W.timestamp""",
        'postgresql':"""
            SELECT W.timestamp, W.global_id, S.status
              FROM pollster_health_status S, pollster_results_weekly W
             WHERE S.pollster_results_weekly_id = W.id
               AND W.user = %(user_id)s
             ORDER BY W.timestamp""",
    }
    cursor.execute(queries[utils.get_db_type(connection)], params)
    results = cursor.fetchall()
    for ret in results:
        timestamp, global_id, status = ret
        yield {'global_id': global_id, 'timestamp': timestamp, 'status': status, 'diag':_decode_person_health_status(status)}

@login_required
def thanks(request):
    try:
        survey = pollster.models.Survey.get_by_shortname('weekly')
    except:
        raise Exception("The survey application requires a published survey with the shortname 'weekly'")
    Weekly = survey.as_model()
    try:
        survey_user = get_active_survey_user(request)
    except ValueError:
        pass

    history = list(_get_health_history(request, survey))
    persons = models.SurveyUser.objects.filter(user=request.user, deleted=False)
    persons_dict = dict([(p.global_id, p) for p in persons])
    for item in history:
        item['person'] = persons_dict.get(item['global_id'])
    for person in persons:
        person.health_status, person.diag = _get_person_health_status(request, survey, person.global_id)
        person.health_history = [i for i in history if i['global_id'] == person.global_id][-10:]

    return render_to_response('survey/thanks.html', {'mobile': isMobile(request),'multi_profile_allowed': settings.MULTI_PROFILE_ALLOWED,'person': survey_user, 'persons': persons, 'history': history},
                              context_instance=RequestContext(request))

@login_required
def thanks_profile(request):
    try:
        survey_user = get_active_survey_user(request)
    except ValueError:
        pass
    return render_to_response('survey/thanks_profile.html', {'person': survey_user},
        context_instance=RequestContext(request))

@login_required
def idcode_save(request):
    
    idcode_id = request.POST['idkod']
    gid = request.POST['global_id']
    #print("pekka_save:" + id)
    print("pekka_save person:" + gid)
    idcode = None
    survey_user = models.SurveyUser.objects.get(global_id=gid)
    error = False
    
    if idcode_id == None or idcode_id == '':
        error = True
        messages.add_message(request, messages.ERROR, ("Du måste ange en idkod!"))
    
    if error == False:
        try:
            idcode = models.SurveyIdCode.objects.get(idcode=idcode_id)
        except:
            error = True
            print("Hittade inte idkod med varde" + idcode_id)
            messages.add_message(request, messages.ERROR, ("Hittade inte idkod med vardet " + idcode_id))
     
        if idcode != None and idcode.surveyuser_global_id!=None:
            error = True
            print("Idkod med varde" + idcode_id + "ar redan upptaget")
            messages.add_message(request, messages.ERROR, ("Idkoden " + idcode_id + " ar redan upptagen"))
        
    if error:
        return render_to_response('survey/id_code.html', {'person': survey_user},context_instance=RequestContext(request))
    
    #survey_user.idkod = id
    #idcode.used= 'Y'
    idcode.surveyuser_global_id = gid
    #survey_user.save()
    idcode.save()
    #print(request)
    return thanks(request)

@login_required
def bootstraptest(request):
    return render_to_response('survey/bootstrap_test.html', {},context_instance=RequestContext(request))
   
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

def isMobile(request):
    specialPrint("###Check if user is using mobile###")
    x = request.META['HTTP_USER_AGENT']
    x = x.lower()
    print(x)
    
    mobDevices = ['android','iphone']
    
    retVal = False
    
    for device in mobDevices:
        if x.find(device) > -1:
            retVal =  True
            break
      
    print "Mobile user=",retVal      
            
    return retVal
            
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

    idcode = None
    try:
        idcode = models.SurveyIdCode.objects.get(surveyuser_global_id=survey_user.global_id)
    except:
        print("Survey user has no id code")
    
    if idcode == None:
        print("no idkod!!!")
        messages.add_message(request, messages.ERROR, ("Du har inte angett en idkod!"))
        return render_to_response('survey/id_code.html', {'person': survey_user},context_instance=RequestContext(request))

    senaste = survey_user.get_last_weekly_survey_date_text()
    idag = datetime.date.today().strftime('%W')
    
    if senaste != None:
        dt = datetime.datetime.strptime(senaste, '%Y-%m-%d')
        senaste = dt.strftime('%W')
        print("compare senaste with idag:" + senaste + " and " + idag)

    if senaste != None and senaste == idag:
        messages.add_message(request, messages.ERROR,_(u'Redan raporterat för vecka ' + senaste))
        return HttpResponseRedirect(reverse(thanks))
    
    if isMobile(request):
        return pollster_views.survey_run(request, survey.shortname, next=next,clean_template=True,bootstrap=True)
    else:
        return pollster_views.survey_run(request, survey.shortname, next=next)
                        
@login_required
def profile_index(request):
    try:
        survey_user = get_active_survey_user(request)
    except ValueError:
        raise Http404()
    if survey_user is None:
        url = '%s?next=%s' % (reverse(select_user), reverse(profile_index))
        return HttpResponseRedirect(url)

    try:
        survey = pollster.models.Survey.get_by_shortname('intake')
    except:
        raise Exception("The survey application requires a published survey with the shortname 'intake'")

    next = None
    if 'next' not in request.GET:
        next = reverse(thanks_profile)

    
    if isMobile(request):
        return pollster_views.survey_run(request, survey.shortname, next=next,clean_template=True,bootstrap=True)
    else:
        return pollster_views.survey_run(request, survey.shortname, next=next)

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

    return render_to_response('survey/people_edit.html', {'form': form},
                              context_instance=RequestContext(request))
    #return render_to_response('survey/thanks.html', {'form': form},
     #                         context_instance=RequestContext(request))

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

    #users = models.SurveyUser.objects.filter(user=request.user, deleted=False)
    #return render_to_response('survey/people.html', {'people': users},
     #                         context_instance=RequestContext(request))

