from django.contrib import admin
from django.contrib.auth.admin import UserAdmin 
from django.contrib.auth.models import User
from django.contrib.admin.models import LogEntry, CHANGE
from django.contrib.contenttypes.models import ContentType

from .models import RuleType, QuestionDataType, VirtualOptionType, Survey, TranslationSurvey, Chart

admin.site.register(RuleType)
admin.site.register(QuestionDataType)
admin.site.register(VirtualOptionType)
admin.site.register(Survey)
admin.site.register(TranslationSurvey)
admin.site.register(Chart)


current_user_admin = type(admin.site._registry[User])
class ExtendedUserAdmin(current_user_admin):
    actions = ['batch_deactivate'] 

    def batch_deactivate(self, request, queryset): 
        queryset.update(is_active = False)
        
        ct = ContentType.objects.get_for_model(queryset.model)
        for obj in queryset:
            LogEntry.objects.log_action(
                user_id = request.user.id,
                content_type_id = ct.pk,
                object_id = obj.pk,
                object_repr = obj.username,
                action_flag = CHANGE,
                change_message = 'User deactivated as part of a batch operation.')
         
        pass
    
    batch_deactivate.short_description = 'Deactivate selected users'

admin.site.unregister(User)
admin.site.register(User, ExtendedUserAdmin)


