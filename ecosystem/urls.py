from django.conf.urls.defaults import *
from ecosystem.views import *

# Uncomment the next two lines to enable the admin:
from django.contrib import admin
admin.autodiscover()

urlpatterns = patterns('',

    url(r'^$', redirects), # redirects to home

    url(r'^home/$', home),
    url(r'^manage/$', manage),
    url(r'^services/$', services),


    # for temporary testing
    url(r'^test/$', test),

    # Examples:
    # url(r'^$', my_homepage_view),
    # url(r'^$', 'ecosystem.views.home', name='home'),
    # url(r'^ecosystem/', include('ecosystem.foo.urls')),

    # Uncomment the admin/doc line below to enable admin documentation:
    # url(r'^admin/doc/', include('django.contrib.admindocs.urls')),

    # Uncomment the next line to enable the admin:
    url(r'^admin/', include(admin.site.urls)),
    url(r'^polls/', include('demoapp.urls', namespace="polls")),


)


"""
    #EXAMPLE PAGES by Joni
    url(r'^hello/$', first_print), # simple hello print view
	url(r'^time/$', current_datetime), # first dynamic content
	url(r'^time/plus/(\d{1,2})/$', hours_ahead), # shows time with offset given
    url(r'^template1/$', template_rendering1), # template object rendering
    url(r'^sally/$', sally), # dot
    url(r'^now/$', now), # 
    url(r'^dot/$', dot), # 
    url(r'^timenow/$', time_now), # first purely template based view
    url(r'^current/$', current_time), # using render()
    url(r'^extended/$', demo_time),
    
"""
