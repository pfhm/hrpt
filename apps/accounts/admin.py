from django.contrib import admin
from django.contrib.auth.models import User
#For the new user_profile admin
from models import user_profile

from .forms import UnicodeUserChangeForm, UnicodeUserCreationForm

#new
class UserProfileInline(admin.StackedInline):
    model = user_profile

current_user_admin = type(admin.site._registry[User])

class UnicodeUserAdmin(current_user_admin):
    form = UnicodeUserChangeForm
    add_form = UnicodeUserCreationForm
    inlines = [ UserProfileInline, ]




admin.site.unregister(User)
admin.site.register(User, UnicodeUserAdmin)
