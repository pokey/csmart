from django.http import HttpResponse
from django.shortcuts import render_to_response, get_object_or_404
from django.template import RequestContext
from resources.models import Resource


def show(request, resource_id):

	res = get_object_or_404(Resource, pk=resource_id)

	return render_to_response('resources/show.html', {'res': res}, context_instance = RequestContext(request))

