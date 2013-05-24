# MANAGER VIEWS

from django.shortcuts import render
from manager.models import *

def manager(request):
	return render(request, 'manager/manager.html', {
		'title': 'manager',

		})
