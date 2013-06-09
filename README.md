eFM - Django framework project web app prototype

=======================================================================

To be able to open this web application in your browser you need to have django framework installed.

Type python command manage.py runserver in the project folder and visit:

http://localhost:8000/

=======================================================================

SHORT DOCUMENTATION

- Project Dir Overview for basic content

eFM/							# project folder

	manage.py 						# communicates with django installation core

	ecosystem/						# project core
		settings.py 				# settings for server (postgre db on webfaction)
		urls.py 					# connects urls to defined view functions
		views.py 					# view functions, renders content to front end using html templates
		wsgi.py 					# web server gateway interface configs

	home/						# app folder
		admin.py 					# registers app data to be shown is django default admin dashboard
		views.py 					# app specific views, defines home screen modules and actions
		models.py 					# django database api, data of sensors, features etc.

	services/					# app folder
		admin.py 					# registers app data to be shown is django default admin dashboard
		views.py 					# app specific views, gets external services
		models.py 					# django database api, data of services

	manager/					# app folder
		views.py 					# app specific views, gets installed sensors (imported from home app)

	provider/					# app folder
		admin.py 					# registers app data to be shown is django default admin dashboard
		views.py 					# app specific views, shows service provider search dialog
		models.py 					# django database api, data of service providers

	templates/					# html templates (shows data via template tags and variables)
		base.html 					# base template for every page, defines static file links, wrapper frame etc.
		home/						# folder for app templates
			home.html 					# extends the base.html, shows home page modules and installation dialog
		services/					# folder for app templates
			services.html 				# extends the base.html, shows external services
		manager/					# folder for app templates
			manager.html 				# extends the base.html, shows installed sensors and user data
		provider/					# folder for app templates
			notifications.html 			# shows links to failure alerts (temporary setup)
			failure.html				# failure alert
			provider.html 				# service provider search
			confirmation.html 			# service confirmation
			review.html 				# review after service
		admin/						# folder for django admin page customs
			base_site.html 			# customizes admin home page

	static/						# folder for static files
		css/						# css style sheets
			bootsrap.min.css 			# css library (some customizing done directly to it)
			bootsrap-responsive.min.css	# enables responsive design, optimized for three screen sizes
			boot-custom.css 			# specific additional css rules to customize bootstrap
			main.css 					# custom styles
		img/						# pic folder
			devices/					# pictures of sensors
			icons/						# general icons
			logo/						# domus and efm logos
			services/					# service pictures
			provider/					# provider logos
			pics/						# specific pictures
		js/							# javascript folder
			jquery-2.0.2.min.js 		# js library
			bootstrap.min.js 			# jquery library
			jquery.nicescroll.min.js 	# plugin for custom scroll bar
			main.js 					# custom js, loaded before page content



-----------------------------------------------------------------------

About Django in general:

"Django is a high-level Python web framework that encourages
rapid development and clean, pragmatic design"

Django (1.5) documentation and tutorials:
http://www.djangobook.com
http://www.djangoproject.com