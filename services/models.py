from django.db import models

class Service(models.Model):
	name = models.CharField(max_length=20)
	lead = models.CharField(max_length=20)
	desc1 = models.CharField(max_length=200)
	desc2 = models.CharField(max_length=200)

	def __unicode__(self):
		return self.name
