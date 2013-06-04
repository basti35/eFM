# PROVIDER ADMIN

from django.contrib import admin
from provider.models import *

# register your models for admin here
admin.site.register(serprovs)
admin.site.register(feedbacks_serprov)
admin.site.register(interventions)
