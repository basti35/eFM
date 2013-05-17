from django.shortcuts import render
from django.db import IntegrityError
from django.http import HttpResponseRedirect

import random, datetime, csv

from feedback.models import *

# redirects to home page
def redirects(request):
    return HttpResponseRedirect('/home/')

# home page view
def home(request):

# seems to not work on server..
# 	temps = []
# 	f = open("media/temps.csv","rb")
# 	try:
# 		cr = csv.reader(f)
# 		for row in cr:
# 			temps.append(row)
# 		data = temps[len(temps)-1]
# 		item = data[1]
# 		temperature = float(item)
# 		temp = str('%.2f' % temperature) + ' °C'
# 	except:
# 		temp = 'error'
# 	f.close()

	message = 'no errors'
	if 'q' in request.GET:
		feed = (request.GET['q'])
		if feed != '':
			feed = str(request.GET['q'])
			#safefeed = feed.encode('ascii', 'ignore')
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
		'desc': 'General view of your basic services',
		'sent' : sent,
		'temp' : temp,
		})

def services(request):
	applist = []
	i = 0
	while i < 22:
		applist.append(random.randint(1, 30))
		i += 1
	return render(request, 'apps/services.html', {
		'title': 'services',
		'desc': 'Add new services to your system',
		'applist': applist,
		'pic1': applist[0],
		'pic2': applist[10],
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
	return render(request, 'feedback.html', {
		'title': 'feedback',
		'desc': 'Feedback people have sent to us',
		'list': fb,
		})


def temp(request):
	return render(request, 'feedback.html', {
		'temp' : temp,
		})
