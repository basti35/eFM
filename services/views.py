from django.shortcuts import render
from services.models import ExampleService

def services(request):

	applist = ExampleService.objects.all()

	return render(request, 'services/services.html', {
		'title': 'services',
		'desc': 'Add new services to your system',
		'applist' : applist,
		})