from django.db import models

# Create your models here.

class Example(models.Model):
	name = models.CharField(max_length=30)
	datastr1 = models.CharField(max_length=30)
	datastr2 = models.CharField(max_length=30)

	def __unicode__(self):
		return self.datastr