#from django.db import models
#
#
## Create your models here.
#
#class serprovs(models.Model):
#  yp_page = models.CharField(max_length=150)
#  name = models.CharField(max_length=150)
#  owner = models.CharField(max_length=150)
#  logo = models.CharField(max_length=80)
#  address = models.CharField(max_length=80)
#  full_city = models.CharField(max_length=400)
#  city = models.CharField(max_length=30)
#  tel = models.CharField(max_length=40)
#  fax = models.CharField(max_length=50)
#  mail = models.EmailField(max_length=254)
#  description = models.CharField(max_length=1500)
#  url = models.CharField(max_length=80)
#  others = models.CharField(max_length=100)
#  latest_feedb = models.ForeignKey(feedbacks_serprov, blank=True, null=True) #see http://stackoverflow.com/questions/2197975/how-to-use-array-in-django
#  hourly_price= models.DecimalField(max_digits=5, decimal_places=2)
#  firstAvailability=models.DateTimeField()
#  password= models.CharField(max_length=30)
#  pass_md5= models.CharField(max_length=30)
#  def __unicode__(self):
#    return self.name
#
#class feedbacks_serprov(models.Model):
#  intervention_id = models.ForeignKey(interventions, blank=True, null=True)
#  serprov_id = models.ForeignKey(serprovs, blank=True, null=True)
#  rate = models.DecimalField(max_digits=2, decimal_places=1)
#  note = models.CharField(max_length=250)
#  
#
#class interventions(models.Model):
#  #STATUS ENUM: http://www.b-list.org/weblog/2007/nov/02/handle-choices-right-way/
#  OPENING=1
#  REQUESTING=2
#  WAITING_RES=3
#  ACCEPTED=4
#  WORKING=5
#  DONE=6
#  FEEDBACK_1=7
#  CLOSED=8
#  REFUSED=9
#
#  STATUS_CHOICES = (
#    (OPENING, 'Opening or draft')
#    (REQUESTING, 'Requesting')
#    (WAITING_RES, 'Waiting resident action')
#    (ACCEPTED, 'Accepted')
#    (WORKING, 'Working')
#    (DONE, 'Done')
#    (FEEDBACK_1, 'First feedback collected')
#    (CLOSED, 'Closed')
#    (REFUSED, 'Refused'))
#
#  status = models.IntegerField(choices=STATUS_CHOICES, default=OPENING)
#  feedbacks_serprov_id = models.ForeignKey(feedback_serprovs, blank=True, null=True)
#
#
#
