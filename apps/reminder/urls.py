from django.conf.urls.defaults import *
from django.views.generic.simple import redirect_to
from django.conf import settings

from loginurl.views import cleanup, login

urlpatterns = patterns('apps.reminder.views',
    (r'^unsubscribe/$', 'unsubscribe'),
    (r'^overview/$', 'overview'),
    (r'^templates/$', 'list_newsletter_templates'),
    (r'^send_manual_newsletter/(?P<newsletter_template_id>[0-9]+)/$', 'send_manual_newsletter'),
    (r'^templates/(?P<id>[0-9]+)/$', 'show_newsletter_template'),
    #This is for debugging emial sending.
    (r'^templates/send_to_myself/(?P<newsletter_template_id>[0-9]+)/$', 'send_test_email_to_myself'),
    (r'^templates/iframed/(?P<id>[0-9]+)/$', 'show_newsletter_template_in_iframe'),
    (r'^manage/(?P<year>[0-9]+)/(?P<month>[0-9]+)/(?P<day>[0-9]+)/(?P<hour>[0-9]+)/(?P<minute>[0-9]+)/$', 'manage'),
    (r'^preview/(?P<year>[0-9]+)/(?P<month>[0-9]+)/(?P<day>[0-9]+)/(?P<hour>[0-9]+)/(?P<minute>[0-9]+)/$', 'preview'),
)
