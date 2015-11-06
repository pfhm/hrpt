from cms.plugin_base import CMSPluginBase
from cms.plugin_pool import plugin_pool
from django.utils.translation import ugettext_lazy as _
from .models import SurveyListPlugin

class ListUserSurveysPlugin(CMSPluginBase):
    model = SurveyListPlugin
    render_template = "survey/cms_plugin_survey_list.html"
    name = "User Survey List"

plugin_pool.register_plugin(ListUserSurveysPlugin)
