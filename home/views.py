# HOME VIEWS

from django.shortcuts import render
from django.http import HttpResponseRedirect
from home.models import *

import datetime

# redirects to home page
def redirects(request):

	return HttpResponseRedirect('/home/')

# home page view
def home(request):


	return render(request, 'home/home.html', {
		'title': 'home',

		})