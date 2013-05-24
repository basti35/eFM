from django.contrib import admin
from services.models import *

admin.site.register(Service)
admin.site.register(Sensor)
admin.site.register(Package)
admin.site.register(Technology)
admin.site.register(Category)
admin.site.register(ServiceType)
