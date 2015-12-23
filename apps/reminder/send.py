import datetime
import smtplib
from traceback import format_exc

from django.core.mail import EmailMultiAlternatives
from django.conf import settings
from django.template import Context, loader, Template
from django.core.urlresolvers import reverse
from django.conf import settings
from django.utils.html import strip_tags
from django.contrib.sites.models import Site
from django.contrib.auth.models import User
from django.utils.translation import activate

import loginurl.utils #This is a third party app. Just letting you know...

from apps.partnersites.context_processors import site_context

from .models import get_reminders_for_users, UserReminderInfo, ReminderError

SITE_URL = 'http://%s' % Site.objects.get_current().domain

def create_message(user, message, language):
    if language:
        activate(language)

    inner_template = Template(message.message)

    survey_list_url = 'http://%s%s' % (Site.objects.get_current(), "/survey/thanks/")

    context_dict = {
        'url': get_self_authenticating_url(user, survey_list_url),
        'unsubscribe_url': get_self_authenticating_url(user, reverse('apps.reminder.views.unsubscribe')),
        'first_name': user.first_name,
        'last_name': user.last_name,
        'username': user.username,
    }
    context_dict.update(site_context())
    context_dict['site_logo'] = SITE_URL + context_dict['site_logo']

    inner = inner_template.render(Context(context_dict))

    context_dict['inner'] = inner
    context_dict['MEDIA_URL'] = '%s%s' % (SITE_URL, settings.MEDIA_URL)
    context_dict['message'] = message

    context = Context(context_dict)
    templ = loader.get_template('reminder/message.html')

    return inner, templ.render(context)

def send_reminders(fake=False):
    active_users = User.objects.filter(is_active=True)

    # returns user, message, language
    reminders = get_reminders_for_users(active_users)
    i = 0
    for (user, message, language) in reminders:
        if not fake:
            send_message_and_update_reminder_info(user, message, language)
        else:
            print 'Fake sending', user.email, message.subject
        i = i + 1
    return i


def get_self_authenticating_url(user, target_url):
    expires = datetime.datetime.now() + datetime.timedelta(days=30)
    usage_left = 5
    key = loginurl.utils.create(user, usage_left, expires, target_url)
    domain = Site.objects.get_current()
    path = reverse('loginurl-index').strip('/')
    loginurl_base = 'http://%s/%s' % (domain, path)
    return '%s/%s' % (loginurl_base, key.key)



def send_message_and_update_reminder_info(user, message, language, is_test_message=False):
    now = datetime.datetime.now()
    text_base, html_content = create_message(user, message, language)
    text_content = strip_tags(text_base)
    msg = EmailMultiAlternatives(
        message.subject,
        text_content,
        "%s <%s>" % (message.sender_name, message.sender_email),
        [user.email],
    )

    msg.attach_alternative(html_content, "text/html")

    try:
        msg.send()
    except Exception, e:
        ReminderError.objects.create(
            user=user,
            message=unicode(e),
            traceback=format_exc(),
        )

    if not is_test_message:
        info = UserReminderInfo.objects.get(user=user)
        info.last_reminder = now
        info.save()
