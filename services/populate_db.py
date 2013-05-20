
def collect()
	"""
	collects all the service info to db
	"""

	name = 'app1'
	lead = 'lead1'
	pic = 'kuva1'
	desc1 = 'sadasdsasddd'
	desc2 = 'sadasdsasddd'

	s = Service(name = name, lead = lead, desc1 = desc1, desc2 = desc2)
	s.save()

	name = 'app2'
	lead = 'lead2'
	pic = 'kuva2'
	desc1 = 'rgtrst'
	desc2 = 'sadasrtrtrtdsasddd'

	servicelist[name] = [lead, pic, desc1, desc2]

	name = 'app3'
	lead = 'lead3'
	pic = 'kuva3'
	desc1 = 'sadasdgfrgfgsasddd'
	desc2 = 'sadafgfgfgsdsasddd'

	servicelist[name] = [lead, pic, desc1, desc2]





def populate()
	i = 0
	try:
		for service in servicelist:
			s = Service(name = service[0], lead = service[1], desc1 = service[2], desc2 = service[3])
			# s.save()
			i += 1
	except IntegrityError, e:
		message = e.message
		sent = False
		return render(request, 'feedback.html', {'error': message,})






populate()



from django.db import models

class Service(models.Model):
	name = models.CharField(max_length=20)
	lead = models.CharField(max_length=20)
	desc1 = models.CharField(max_length=200)
	desc2 = models.CharField(max_length=200)
	def __unicode__(self):
		return self.name


	servicecatalogue = []
#1
	name = 'app1'
	lead = 'lead1'
	pic = 'kuva1'
	desc1 = 'sadasdsasddd'
	desc2 = 'sadasdsasddd'
	service = [name, lead, pic, desc1, desc2]
	servicecatalogue.append(service)
#2
	name = 'app1'
	lead = 'lead1'
	pic = 'kuva1'
	desc1 = 'sadasdsasddd'
	desc2 = 'sadasdsasddd'
	service = [name, lead, pic, desc1, desc2]
	servicecatalogue.append(service)
#3
	name = 'app1'
	lead = 'lead1'
	pic = 'kuva1'
	desc1 = 'sadasdsasddd'
	desc2 = 'sadasdsasddd'
	service = [name, lead, pic, desc1, desc2]
	servicecatalogue.append(service)

	name = 'app1'
	lead = 'lead1'
	pic = 'kuva1'
	desc1 = 'sadasdsasddd'
	desc2 = 'sadasdsasddd'
	service = [name, lead, pic, desc1, desc2]
	servicecatalogue.append(service)

	