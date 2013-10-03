from django.conf.urls.defaults import *

from . import views

urlpatterns = patterns('',
    url(r'^urls.js$', views.urls, kwargs={'prefix': 'pollster_'}, name='pollster_urls'),
    url(r'^pollster/$', views.survey_add, name='pollster_survey_add'),
    url(r'^pollster/import/$', views.survey_import, name='pollster_survey_import'),
    url(r'^pollster/(?P<id>\d+)/$', views.survey_edit, name='pollster_survey_edit'),
    url(r'^pollster/(?P<id>\d+)/export/$', views.survey_export_xml, name='pollster_survey_export_xml'),
    url(r'^pollster/(?P<id>\d+)/results/$', views.survey_results_csv, name='pollster_survey_results_csv'),
    url(r'^pollster/(?P<id>\d+)/publish/$', views.survey_publish, name='pollster_survey_publish'),
    url(r'^pollster/(?P<id>\d+)/unpublish/$', views.survey_unpublish, name='pollster_survey_unpublish'),
    url(r'^pollster/(?P<id>\d+)/translations/$', views.survey_translation_list_or_add, name='pollster_survey_translation_list'),
    url(r'^pollster/(?P<id>\d+)/translations/$', views.survey_translation_list_or_add, name='pollster_survey_translation_add'),
    url(r'^pollster/(?P<id>\d+)/translations/(?P<language>.+)/$', views.survey_translation_edit, name='pollster_survey_translation_edit'),
    url(r'^pollster/(?P<id>\d+)/charts/$', views.survey_chart_list_or_add, name='pollster_survey_chart_list'),
    url(r'^pollster/(?P<id>\d+)/charts/$', views.survey_chart_list_or_add, name='pollster_survey_chart_add'),
    url(r'^pollster/(?P<id>\d+)/charts/(?P<shortname>.+)/$', views.survey_chart_edit, name='pollster_survey_chart_edit'),
    url(r'^pollster/(?P<id>\d+)/charts/(?P<shortname>.+)\.json$', views.survey_chart_data, name='pollster_survey_chart_data'),
    url(r'^pollster/(?P<id>\d+)/charts/(?P<shortname>.+)/tile/(?P<z>\d+)/(?P<x>\d+)/(?P<y>\d+)$', views.survey_chart_map_tile, name='pollster_survey_chart_map_tile'),
    url(r'^pollster/(?P<id>\d+)/charts/(?P<shortname>.+)/click/(?P<lat>[\d.-]+)/(?P<lng>[\d.-]+)$', views.survey_chart_map_click, name='pollster_survey_chart_map_click'),
    url(r'^surveys/(?P<id>\d+)/$', views.survey_test, name='pollster_survey_test'),
    url(r'^surveys/(?P<id>\d+)/(?P<language>.+)/$', views.survey_test, name='pollster_survey_test'),
    url(r'^$', views.survey_list, name='pollster_survey_list'),
)

