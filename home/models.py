# HOME MODELS

from django.db import models


# sensor brand, manufacturing company
class Brand(models.Model):
	name = models.CharField(max_length=20)
	logo_url = models.URLField()
	def __unicode__(self):
		return self.name

# sensor connection technology
class Technology(models.Model):
	name = models.CharField(max_length=20)
	logo_url = models.URLField()
	def __unicode__(self):
		return self.name

# sensor
class Sensor(models.Model):
	label = models.CharField(max_length=20)
	number = models.PositiveIntegerField(null=True)
	code = models.PositiveIntegerField()
	lead = models.CharField(blank=True, max_length=25)
	picture_url = models.URLField(blank=True)
	brand = models.ManyToManyField(Brand, blank=True, null=True)
	technology = models.ManyToManyField(Technology, blank=True, null=True)
	price = models.DecimalField(blank=True, null=True, max_digits=6, decimal_places=2)
	installed = models.BooleanField()
	date = models.DateField(auto_now_add=True)
	def __unicode__(self):
		return self.label
	class Meta:
		ordering = ['date']

# application type category
class Category(models.Model):
	name = models.CharField(max_length=20)
	lead = models.CharField(blank=True, max_length=200)
	def __unicode__(self):
		return self.name

# application
class Application(models.Model):
	name = models.CharField(max_length=15)
	lead = models.CharField(blank=True, max_length=25)
	picture_url = models.URLField(blank=True)
	sensor = models.PositiveIntegerField(null=True)
	category = models.ManyToManyField(Category, blank=True, null=True)
	author = models.CharField(blank=True, max_length=15)
	installed = models.BooleanField()
	date = models.DateField(auto_now_add=True)
	def __unicode__(self):
		return self.name
	class Meta:
		ordering = ['date']

