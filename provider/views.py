# PROVIDER VIEWS

from django.shortcuts import render
from provider.models import *
from home.models import *

# view function that is called by spefic url (ecosystem/urls.py)
def provider(request):


	# create your view business logic here and return to render data you need for templates
	examplelist = Serprov.objects.all()


	return render(request, 'provider/provider.html', { 		# define a html template to use
		'title': 'provider',
		'templatevaluelist' : examplelist,					# define data to template variables
		})


def failure(request, failure_id):

	# failure types
	FAILURE1 = 'water leak'
	FAILURE2 = 'too much power'
	FAILURE3 = 'conditioning failure'

	test = failure_id

	if failure_id == '1':
		failure = FAILURE1
		device = Sensor.objects.get(code='05')
	elif failure_id == '2':
		failure = FAILURE2
		device = Sensor.objects.get(code='03')
	elif failure_id == '3':
		failure = FAILURE3
		device = Sensor.objects.get(code='02')
	else:
		failure = False
		device = False


	return render(request, 'provider/failure.html', {
		'title': 'failure',
		'failure' : failure,
		'device' : device,
		'test' : test,


		})