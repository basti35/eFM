# SERVICES VIEWS

from django.shortcuts import render
from services.models import *

def services(request):

	exampleservices = ExampleService.objects.all()

	return render(request, 'services/services.html', {
		'title': 'services',
		'exampleservices' : exampleservices,

		})