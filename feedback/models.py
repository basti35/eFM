from django.db import models

#import datetime
#from django.utils import timezone

class Feedback(models.Model):
	message = models.CharField(max_length=200)
	time = models.DateTimeField('date')
	browser = models.CharField(max_length=200)
	ip = models.CharField(max_length=200)

	def __unicode__(self):
		return self.message

