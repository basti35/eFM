# SERVICES MODELS

from django.db import models


class Package(models.Model):
	name = models.CharField(max_length=50)
	lead = models.CharField(blank=True, max_length=200)
	picture_url = models.URLField(blank=True)
	general_description = models.TextField(max_length=200)
	additional_description = models.TextField(blank=True, max_length=500)
	price = models.CharField(blank=True, max_length=200)
	extra_field_1 = models.CharField(blank=True, max_length=200)
	extra_field_2 = models.CharField(blank=True, max_length=200)
	extra_field_3 = models.CharField(blank=True, max_length=200)

	def __unicode__(self):
		return self.name
	class Meta:
		ordering = ['id']


class Category(models.Model):
	name = models.CharField(max_length=50)
	lead = models.CharField(blank=True, max_length=200)

	def __unicode__(self):
		return self.name
	class Meta:
		ordering = ['id']


class Technology(models.Model):
	name = models.CharField(max_length=50)
	lead = models.CharField(blank=True, max_length=200)

	def __unicode__(self):
		return self.name
	class Meta:
		ordering = ['id']


class Sensor(models.Model):
	name = models.CharField(max_length=50)
	lead = models.CharField(blank=True, max_length=200)
	picture_url = models.URLField(blank=True)
	description = models.CharField(blank=True, max_length=200)
	technology = models.ManyToManyField(Technology, blank=True, null=True)
	price = models.DecimalField(blank=True, null=True, max_digits=6, decimal_places=2)
	installed = models.NullBooleanField()

	def __unicode__(self):
		return self.name
	class Meta:
		ordering = ['id']

class ServiceType(models.Model):
	name = models.CharField(max_length=20)

	def __unicode__(self):
		return self.name
	class Meta:
		ordering = ['id']


class Service(models.Model):
	name = models.CharField(max_length=50)
	lead = models.CharField(blank=True, max_length=25)
	picture_url = models.URLField(blank=True)
	general_description = models.TextField(max_length=200)
	additional_description = models.TextField(blank=True, max_length=500)
	service_type = models.ManyToManyField(ServiceType, blank=True, null=True)
	sensors = models.ManyToManyField(Sensor, blank=True, null=True)
	package = models.ManyToManyField(Package, blank=True, null=True)
	category = models.ManyToManyField(Category, blank=True, null=True)
	extra_field_1 = models.CharField(blank=True, max_length=200)
	extra_field_2 = models.CharField(blank=True, max_length=200)
	price = models.DecimalField(blank=True, null=True, max_digits=6, decimal_places=2)
	connected = models.NullBooleanField()

	def __unicode__(self):
		return self.name
	class Meta:
		ordering = ['id']