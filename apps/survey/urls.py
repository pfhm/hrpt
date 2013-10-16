from django.conf.urls.defaults import *

from . import views

urlpatterns = patterns('',
    url(r'^profile/$', views.profile_index, name='survey_profile'),
    url(r'^thanks/$', views.thanks, name='survey_thanks'),
   # url(r'^utvardering/$', views.utvardering, name='survey_thanks'),
    url(r'^thanks_profile/$', views.thanks_profile, name='profile_thanks'),
    url(r'^people/$', views.people, name='survey_people'),
    url(r'^people/add/$', views.people_add, name='survey_people_add'),
    url(r'^people/edit/$', views.people_edit, name='survey_people_edit'),
    url(r'^people/remove/$', views.people_remove, name='survey_people_remove'),
    url(r'^select/$', views.select_user, name='survey_select_user'),
    url(r'^$', views.index, name='survey_index'),
    url(r'^bootstraptest/$', views.bootstraptest, name='bootstrap_test'),
    url(r'^idcode_save/$', views.idcode_save, name='survey_idcode_save'),
    url(r'^idcode_open/$', views.idcode_open, name='survey_idcode_open'),
)

