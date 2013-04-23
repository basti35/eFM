eFM
===
Django framework project for eFM web app prototype

Key features to be done for Friday:
- Monitor: "Faked" temperature tracking by using animated gif (temp changing 21.3-21.4 C every 7 secs)
- Monitor: Embedded web cam stream
- Control: locally used wemo.py to control Belkin (light control)
- Service request: Message to social media (by using email-ifttt-fb)

=======================================================================

To use set up this project on your desktop, you need to:
1. Install Django 1.5 (after installing Python, if on Windows)
2. Clone repo
3. Inside repo folder run with python: manage.py runserver
4. Check http://127.0.0.1:8000
5. If not working check confs in settings.py (and set your local db)
6. Dive into Django docs and tutorials

=======================================================================

About Django in general:

"Django is a high-level Python web framework that encourages
rapid development and clean, pragmatic design"

Django (1.5) documentation and tutorials:
http://www.djangobook.com
http://www.djangoproject.com

Some basic principles of Django framework:
- Model - View - Control == Architecture
- Business logic should be separated from presentation logic
- Loose coupling - all changes need be done in one place only
- HTML templates and framework code are separated: designers are assumed to be comfortable with HTML, not to be Python programmers
