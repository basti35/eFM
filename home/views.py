# HOME VIEWS

from django.shortcuts import render
from django.db import IntegrityError
from django.http import HttpResponseRedirect
from services.models import *
from home.models import *

import datetime

# redirects to home page
def redirects(request):
	Service.objects.all().update(connected=False)
	request.session["webcam"] = False
	return HttpResponseRedirect('/home/')

# home page view
def home(request):

	try:
		if request.session["webcam"] == True:
			webcam = True
			button = 'btn-danger'
			text = 'Close stream'
			arrow = 'down'
		else:
			webcam = False
			button = 'btn-primary'
			text = 'Open stream'
			arrow = 'right'
	except:
		webcam = False

	applist = Service.objects.filter(connected=True)

	return render(request, 'home/home.html', {
		'title': 'home',
		'applist' : applist,
		'webcam' : webcam,
		'button' : button,
		'text' : text,
		'arrow' : arrow,
		})


# webcam stream
def webcam(request):
	try:
		if request.session["webcam"] == True:
			request.session["webcam"] = False
		else:
			request.session["webcam"] = True
	except:
		pass
	return HttpResponseRedirect('/home/')
