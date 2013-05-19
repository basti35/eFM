from django.shortcuts import render

def services(request):



	return render(request, 'apps/services.html', {
		'title': 'services',
		'desc': 'Add new services to your system',

		})