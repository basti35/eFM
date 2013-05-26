# SERVICES MODELS

from django.db import models

# commercial service package
class Package(models.Model):
	name = models.CharField(max_length=20)
	lead = models.CharField(blank=True, max_length=35)
	picture_url = models.URLField(blank=True)
	general_description = models.TextField(max_length=200)
	additional_description = models.TextField(blank=True, max_length=500)
	price = models.DecimalField(blank=True, null=True, max_digits=6, decimal_places=2)
	def __unicode__(self):
		return self.name

# example service
class ExampleService(models.Model):
	name = models.CharField(max_length=15)
	lead = models.CharField(max_length=50)

	logo_url = models.URLField()
	service_description = models.TextField(max_length=200)
	additional_description = models.TextField(blank=True, max_length=300)
	sensor_1 = models.CharField(blank=True, max_length=20)
	sensor_2 = models.CharField(blank=True, max_length=20)
	def __unicode__(self):
		return self.name
	class Meta:
		ordering = ['id']