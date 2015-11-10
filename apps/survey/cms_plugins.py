from cms.plugin_base import CMSPluginBase
from cms.plugin_pool import plugin_pool
from django.utils.translation import ugettext_lazy as _
from .models import SurveyListPlugin

class ListUserSurveysPlugin(CMSPluginBase):
    model = SurveyListPlugin
    render_template = "survey/cms_plugin_survey_list.html"
    name = "User Survey List"



    def render(self, context, instance, placeholder):
        request = context['request']
        global_id = request.GET.get('gid', None)
        #profile = None
        #if global_id:
        #    profile = get_user_profile(request.user.id, global_id)
        context.update({
            'global_id': global_id, # I think this is already in request.user. #TODO: clean up
            'user_id': request.user.id,
            'object': instance,
            'placeholder': placeholder
        })
        return context

plugin_pool.register_plugin(ListUserSurveysPlugin)
