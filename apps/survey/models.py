from datetime import datetime, date
import uuid

from django.db import models
from django.contrib.auth.models import User
from django.db.models.signals import post_save
from django.core.urlresolvers import reverse
from django.db import connection, transaction

from times import epoch

def create_global_id():
    return str(uuid.uuid4())

class SurveyUser(models.Model):
    user = models.ForeignKey(User, null=True) # null=True: only so because this happens 'in the wild', i.e.
                                              # in already existing data. Other than that there is no good
                                              # reason for it

    global_id = models.CharField(max_length=36, unique=True,
                                 default=create_global_id)
    last_participation = models.ForeignKey('Participation', null=True, blank=True)
    last_participation_date = models.DateTimeField(null=True, blank=True)

    name = models.CharField(max_length=100)
    deleted = models.BooleanField(default=False)

    class Meta:
        verbose_name_plural = 'User'

    def __unicode__(self):
        return self.name

    def get_edit_url(self):
        from . import views
        return '%s?gid=%s' % (reverse(views.people_edit), self.global_id)

    def get_profile_url(self):
        from . import views
        return '%s?gid=%s' % (reverse(views.profile_index), self.global_id)

    def get_survey_url(self):
        from . import views
        return '%s?gid=%s' % (reverse(views.index), self.global_id)

    def get_remove_url(self):
        from . import views
        return '%s?gid=%s' % (reverse(views.people_remove), self.global_id)

    def get_last_weekly_survey_date(self):
        try:
            cursor = connection.cursor()
            cursor.execute("select max(timestamp) from pollster_results_weekly where global_id = %s", [self.global_id])
        except:
            # (Klaas) not sure if this is still used in the actual app; it's used here at least for testing
            # The regular flow uses the pollster_results_weekly table
            if self.last_participation_date:
                return self.last_participation_date
            return self.user.date_joined

        row = cursor.fetchone()
        result = row[0]

        if result is None:
            return self.user.date_joined
        return result

class Survey(models.Model):
    survey_id = models.CharField(max_length=50, unique=True)
    title = models.TextField('')
    created = models.DateTimeField(auto_now_add=True)
    updated = models.DateTimeField(auto_now=True)
    title = models.CharField(max_length=200)
    description = models.TextField(null=True, blank=True)
    specification = models.TextField()

    def __unicode__(self):
        return '%s - %s' % (self.survey_id, self.title)

class Participation(models.Model):
    user = models.ForeignKey(SurveyUser)
    survey = models.ForeignKey(Survey)
    date = models.DateTimeField(auto_now_add=True)
    epidb_id = models.CharField(max_length=36, null=True)
    previous_participation = models.ForeignKey('self', null=True)
    previous_participation_date = models.DateTimeField(null=True)

    def __unicode__(self):
        return '%s (%s)' % (self.user.name, self.date)

    class Meta:
        verbose_name_plural = 'Survey participation log'

class ResponseSendQueue(models.Model):
    participation = models.ForeignKey(Participation)
    date = models.DateTimeField(auto_now_add=True)
    user_id = models.CharField(max_length=36)
    survey_id = models.CharField(max_length=50)
    answers = models.TextField()

    def set_sent(self, epidb_id):
        self.participation.epidb_id = epidb_id
        self.participation.save()
        self.delete()

class ProfileSendQueue(models.Model):
    owner = models.ForeignKey(SurveyUser)
    date = models.DateTimeField()
    user_id = models.CharField(max_length=36)
    survey_id = models.CharField(max_length=50)
    answers = models.TextField()

    def set_sent(self, epidb_id):
        self.delete()

class LocalResponse(models.Model):
    date = models.DateTimeField()
    user_id = models.CharField(max_length=36)
    survey_id = models.CharField(max_length=50)
    answers = models.TextField()

class Profile(models.Model):
    user = models.ForeignKey(SurveyUser, unique=True)
    created = models.DateTimeField(null=True, default=None)
    updated = models.DateTimeField(null=True, default=None)
    valid = models.BooleanField(default=False)
    data = models.TextField(null=True, blank=True, default=None)
    survey = models.ForeignKey(Survey, null=True, default=None)

    def save(self):
        if self.valid:
            self.updated = datetime.now()
            if self.created is None:
                self.created = self.updated

        super(Profile, self).save()

    class Meta:
        verbose_name_plural = 'User profile'

class LastResponse(models.Model):
    user = models.ForeignKey(SurveyUser, unique=True)
    participation = models.ForeignKey(Participation, null=True, default=None)
    data = models.TextField(null=True, blank=True, default=None)

def add_empty_profile(sender, instance, created, **kwargs):
    if created:
        profile = Profile()
        profile.user = instance
        profile.save()

def add_empty_last_response(sender, instance, created, **kwargs):
    if created:
        response = LastResponse()
        response.user = instance
        response.participation = Participation(date=epoch())
        response.save()

post_save.connect(add_empty_profile, sender=SurveyUser)
post_save.connect(add_empty_last_response, sender=SurveyUser)


class LocalProfile(models.Model):
    surveyuser = models.ForeignKey(SurveyUser, unique=True)
    sq_num_season = models.SmallIntegerField(null=True)
    sq_num_total = models.SmallIntegerField(null=True)
    sq_date_first = models.DateField(null=True)
    sq_date_last = models.DateField(null=True)
    birth_date = models.DateField()
    zip_code = models.CharField(max_length=5) # check internationalization
    region = models.CharField(max_length=30, null=True)
    gender = models.CharField(max_length=1)
    a_family = models.SmallIntegerField() # aggregated info
    a_smoker = models.CharField(max_length=1)
    a_vaccine_prev_seasonal = models.CharField(max_length=1)
    a_vaccine_prev_swine = models.CharField(max_length=1)
    a_vaccine_current = models.CharField(max_length=1)

class LocalFluSurvey(models.Model):
    surveyuser = models.ForeignKey(SurveyUser, unique=False)
    date = models.DateTimeField()
    status = models.CharField(max_length=8) # aggregated info
    age_user = models.SmallIntegerField()
    data = models.TextField() # pickled
    survey_id = models.CharField(max_length=50)


