# PROVIDER MODELS

from django.db import models

#provider profile
class Serprov(models.Model):
  yp_page = models.URLField(max_length=150, null=True, blank=True)
  name = models.CharField(max_length=150)
  owner = models.CharField(max_length=150, null=True, blank=True)
  logo = models.CharField(max_length=80, null=True, blank=True)
  address = models.CharField(max_length=80)
  full_city = models.CharField(max_length=399)
  city = models.CharField(max_length=29)
  tel = models.CharField(max_length=40, null=True, blank=True)
  fax = models.CharField(max_length=50, null=True, blank=True)
  mail = models.EmailField(max_length=254, null=True, blank=True)
  description = models.CharField(max_length=1500, null=True, blank=True)
  url = models.URLField(max_length=80, null=True, blank=True)
  others = models.CharField(max_length=100, null=True, blank=True)

  BUILDING_CONSTRUCTIONS=1
  ELECTRICIAN=2
  HOUSEHOLD_APPLIANCES=3
  LIFTS=4
  TV_RADIO_AERIALS=5
  BOILER_HEATING=6
  HEATING=7
  CONDITIONING=8
  PLUMBERS=9
  GARDENING=10
  BLACKSMITH=11
  WHITEWASHING=12
  CLEANING_SERVICES=13

  FIELD_CHOICES = (
    (BUILDING_CONSTRUCTIONS, 'buiding costructions'),
    (ELECTRICIAN, 'electrician'),
    (HOUSEHOLD_APPLIANCES, 'household appliances'),
    (LIFTS, 'lifts - installation and manteinance'),
    (TV_RADIO_AERIALS, 'tv, radio and aerials'),
    (BOILER_HEATING, 'boiler and heating'),
    (HEATING, 'heating system'),
    (CONDITIONING, 'conditioning'),
    (PLUMBERS, 'plumbers'),
    (GARDENING, 'gardening'),
    (BLACKSMITH, 'blacksmith'),
    (WHITEWASHING, 'whitewashing'),
    (CLEANING_SERVICES, 'cleaning services'))

  field = models.IntegerField(choices=FIELD_CHOICES, null=True)
  hourly_price= models.DecimalField(max_digits=5, decimal_places=2, blank=False)
  longitude = models.FloatField(blank=True)
  latitude = models.FloatField(blank=True)
  avg_rate = models.DecimalField(max_digits=2, decimal_places=1, null=True)
  n_rates = models.IntegerField(null=True)
  password= models.CharField(max_length=30, blank=False)
  pass_md5= models.CharField(max_length=50, blank=True)
  def __unicode__(self):
    return self.name



#intervention state
class Intervention(models.Model):
  #STATUS ENUM: http://www.b-list.org/weblog/2007/nov/02/handle-choices-right-way/
  OPENING=1
  CHOOSING=2
  ACCEPTED=3
  WORKING=4
  DONE=5
  FEEDBACK=6
  CLOSED=7
  REFUSED=8
  STATUS_CHOICES = (
    (OPENING, 'opening'),
    (CHOOSING, 'waiting for resident choose'),
    (ACCEPTED, 'accepted'),
    (WORKING, 'working'),
    (DONE, 'done'),
    (FEEDBACK, 'feedback'),
    (CLOSED, 'closed'),
    (REFUSED, 'refused'))
  status = models.IntegerField(choices=STATUS_CHOICES, default=OPENING)

  WATER_LEAKE=1
  TOO_MUCH_POWER=2
  CONDITIONING_FAILURE=3
  FAILURE_TYPES = (
    (WATER_LEAKE, 'water leake'),
    (TOO_MUCH_POWER, 'too much power'),
    (CONDITIONING_FAILURE, 'conditioning failure'))
  failure = models.IntegerField(choices=FAILURE_TYPES)
  
  serprov = models.ForeignKey(Serprov, blank=False, null=True)
  firstAvailability=models.DateTimeField()
  def __unicode__(self):
    return self.name



#feedback
class Feedback_serprov(models.Model):
  intervention = models.OneToOneField(Intervention, blank=True, null=True)
  serprov = models.ForeignKey(Serprov, blank=True, null=True)
  rate = models.DecimalField(max_digits=2, decimal_places=1, blank=False)
  note = models.CharField(max_length=250)
  def __unicode__(self):
    return self.name
