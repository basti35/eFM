# HOME VIEWS

from django.shortcuts import render
from django.http import HttpResponseRedirect
from django.shortcuts import get_object_or_404
from home.models import *

import datetime
from django import forms


# redirects to home page
def redirects(request):
	request.session["webcam"] = False
	return HttpResponseRedirect('/home/')

# return all created apps
def returnall(request):
	Application.objects.all().update(installed=True)
	return HttpResponseRedirect('/home/')

# toggles webcam stream
def webcam(request):
	if request.session["webcam"]:
		request.session["webcam"] = False
	else:
		request.session["webcam"] = True
	return HttpResponseRedirect('/home/')


# home page view
def home(request):

	sensordata = []

	 # if sensor registered
	if 'id' in request.GET:
		request.session['latest_sensor'] = (request.GET['id'])
		appform = True
	else:
		appform = False
		sensorcode = False


	try:
		if request.session['latest_sensor']:
			sensorcode = request.session['latest_sensor']
		else:
			sensorcode = False
	except:
	  sensorcode = False

	webcam = False
	try:
		if request.session["webcam"]:
			webcam = True
	except:
		pass

	# if creating a new app
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
		try:
			sensordata = []
			num = int(sensorcode)
			p = Sensor.objects.get(code=num)
			sensordata.append(p.label) # 0
			sensordata.append(p.brand) # 1
			sensordata.append(p.lead) # 2
			sensordata.append(p.picture_url) # 3
			sensordata.append(p.code) # 4
		except:
			pass
		form = AppForm(
			initial={'application_name': ''}
			) # An unbound form

	# GENERAL

	installed_apps = Application.objects.filter(installed=True)

	return render(request, 'home/home.html', {
		'title': 'home',
		'applist' : installed_apps,
		'sensorcode' : sensorcode,
		'appform' : appform,
        'form': form,
        'webcam' : webcam,
        'sensordata' : sensordata,
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
    picture_uRL = forms.URLField(required=False)
