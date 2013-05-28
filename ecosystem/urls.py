from django.conf.urls import patterns, url, include

from home.views import *
from services.views import *
from manager.views import *
from provider.views import *

# Uncomment the next two lines to enable the admin:
from django.contrib import admin
admin.autodiscover()

urlpatterns = patterns('',

    url(r'^$', redirects), # redirects to home
    url(r'^home/$', home),
    url(r'^webcam/$', webcam),
    url(r'^home/all/$', returnall),
    url(r'^home/flush/$', flush),
    url(r'^remove/(?P<application_id>\d+)/$', remove),

    url(r'^services/$', services),

    url(r'^manager/$', manager),

    url(r'^provider/$', provider),

    # ex: /services/1/
    #url(r'^(?P<app_id>\d+)/$', views.detail, name='detail'),
    #url(r'^myapp/', include('mysite.myapp.urls')),

    # Examples:
    # url(r'^$', 'ecosystem.views.home', name='home'),
    # url(r'^ecosystem/', include('ecosystem.foo.urls')),

    # Uncomment the admin/doc line below to enable admin documentation:
    # url(r'^admin/doc/', include('django.contrib.admindocs.urls')),

    # Uncomment the next line to enable the admin:
    url(r'^admin/', include(admin.site.urls)),

)
