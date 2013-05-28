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

# return all created apps
def flush(request):
	Application.objects.all().update(installed=False)
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

	sensor = False

	 # if sensor registered
	if 'id' in request.GET:
		p = (request.GET['id'])
		request.session['latest_sensor'] = Sensor.objects.filter(code=p)
		sensor = request.session['latest_sensor']
		appform = True
	else:
		appform = False
		sensor = False

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
			p = request.session['latest_sensor'][0]
			r = Sensor.objects.get(id=p.id)
			n = Application(
		    	name = form.cleaned_data['feature_name'],
		    	lead = form.cleaned_data['description'],
		    	author = form.cleaned_data['owner'],
		    	icon = form.cleaned_data['icon'],
				sensor = r,
				installed = True
				)
			n.save()
			request.session['user'] = form.cleaned_data['owner']
			return HttpResponseRedirect('/home/') # Redirect after POST
	else:
		form = AppForm(
			initial={'feature_name': ''}
			) # An unbound form

	# GENERAL

	installed_apps = Application.objects.filter(installed=True)

	return render(request, 'home/home.html', {
		'title': 'home',
		'applist' : installed_apps,
		'appform' : appform,
        'form': form,
        'webcam' : webcam,
        'sensordata' : sensor,
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


ICON_CHOICES = (('', ''),
				('test1', 'test1'),
               	('test2', 'test2'),
               )

# app creation form
class AppForm(forms.Form):
    feature_name = forms.CharField(max_length=15)
    description = forms.CharField(max_length=25)
    owner = forms.CharField(max_length=15)
    icon = forms.ChoiceField(required=False, choices=ICON_CHOICES, initial='')
