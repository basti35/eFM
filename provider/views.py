# PROVIDER VIEWS

from django.shortcuts import render
from django.http import HttpResponseRedirect
from provider.models import *
from home.models import Sensor

import datetime

# 1 step: failure alert
def failure(request, failure_id):

	# define failure types, devices and business fields
	FAILURE1 = 'water leake'
	FAILURE2 = 'too much power'
	FAILURE3 = 'conditioning failure'

	if failure_id == '1':
		failure = FAILURE1
		device = Sensor.objects.get(code='05')
		bfield = 9
	elif failure_id == '2':
		failure = FAILURE2
		device = Sensor.objects.get(code='03')
		bfield = 2
	elif failure_id == '3':
		failure = FAILURE3
		device = Sensor.objects.get(code='02')
		bfield = 7
	else:
		failure = False
		device = False
		bfield = False

	request.session["field"] = bfield

	return render(request, 'provider/failure.html', {
		'title': 'failure',
		'failure' : failure,
		'device' : device,
		'providerfield' : bfield,
		})

# 2 step: choosing provider
def provider(request, field_id):

	# get type of service
	try:
		field = Serprov.objects.filter(field=field_id)[0]
	except:
		field = False

	# get provider data from a specific business field
	providers = Serprov.objects.filter(field=field_id).order_by("-avg_rate")[0:3]

	return render(request, 'provider/provider.html', {
		'title': 'provider',
		'providerdata' : providers,
		'field' : field,
		})

# 3 step: confirmating deal
def confirmation(request, provider_id):

	# selected provider
	try:
		provider = Serprov.objects.get(id=provider_id)
	except:
		provider = False

	rate = provider.avg_rate
	try:
		stars = int(rate)
	except:
		stars = 0

	return render(request, 'provider/confirmation.html', {
		'title': 'provider',
		'provider' : provider,
		'stars' : stars,
		})

# 4 step: review
def review(request, provider_id):

	# selected provider
	try:
		provider = Serprov.objects.get(id=provider_id)
		price = provider.hourly_price * 2
	except:
		provider = False
		price = 0

	price = provider.hourly_price * 2

	return render(request, 'provider/review.html', {
		'title': 'provider',
		'provider' : provider,
		'price' : price,
		})

# file review and redirect to home page
def archieve(request):
	if request.method == 'POST':
		"""
        TODO: add code for writing review in the db
		"""
	else:
		return HttpResponseRedirect('/home/')

# notes
def notifications(request):
	return render(request, 'provider/notifications.html', {
		'title': 'notifications',
		})