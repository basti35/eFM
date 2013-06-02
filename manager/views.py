# MANAGER VIEWS

from django.shortcuts import render
from home.models import *

import random

def manager(request):

	try:
		user = request.session['user']
	except:
		user = 'Unknown user'

	a = random.uniform(10, 20)

	installed = Application.objects.filter(installed=True)

	return render(request, 'manager/manager.html', {
		'title': 'manager',
		'applist' : installed,
		'user' : user,
		'balance' : "%.2f" % round(a,2),

		})
