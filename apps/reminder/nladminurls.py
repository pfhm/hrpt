from django.conf.urls.defaults import *
from django.conf import settings
from loginurl.views import cleanup, login


urlpatterns = patterns('',
    (r'^templates/$', 'apps.reminder.views.list_newsletter_templates'),
    (r'^send_manual_newsletter/(?P<newsletter_template_id>[0-9]+)/$', 'apps.reminder.views.send_manual_newsletter'),
    (r'^templates/(?P<id>[0-9]+)/$', 'apps.reminder.views.show_newsletter_template'),
    #This is for debugging emial sending.
    (r'^templates/send_to_myself/(?P<newsletter_template_id>[0-9]+)/$', 'apps.reminder.views.send_test_email_to_myself'),
    (r'^templates/iframed/(?P<id>[0-9]+)/$', 'apps.reminder.views.show_newsletter_template_in_iframe')
)
