# HOME MODELS

from django.db import models


# sensor connection technology
class Technology(models.Model):
	name = models.CharField(max_length=20)
	lead = models.CharField(blank=True, max_length=100)
	logo_url = models.URLField(blank=True)
	def __unicode__(self):
		return self.name

# sensor
class Sensor(models.Model):
	label = models.CharField(max_length=20)
	code = models.PositiveIntegerField()
	lead = models.CharField(blank=True, max_length=25)
	picture_url = models.URLField(blank=True)
	description = models.CharField(blank=True, max_length=200)
	technology = models.ManyToManyField(Technology, blank=True, null=True)
	price = models.DecimalField(blank=True, null=True, max_digits=6, decimal_places=2)
	installed = models.NullBooleanField()
	date = models.DateField(auto_now_add=True)
	def __unicode__(self):
		return self.label
	class Meta:
		ordering = ['date']

# service type category
class Category(models.Model):
	name = models.CharField(max_length=20)
	lead = models.CharField(blank=True, max_length=200)
	def __unicode__(self):
		return self.name

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

# application
class Application(models.Model):
	name = models.CharField(max_length=15)
	lead = models.CharField(blank=True, max_length=25)
	picture_url = models.URLField(blank=True)
	general_description = models.TextField(max_length=200)
	additional_description = models.TextField(blank=True, max_length=500)
	sensors = models.ManyToManyField(Sensor, blank=True, null=True)
	package = models.ManyToManyField(Package, blank=True, null=True)
	category = models.ManyToManyField(Category, blank=True, null=True)
	extra_field_1 = models.CharField(blank=True, max_length=200)
	extra_field_2 = models.CharField(blank=True, max_length=200)
	price = models.DecimalField(blank=True, null=True, max_digits=6, decimal_places=2)
	installed = models.NullBooleanField()
	date = models.DateField(auto_now_add=True)
	def __unicode__(self):
		return self.name
	class Meta:
		ordering = ['date']

