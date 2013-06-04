# NOTIFICATIONS ADMIN

from django.contrib import admin
from notifications.models import *

# register your models for admin here
admin.site.register(Provider)
admin.site.register(Feedback)
admin.site.register(Intervention)
