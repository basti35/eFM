from django.conf.urls import patterns, url, include
from efmproject.views import *

# Uncomment the next two lines to enable the admin:
from django.contrib import admin
admin.autodiscover()

urlpatterns = patterns('',

    url(r'^$', redirects), # redirects to home
    url(r'^home/$', home),
    url(r'^services/$', services),
    url(r'^sensors/$', sensors),

    url(r'^provider/$', provider),

   # url(r'^services/provider$', provider),
    #url(r'^myapp/', include('mysite.myapp.urls')),


    # Examples:
    # url(r'^$', 'efmproject.views.home', name='home'),
    # url(r'^efmproject/', include('efmproject.foo.urls')),

    # Uncomment the admin/doc line below to enable admin documentation:
    # url(r'^admin/doc/', include('django.contrib.admindocs.urls')),

    # Uncomment the next line to enable the admin:
    url(r'^admin/', include(admin.site.urls)),
)
