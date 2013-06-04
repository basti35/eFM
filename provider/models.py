# PROVIDER MODELS

from django.db import models

#provider profile
class serprovs(models.Model):
  yp_page = models.URLField(max_length=150)
  name = models.CharField(max_length=150)
  owner = models.CharField(max_length=150)
  logo = models.CharField(max_length=80)
  address = models.CharField(max_length=80)
  full_city = models.CharField(max_length=399)
  city = models.CharField(max_length=29)
  tel = models.CharField(max_length=40)
  fax = models.CharField(max_length=50)
  mail = models.EmailField(max_length=254)
  description = models.CharField(max_length=1500)
  url = models.URLField(max_length=80)
  others = models.CharField(max_length=100)
  hourly_price= models.DecimalField(max_digits=5, decimal_places=2)
  password= models.CharField(max_length=30)
  pass_md5= models.CharField(max_length=50)
  def __unicode__(self):
    return self.name

#intervention state
class interventions(models.Model):
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
  serprov = models.ForeignKey(serprovs, blank=True, null=True)
  firstAvailability=models.DateTimeField()
  def __unicode__(self):
    return self.name

#feedback
class feedbacks_serprov(models.Model):
  intervention = models.OneToOneField(interventions, blank=True, null=True)
  serprov = models.ForeignKey(serprovs, blank=True, null=True)
  rate = models.DecimalField(max_digits=2, decimal_places=1)
  note = models.CharField(max_length=250)
  def __unicode__(self):
    return self.name
