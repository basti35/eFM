from django.db import models

class ExampleApp(models.Model):
	name = models.CharField(max_length=30)
	appearance_order = models.IntegerField()
	lead = models.CharField(max_length=200)
	picture_url = models.URLField()
	general_description = models.CharField(max_length=1000)
	additional_description = models.CharField(blank=True, max_length=1000)
	sensor_1 = models.CharField(max_length=20)
	sensor_2 = models.CharField(blank=True, max_length=20)
	button_left = models.CharField(max_length=20)
	button_right = models.CharField(max_length=20)

	def __unicode__(self):
		return self.name

	class Meta:
		ordering = ['appearance_order']
