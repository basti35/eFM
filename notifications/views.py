from django.shortcuts import render
from notifications.models import *


def notifications(request):



	return render(request, 'notifications/notifications.html', {
		'title': 'notifications',

		})