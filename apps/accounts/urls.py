from django.conf.urls.defaults import *
from django.contrib.auth import views as auth_views
from django.views.generic.simple import direct_to_template

from registration.views import activate
from registration.views import register

from . import views
from .forms import UnicodeRegistrationForm

urlpatterns = patterns('',
    # From registration.backends.default.urls
    url(r'^activate/complete/$',
        direct_to_template,
        { 'template': 'registration/activation_complete.html' },
        name='registration_activation_complete'),
    # Activation keys get matched by \w+ instead of the more specific
    # [a-fA-F0-9]{40} because a bad activation key should still get to the view;
    # that way it can return a sensible "invalid key" message instead of a
    # confusing 404.
    url(r'^activate/(?P<activation_key>\w+)/$',
        activate,
        { 'backend': 'registration.backends.default.DefaultBackend',
          'template_name': 'registration/activate.html' },
        name='registration_activate'),
    url(r'^register/$',
        register,
        { 'backend': 'registration.backends.default.DefaultBackend',
          'template_name': 'registration/registration_form.html',
          'form_class': UnicodeRegistrationForm},
        name='registration_register'),
    url(r'^register/complete/$',
        direct_to_template,
        { 'template': 'registration/registration_complete.html' },
        name='registration_complete'),
    url(r'^register/closed/$',
        direct_to_template,
        { 'template': 'registration/registration_closed.html' },
        name='registration_disallowed'),
    # From registration.auth_urls
    url(r'^login/$',
        auth_views.login,
        {'template_name': 'registration/login.html'},
        name='auth_login'),
    url(r'^logout/$',
        auth_views.logout,
        {'template_name': 'registration/logout.html'},
        name='auth_logout'),
    url(r'^password/change/$',
        auth_views.password_change,
        {'template_name': 'registration/password_change_form.html'},
        name='auth_password_change'),
    url(r'^password/change/done/$',
        auth_views.password_change_done,
        {'template_name': 'registration/password_change_done.html'},
        name='auth_password_change_done'),
    url(r'^password/reset/$',
        auth_views.password_reset,
        {'template_name': 'registration/password_reset_form.html',
         'email_template_name': 'registration/password_reset_email.html'},
        name='auth_password_reset'),
    url(r'^password/reset/confirm/(?P<uidb36>[0-9A-Za-z]+)-(?P<token>.+)/$',
        auth_views.password_reset_confirm,
        {'template_name': 'registration/password_reset_confirm.html'},
        name='auth_password_reset_confirm'),
    url(r'^password/reset/complete/$',
        auth_views.password_reset_complete,
        {'template_name': 'registration/password_reset_complete.html'},
        name='auth_password_reset_complete'),
    url(r'^password/reset/done/$',
        auth_views.password_reset_done,
        {'template_name': 'registration/password_reset_done.html'},
        name='auth_password_reset_done'),

    url(r'^settings/email/$', views.my_settings, {'form': 'email'}),
    url(r'^settings/password/$', views.my_settings, {'form': 'password'}),
    url(r'^settings/username/$', views.my_settings, {'form': 'username'}),
    url(r'^settings/$', views.my_settings),

    # Additional URLs
    url(r'^$', views.index),
)

