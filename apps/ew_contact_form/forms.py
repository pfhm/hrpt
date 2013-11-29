from django import forms
from django.utils.translation import ugettext_lazy as _

from contact_form.forms import ContactForm as DefaultContactForm

from apps.partnersites.models import SiteSettings
from captcha.fields import CaptchaField

class ContactForm(DefaultContactForm):

    def __init__(self, *args, **kwargs):
        super(ContactForm, self).__init__(*args, **kwargs)
        self.fields['name'].label = _("Name")
        self.fields['email'].label = _("Email")
        self.fields['body'].label = _("Message")

        settings = SiteSettings.objects.get()
        self.recipient_list = [settings.contact_form_recipient]

class CaptchaContactForm(ContactForm):
    captcha = CaptchaField(label=_("Captcha"),
                           help_text=_("Please enter the characters shown in the image."))