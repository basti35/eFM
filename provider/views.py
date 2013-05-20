from django.shortcuts import render
from provider.models import *

# view function that is called by spefic url (ecosystem/urls.py)
def provider(request):


	# create your view business logic here and return to render data you need for templates
	examplelist = Example.objects.all()


	return render(request, 'provider/index.html', { 		# define a html template to use
		'title': 'provider',
		'templatevaluelist' : examplelist,					# define data to template variables
		})