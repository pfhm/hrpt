
from django.core.management.base import BaseCommand, CommandError
import sys,traceback
import datetime
from apps.survey.models import SurveyUser 
from apps.pollster.models import Survey

from django.db import connection
survey_user = None

class Command(BaseCommand):
    args = ''
    help = """Author: Pekka Kleimert(pkleimert@gmail.com)
    This test creates pollster results for specified user. Two args is used:
    #Arg 1:username: user to connect pollster results to
    #Arg 2: barn or vuxen. If vuxen adult fields are populated, if barn child attributes are populated
    Note 1: This is not a test of all combinations of different statuses. The results are viewable via web if you wish to see it.
    Note 2: This test will remove all previous reports for this user.
    Assertions are made for all statuses"""

    def handle(self, *args, **options):
        assert len(args) == 2,'You must specify 2 args: username barn/vuxen'
        go_on=raw_input('Do you want to continue? All weekly pollster data for '+args[0]+ ' will be erased! [Yy/Nn]').capitalize()
        
        if "Y" == go_on:
            print 'carry on'
        elif "N" == go_on:
            print 'abort'
            sys.exit()
        else:
            print 'Invalid option'
            sys.exit()
        
        go(args)

def go(args):
    global survey_user
    checkTestUser(args)
    removeAllSurveys()
    if(args[1] == 'vuxen'):
        createNoSymptomAdult()
        createIliGastroAdult()
        createColdGastroAdult()
        createIliAdult()
        createGastroAdult()
        createColdAdult()
        createNonSpecificAdult()
    else:
        createNoSymptomChild()
        createIliGastroChild()
        createColdGastroChild()
        createIliChild()
        createGastroChild()
        createColdChild()
        createNonSpecificChild()
    performTest()
    print 'done'
    #removeAllSurveys()

def performTest():
    print 'Verifying result'
    cursor = connection.cursor()
    params = {'gid':survey_user.global_id}
    query = """SELECT S.status FROM pollster_health_status_hrpt20131 S, pollster_results_weekly W 
    WHERE S.pollster_results_weekly_id = W.id AND W.global_id = %(gid)s ORDER BY W.timestamp ASC"""
    cursor.execute(query,params)
    
    result = cursor.fetchone()[0]
    assert result == 'NO-SYMPTOMS', 'status was ' + result + 'but should be NO-SYMPTOMS'
    
    result = cursor.fetchone()[0]
    assert result == 'ILI-and-GASTROINTESTINAL', 'status was ' + result + 'but should be ILI-and-GASTROINTESTINAL'
    
    result = cursor.fetchone()[0]
    assert result == 'COMMON-COLD-and-GASTROINTESTINAL', 'status was ' + result + 'but should be COMMON-COLD-and-GASTROINTESTINAL'
    
    result = cursor.fetchone()[0]
    assert result == 'NON-SPECIFIC-SYMPTOMS', 'status was ' + result + 'but should NON-SPECIFIC-SYMPTOMS'
    
    result = cursor.fetchone()[0]
    assert result == 'GASTROINTESTINAL', 'status was ' + result + 'but should GASTROINTESTINAL'
    
    result = cursor.fetchone()[0]
    assert result == 'COMMON-COLD', 'status was ' + result + 'but should COMMON-COLD'
    
    result = cursor.fetchone()[0]
    assert result == 'ILI', 'status was ' + result + 'but should be ILI'
    
def checkTestUser(args):
    print "check for user"
    global survey_user
    usrname=args[0]
    try:
        survey_user = SurveyUser.objects.get(name=usrname)
        print survey_user.name,survey_user.global_id
    except:
        pass
    
    if survey_user is None:
        print "user " + usrname + " not found, please register"
        exit()

def removeAllSurveys():
    print "remove previous surveys"
    cursor = connection.cursor()
    query = "DELETE FROM pollster_results_weekly where global_id = '"+survey_user.global_id+"';"
    cursor.execute(query)
    
def createNoSymptomAdult():
    print 'Creating result 1'
    survey = Survey.objects.get(shortname='weekly',status='PUBLISHED')
    weekly = survey.as_model()
    result = weekly(timestamp=datetime.datetime.now() + datetime.timedelta(days=-6),
                    user=survey_user.user.id,
                    global_id=survey_user.global_id,
                    Q1a=0)
    result.save()
    
def createIliGastroAdult():
    print 'Creating result 2'
    survey = Survey.objects.get(shortname='weekly',status='PUBLISHED')
    weekly = survey.as_model()
    result = weekly(timestamp=datetime.datetime.now() + datetime.timedelta(days=-5),
                    user=survey_user.user.id,
                    global_id=survey_user.global_id,
                    Q5=0,
                    Q1_1=True,
                    Q1_5=True,
                    Q6e=3,
                    Q1a=1,
                    Q1b=0)
    result.save()
    
def createColdGastroAdult():
    print 'Creating result 3'
    survey = Survey.objects.get(shortname='weekly',status='PUBLISHED')
    weekly = survey.as_model()
    result = weekly(timestamp=datetime.datetime.now() + datetime.timedelta(days=-4),
                    user=survey_user.user.id,
                    global_id=survey_user.global_id,
                    Q1_3=True,
                    Q6e=3,
                    Q1a=1,
                    Q1b=0)
    result.save()
    
def createIliAdult():
    print 'Creating result 4'
    survey = Survey.objects.get(shortname='weekly',status='PUBLISHED')
    weekly = survey.as_model()
    result = weekly(timestamp=datetime.datetime.now() + datetime.timedelta(days=-0),
                    user=survey_user.user.id,
                    global_id=survey_user.global_id,
                    Q5=0,
                    Q1_1=True,
                    Q1_5=True,
                    Q1a=1,
                    Q1b=0)
    result.save()
    
def createGastroAdult():
    print 'Creating result 5'
    survey = Survey.objects.get(shortname='weekly',status='PUBLISHED')
    weekly = survey.as_model()
    result = weekly(timestamp=datetime.datetime.now() + datetime.timedelta(days=-2),
                    user=survey_user.user.id,
                    global_id=survey_user.global_id,
                    Q6e=3,
                    Q1a=1,
                    Q1b=0)
    result.save()
    
def createColdAdult():
    print 'Creating result 6'
    survey = Survey.objects.get(shortname='weekly',status='PUBLISHED')
    weekly = survey.as_model()
    result = weekly(timestamp=datetime.datetime.now() + datetime.timedelta(days=-1),
                    user=survey_user.user.id,
                    global_id=survey_user.global_id,
                    Q1_3=True,
                    Q1a=1,
                    Q1b=0)
    result.save()
    
def createNonSpecificAdult():
    print 'Creating result 7'
    survey = Survey.objects.get(shortname='weekly',status='PUBLISHED')
    weekly = survey.as_model()
    result = weekly(timestamp=datetime.datetime.now() + datetime.timedelta(days=-3),
                    user=survey_user.user.id,
                    global_id=survey_user.global_id)
    result.save()
    
def createNoSymptomChild():
    print 'Creating result 1'
    survey = Survey.objects.get(shortname='weekly',status='PUBLISHED')
    weekly = survey.as_model()
    result = weekly(timestamp=datetime.datetime.now() + datetime.timedelta(days=-6),
                    user=survey_user.user.id,
                    global_id=survey_user.global_id,
                    Q1aa=0)
    result.save()
    
def createIliGastroChild():
    print 'Creating result 2'
    survey = Survey.objects.get(shortname='weekly',status='PUBLISHED')
    weekly = survey.as_model()
    result = weekly(timestamp=datetime.datetime.now() + datetime.timedelta(days=-5),
                    user=survey_user.user.id,
                    global_id=survey_user.global_id,
                    Q5=0,
                    Q111_1=True,
                    Q111_5=True,
                    Q6ee=3,
                    Q1aa=1,
                    Q1bb=0)
    result.save()
    
def createColdGastroChild():
    print 'Creating result 3'
    survey = Survey.objects.get(shortname='weekly',status='PUBLISHED')
    weekly = survey.as_model()
    result = weekly(timestamp=datetime.datetime.now() + datetime.timedelta(days=-4),
                    user=survey_user.user.id,
                    global_id=survey_user.global_id,
                    Q111_3=True,
                    Q6ee=3,
                    Q1aa=1,
                    Q1bb=0)
    result.save()
    
def createIliChild():
    print 'Creating result 4'
    survey = Survey.objects.get(shortname='weekly',status='PUBLISHED')
    weekly = survey.as_model()
    result = weekly(timestamp=datetime.datetime.now() + datetime.timedelta(days=-0),
                    user=survey_user.user.id,
                    global_id=survey_user.global_id,
                    Q5=0,
                    Q111_1=True,
                    Q111_5=True,
                    Q1aa=1,
                    Q1bb=0)
    result.save()
    
def createGastroChild():
    print 'Creating result 5'
    survey = Survey.objects.get(shortname='weekly',status='PUBLISHED')
    weekly = survey.as_model()
    result = weekly(timestamp=datetime.datetime.now() + datetime.timedelta(days=-2),
                    user=survey_user.user.id,
                    global_id=survey_user.global_id,
                    Q6ee=3,
                    Q1aa=1,
                    Q1bb=0)
    result.save()
    
def createColdChild():
    print 'Creating result 6'
    survey = Survey.objects.get(shortname='weekly',status='PUBLISHED')
    weekly = survey.as_model()
    result = weekly(timestamp=datetime.datetime.now() + datetime.timedelta(days=-1),
                    user=survey_user.user.id,
                    global_id=survey_user.global_id,
                    Q111_3=True,
                    Q1aa=1,
                    Q1bb=0)
    result.save()
    
def createNonSpecificChild():
    print 'Creating result 7'
    survey = Survey.objects.get(shortname='weekly',status='PUBLISHED')
    weekly = survey.as_model()
    result = weekly(timestamp=datetime.datetime.now() + datetime.timedelta(days=-3),
                    user=survey_user.user.id,
                    global_id=survey_user.global_id)
    result.save()