from django.http import HttpResponse
from django.shortcuts import render_to_response
from django.template import RequestContext
from urllib import quote_plus
from urllib2 import *
import simplejson

def index(request):
	q = request.GET.get('q')
	backendQuery = "http://127.0.0.1:8983/solr/select?wt=json&q=attr_content:" + q
	conn = urlopen(quote_plus(backendQuery))
	rsp = simplejson.load(conn)
	queryTime = rsp['responseHeader']['QTime'] / 1000.0
	return render_to_response("search/srp.html", {
		'q': q,
		'queryTime': queryTime,
		'rsp': rsp,
	}, context_instance=RequestContext(request))


