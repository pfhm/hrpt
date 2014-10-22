from django.contrib import admin

from apps.survey.models import SurveyUser, Profile, Participation, SurveyIdCode, SurveyUserLog

class ProfileAdmin(admin.ModelAdmin):
    list_display = ('user', 'updated', 'valid', 'created')
    ordering = ('user__name',)
    search_fields = ('user__name',)
    list_filter = ('valid',)

class ParticipationAdmin(admin.ModelAdmin):
    list_display = ('user', 'date', 'epidb_id')
    ordering = ('-date',)

class SurveyUserAdmin(admin.ModelAdmin):
    list_display = ('name', 'last_participation_date', 'global_id')
    ordering = ('name',)
    search_fields = ('name',)

#Pekka
class SurveyIdCodeAdmin(admin.ModelAdmin):
    list_display = ('idcode', 'surveyuser_global_id')
    ordering = ('idcode',)
    search_fields = ('idcode',)
    
    def save_model(self, request, obj, form, change):
        if(obj.surveyuser_global_id == ''):
            obj.surveyuser_global_id = None
        if(obj.fodelsedatum == ''):
            obj.fodelsedatum = None
        obj.save()
        
class SurveyUserLogAdmin(admin.ModelAdmin):
    list_display = ('user', 'event_type', 'event_date')
    ordering = ('user', 'event_date', 'event_type')
    search_fields = ('user', 'event_type')

admin.site.register(Profile, ProfileAdmin)
admin.site.register(Participation, ParticipationAdmin)
admin.site.register(SurveyUser, SurveyUserAdmin)
admin.site.register(SurveyIdCode, SurveyIdCodeAdmin)
admin.site.register(SurveyUserLog, SurveyUserLogAdmin)
