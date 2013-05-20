eFM - Django framework project web app prototype

=======================================================================

To be able to open this web application in your browser you need to have django framework installed.

Type python command manage.py runserver in the project folder and visit:

http://localhost:8000/

=======================================================================

SHORT DOCUMENTATION (www.efm.wr.fi/doc)

- Project Dir Overview for basic content

eFM/							# project folder

	manage.py 						# communicates with django installation core

	ecosystem/						# project core
		settings.py 				# settings for server (postgre db on webfaction)
		local_settings.py 			# settings for local dev env (local db sqlite3)
		urls.py 					# connects urls to defined view functions
		views.py 					# view functions, renders content to front end using html templates
		wsgi.py 					# web server gateway interface configs

	<app name>/					# app folder (see 'feedback' app for example)
		admin.py 					# registers app data to be shown is django default admin dashboard
		views.py 					# app specific views (for 'feedback' app not used, data for home screen in project views)
		models.py 					# django database api, classes for data structures. note: syntax not db-specific
		test.py 					# basic python unit tests, let's skip it :)

	templates/					# folder html templates
		base.html 					# base template for every page, defines static file links, wrapper frame etc.
		home.html 					# homescreen view
		apps/						# folder for app templates
			example.html 			# extends the base.html and show dynamic data via template tags and variables
		admin/						# folder for django admin page customs

	static/						# folder for static files
		css/						# css style sheets
			bootsrap.min.css 			# very nice css library
			bootsrap-responsive.min.css	# enables responsive design, optimized for three screen sizes
			darkstrap.css 				# specific dark theme override for bootstrap
			main.css 					# custom styles
			ubuntu-title-fr-1.1.ttf 	# ubuntu style font
		img/						# pic folder
			icons/						# general icons
			pics/						# specific pictures
		js/							# javascript folder
			bootstrap.min.js 			# very nice js library
			main.js 					# custom js, loaded before page content
			base.js 					# custom js, loaded after page content

	media/						# folder for data files (for example user uploads etc)



-----------------------------------------------------------------------

About Django in general:

"Django is a high-level Python web framework that encourages
rapid development and clean, pragmatic design"

Django (1.5) documentation and tutorials:
http://www.djangobook.com
http://www.djangoproject.com