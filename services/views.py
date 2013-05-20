from django.shortcuts import render
from services.models import ExampleApp

def services(request):

	applist = ExampleApp.objects.all()

	return render(request, 'services/services.html', {
		'title': 'services',
		'desc': 'Add new services to your system',
		'applist' : applist,
		})