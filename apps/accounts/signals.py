#
# Not used now. Could replace similar code in apps.survey.views.thanks
# Current problem is that it is not clear how to inform the user when the id-code
# was already taken.
# to activate this code uncomment the "import signals" line in __init__.py

from django.db.models.signals import post_save
#check if needed/usable
from django.dispatch import receiver
from apps.survey.models import SurveyUser, SurveyIdCode
from apps.accounts.models import user_profile


@receiver(post_save, sender=SurveyUser, dispatch_uid="FinalizeRegSurveyUserPostSave")
def FinalizeRegistration(sender, **kwargs):
    created=kwargs.get('created')  #Check what happens if this does not exist?
    NewSurveyUser.get('instance')
    raw=kwargs.get('raw')

    if not raw and created:
        idcode = models.SurveyIdCode.objects.filter(surveyuser_global_id=NewSurveyUser.global_id)
        if not idcode: #This means this is the frist login and the age and idcode still need to be set.
            #get the user_profile
            userprofile = user_profile.objects.get(user=NewSurveyUser.user)
            #get the SurveyIdCode
            SurveyIdcode_obj = SurveyIdCode.objects.get(idcode=userprofile.idcode)
            #check if the global_id has not been set
            if (not SurveyIdcode_obj):
                raise SurveyIdCodeNotValid
            elif (not SurveyIdcode_obj.surveyuser_global_id):
                #if global_id not set then assign the one from the survey_user
                SurveyIdcode_obj.surveyuser_global_id=NewSurveyUser.global_id
                #And assign the birthyear from the user_profile
                SurveyIdcode_obj.fodelsedatum=str(userprofile.yearofbirth)
                #save
                SurveyIdcode_obj.save()
                #continue to welcome page.
            else:
                #Deactivate user
                NewSurveyUser.user.is_active=False
                NewSurveyUser.user.save()
                #logout
                #logout(request)

                #Redirect to error message

                # return render_to_response('registration/registration_problem.html',
                #                             context_instance=RequestContext(request))
