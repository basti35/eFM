# MANAGER VIEWS

from django.shortcuts import render
from home.models import *

def manager(request):

	try:
		user = request.session['user']
	except:
		user = 'User details'


	installed_sensors = Sensor.objects.filter(installed=True)

	return render(request, 'manager/manager.html', {
		'title': 'manager',
		'sensorlist' : installed_sensors,
		'user' : user
		})
