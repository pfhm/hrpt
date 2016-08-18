from models import user_profile
from forms import *

# from apps.survey.models import SurveyIdCode

def user_created(sender, user, request, **kwargs):
    form = CaptchaUnicodeRegistrationForm(request.POST)
    data = user_profile(user=user)
    data.yearofbirth = form.data["yearofbirth"]
    data.idcode = form.data["idcode"]
    data.save()

from registration.signals import user_registered
user_registered.connect(user_created)
