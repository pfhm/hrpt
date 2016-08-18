#Model for storing the code the user provides wtih registration
from django.db import models
from django.contrib.auth.models import User

class user_profile(models.Model):
    user=models.ForeignKey(User, unique=True)
    yearofbirth=models.IntegerField()
    idcode=models.CharField(max_length=10)

    def __unicode__(self):
        return u'%s %s' % (self.user, self.idcode)
