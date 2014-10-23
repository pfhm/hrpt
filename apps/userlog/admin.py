from django.contrib import admin
from apps.userlog.models import UserActivityLog
from django.contrib.auth.models import User
from django.contrib.auth.admin import UserAdmin as OriginalUserAdmin
from django.utils.encoding import force_unicode
from django.utils.text import get_text_list
from django.utils.translation import ugettext as _

class UserActivityLogAdmin(admin.ModelAdmin):
    list_display = ('user', 'event_type', 'event_date')
    ordering = ('user', 'event_date', 'event_type')
    search_fields = ('user', 'event_type')

admin.site.register(UserActivityLog, UserActivityLogAdmin)

class UserAdmin(OriginalUserAdmin):
    """
    Override the default UserAdmin to add more detailed logging to
    the AdminLog.
    """

    def construct_change_message(self, request, form, formsets):
        """
        Construct a change message from a changed object.
        """
        change_message = []
        if form.changed_data:
            user_instance = form.instance
            old_instance = form.initial
            changed_fields = {}
            for field_name in form.changed_data:
                new_value = getattr(user_instance, field_name, '')
                old_value = old_instance.get(field_name, 'null')
                change_message.append(_("Changed %s from %s to %s.") % (field_name, old_value, new_value))
            
        if formsets:
            for formset in formsets:
                for added_object in formset.new_objects:
                    change_message.append(_('Added %(name)s "%(object)s".')
                                          % {'name': force_unicode(added_object._meta.verbose_name),
                                             'object': force_unicode(added_object)})
                for changed_object, changed_fields in formset.changed_objects:
                    change_message.append(_('Changed %(list)s for %(name)s "%(object)s".')
                                          % {'list': get_text_list(changed_fields, _('and')),
                                             'name': force_unicode(changed_object._meta.verbose_name),
                                             'object': force_unicode(changed_object)})
                for deleted_object in formset.deleted_objects:
                    change_message.append(_('Deleted %(name)s "%(object)s".')
                                          % {'name': force_unicode(deleted_object._meta.verbose_name),
                                             'object': force_unicode(deleted_object)})
        change_message = ' '.join(change_message)
        return change_message or _('No fields changed.')
        
 
try:
    admin.site.unregister(User)
finally:
    admin.site.register(User, UserAdmin)