# HOME VIEWS

from django.shortcuts import render
from django.http import HttpResponseRedirect
from django.shortcuts import get_object_or_404
from home.models import *

import datetime
from django import forms

# redirects to home page
def redirects(request):

	return HttpResponseRedirect('/home/')

# home page view
def home(request):
	form = ()
	if request.method == 'POST':
		form = AppForm(request.POST) # A form bound to the POST data
		if form.is_valid(): # All validation rules pass
		    name = form.cleaned_data['application_name']
		    lead = form.cleaned_data['description']
		    author = form.cleaned_data['app_owner']
		    n = Application(
		    	name = form.cleaned_data['application_name'],
		    	lead = form.cleaned_data['description'],
		    	author = form.cleaned_data['app_owner'],
		    	picture_url = form.cleaned_data['picture_uRL'],
		    	sensor = int(request.session['latest_sensor']),
		    	installed = True
		    	)
		    n.save()
		    return HttpResponseRedirect('/home/') # Redirect after POST
	else:
		form = AppForm() # An unbound form

    # if sensor registered
	if 'id' in request.GET:
		sensorcode = (request.GET['id'])
		request.session['latest_sensor'] = sensorcode
		appform = True
	else:
		sensorcode = False
		appform = False

	# GENERAL

	installed_apps = Application.objects.filter(installed=True)

	return render(request, 'home/home.html', {
		'title': 'home',
		'applist' : installed_apps,
		'sensorcode' : sensorcode,
		'appform' : appform,
        'form': form,
		})

# remove app
def remove(request, application_id):
	p = get_object_or_404(Application, pk=application_id)
	try:
		p.installed=False
		p.save()
	except:
		pass
	return HttpResponseRedirect('/home/')




# app creation form
class AppForm(forms.Form):
    application_name = forms.CharField(max_length=15)
    description = forms.CharField(max_length=25)
    app_owner = forms.CharField(max_length=15)
    picture_uRL = forms.URLField()
