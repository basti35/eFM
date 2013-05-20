from django.shortcuts import render
from django.db import IntegrityError
from django.http import HttpResponseRedirect

import datetime

from feedback.models import *

# redirects to home page
def redirects(request):
    return HttpResponseRedirect('/home/')

# home page view
def home(request):

	if 'q' in request.GET:
		feed = (request.GET['q'])
		if feed != '':
			feed = str(request.GET['q'])
			#safefeed = feed.encode('ascii', 'ignore') # doesn't work on server
			time = str(datetime.datetime.now())
			browser = str(request.META.get('HTTP_USER_AGENT', 'unknown'))
			ip = str(request.META.get('REMOTE_ADDR', 'unknown'))
			try:
				f = Feedback(message = feed, time = time, browser = browser, ip = ip)
				f.save()
				sent = True
			except IntegrityError, e:
				message = e.message
				sent = False
				return render(request, 'feedback.html', {'error': message,})
		else:
			sent = False
	else:
		sent = False

	return render(request, 'home.html', {
		'title': 'home',
		'desc': 'General view of your services',
		'sent' : sent,
		})

def sensors(request):
	return render(request, 'apps/sensors.html', {
		'title': 'sensors',
		'desc': 'Manage your hardware',

		})

def provider(request):
	return render(request, 'apps/provider.html', {
		'title': 'provider Finder',
		'desc': 'Finds the best provider before you even know you need one!',

		})


def feedback(request):
	fb = Feedback.objects.all()
	return render(request, 'feedback/feedback.html', {
		'title': 'feedback',
		'desc': 'Feedback people have sent to us',
		'list': fb,
		})

def doc(request):
	return render(request, 'doc.html', {
		'title': 'documentation',
		'desc': 'Short documentation',
		})


def test(request):
	return render(request, 'test.html', {
		'title': 'test',
		'desc': 'Test page for development',
		})