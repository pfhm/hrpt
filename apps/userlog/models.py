from django.db import models
from django.contrib.auth.models import User
from django.contrib.auth.signals import user_logged_in
from apps.reminder.signals import reminder_sent
from django.contrib.auth.admin import UserAdmin

class UserActivityLog(models.Model):
    user = models.ForeignKey(User, related_name='+')
    event_type = models.CharField(max_length=15)
    event_date = models.DateTimeField(null=False, auto_now_add=True)
    
def add_login_log(sender, request, user, **kwargs):
    log = UserActivityLog()
    log.user = user
    log.event_type = "logged_in"
    log.save()
    
def add_reminder_sent_log(sender, user, **kwargs):
    log = UserActivityLog()
    log.user = user
    log.event_type = "reminder_sent"
    log.save()
    
user_logged_in.connect(add_login_log)
reminder_sent.connect(add_reminder_sent_log)