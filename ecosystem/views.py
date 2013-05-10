from django.shortcuts import render
from django.http import HttpResponseRedirect

import random, datetime

# redirects to home page
def redirects(request):
    return HttpResponseRedirect('/home/')

# home page view
def home(request):
	if 'q' in request.GET:
		feed = (request.GET['q'])
		if feed != '':
			feed = (request.GET['q'])
			#safefeed = feed.encode('ascii', 'ignore')
			time = str(datetime.datetime.now())
			browser = str(request.META.get('HTTP_USER_AGENT', 'unknown'))
			ip = str(request.META.get('REMOTE_ADDR', 'unknown'))
			try:
				f = open('media/feedback.csv', 'a')
				s = str(feed + ';' + time + ';' + browser + ';' + ip + '\n')
				f.write(s)
				f.close()
				sent = True
			except:
				sent = False
		else:
			sent = False
	else:
		sent = False

	return render(request, 'home.html', {
		'title': 'home',
		'desc': 'General view of your basic services',
		'sent' : sent,
		} )

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
		'pic3': applist[20],
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






