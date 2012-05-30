from django.http import HttpResponse
from django.shortcuts import render_to_response
from django import forms
from django.contrib.auth.forms import UserCreationForm
from django.http import HttpResponseRedirect
#from django.shortcuts import render_to_response

from django.core.context_processors import csrf
from django.template import RequestContext

def index(request):
	currentPath = request.get_full_path
	return render_to_response("frontpage/index.html", {'next': currentPath}, context_instance=RequestContext(request))

def register(request):
    if request.method == 'POST':
        form = UserCreationForm(request.POST)
        if form.is_valid():
            new_user = form.save()
            return HttpResponseRedirect("/")
    else:
        form = UserCreationForm()

    c = {}
    c.update(csrf(request))        

    return render_to_response("registration/register.html", {
        'form': form,
    }, context_instance=RequestContext(request))

def aboutus(request):
    return render_to_response("frontpage/aboutus.html", {},  context_instance=RequestContext(request))

def aboutcsmart(request):
	return render_to_response("frontpage/aboutcsmart.html", {},  context_instance=RequestContext(request))

