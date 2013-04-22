# Views file for the core of the project

from django.shortcuts import render
from django.template.loader import get_template
from django.http import Http404, HttpResponse, HttpResponseRedirect
from django.template import Context, Template

import datetime

#redirects to home page
def redirects(request):
    return HttpResponseRedirect('/home/')

# home page view
def home(request):
    return render(request, 'home/home.html', {'title': 'Home' } )

# monitor page view
def monitor(request):
    return render(request, 'monitor/monitor.html', {'title': 'Monitor' } )

# control page view
def control(request):
    return render(request, 'control/control.html', {'title': 'Control' } )

# services page view
def services(request):
    return render(request, 'services/services.html', {'title': 'Services' } )



"""
EXAMPLE FUNCTIONS by Joni

# the very first demo
def first_print(request):
    return HttpResponse("Hello world")
    
# demo how to print dynamic content
def current_datetime(request):
    now = datetime.datetime.now()
    html = "<html><body>It is now %s.</body></html>" % now
    return HttpResponse(html)

# demo how to cacth a variable from urlconf	
def hours_ahead(request, offset):
    try:
        offset = int(offset)
    except ValueError:
        raise Http404()
    dt = datetime.datetime.now() + datetime.timedelta(hours=offset)
    # assert False - can be set to trigger the error page
    html = "<html><body>In %s hour(s), it will be %s.</body></html>" % (offset, dt)
    return HttpResponse(html)

# an own template object test
def template_rendering1(request):
    t = Template('My name is {{ name }}.')
    c = Context({'name': 'Adrian'})
    html = t.render(c)
    return HttpResponse(html)

# demo of using dot to index data in ds
def sally(request):
    person = {'name': 'Sally', 'age': '43'}
    t = Template('{{ person.name }} is {{ person.age }} years old.')
    c = Context({'person': person})
    html = t.render(c)
    return HttpResponse(html)

def now(request):
    d = datetime.date(1993, 5, 2)
    t = Template('The month is {{ date.month }} and the year is {{ date.year }}.')
    c = Context({'date': d}) 
    html = t.render(c)
    return HttpResponse(html)

# indexing
def dot(request):
    t = Template('Item 2 is {{ items.2 }}.')
    c = Context({'items': ['apples', 'bananas', 'carrots']})
    html = t.render(c)
    return HttpResponse(html)

# using template system
def time_now(request):
    now = datetime.datetime.now()
    t = get_template('examples/current_datetime.html')
    html = t.render(Context({'current_date': now}))
    return HttpResponse(html)

# using render() to optimize the code
def current_time(request):
    now = datetime.datetime.now()
    return render(request, 'examples/current_datetime.html', {'current_date': now})


# The first argument to render() is the request, the second is the name of the template
# to use. The third argument, if given, should be a dictionary to use in creating a
# Context for that template. If you don’t provide a third argument, render() will use
# an empty dictionary.

def demo_time(request):
    now = datetime.datetime.now()
    return render(request, 'examples/demo_now.html', {'current_date': now})

# Template inheritance three-level approach:
#     Create a base.html template that holds the main look and feel of your site. This is the stuff that rarely, if ever, changes.
#     Create a base_SECTION.html template for each “section” of your site (e.g., base_photos.html and base_forum.html). These templates extend base.html and include section-specific styles/design.
#     Create individual templates for each type of page, such as a forum page or a photo gallery. These templates extend the appropriate section template.

# If you need to get the content of the block from the parent template, use {{ block.super }}, which is a “magic” variable providing the rendered text of the parent template.
# In most cases, the argument to {%  extends %} will be a string, but it can also be a variable, if you don’t know the name of the parent template until runtime. This lets you do some cool, dynamic stuff.


# a function for examples/notice.hmtl
#def notice(request):


"""