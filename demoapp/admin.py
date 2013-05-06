from django.contrib import admin
from demoapp.models import Poll, Choice



class ChoiceInline(admin.StackedInline):
    model = Choice
    extra = 3

class PollAdmin(admin.ModelAdmin):
    fieldsets = [
        (None,               {'fields': ['question']}),
        ('Date information', {'fields': ['pub_date'], 'classes': ['collapse']}),
    ]
    inlines = [ChoiceInline]

admin.site.register(Poll, PollAdmin)



# admin.site.register(Publisher)
# admin.site.register(Author)
# admin.site.register(Book)