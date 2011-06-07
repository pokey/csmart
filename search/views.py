from django.http import HttpResponse
from django.shortcuts import render_to_response
from django.template import RequestContext
from urllib import quote_plus
from urllib2 import *
import simplejson

def index(request):
	

	# get search terms and query search backend
	q = request.GET.get('q')

	# result page no.
	if 'start' in request.GET and request.GET.get('start') != "":
		start = int(request.GET.get('start'))
	else:
		start = 0

	if q and q != "" and start >= 0:
		backendQuery = "http://127.0.0.1:8983/solr/select?wt=json&q=" + quote_plus(q) + "&start=" + str(start)
		try:
			conn = urlopen(backendQuery)
			# interpret json response
			rsp = simplejson.load(conn)
			queryTime = '%0.3f' % (rsp['responseHeader']['QTime'] / 1000.0)
		except Exception, e:
			rsp = '{}'
			queryTime = 0
	else:
		rsp = '{}'
		queryTime = 0

	if start + 10 < int(rsp['response']['numFound']):
		next = start +  10
	else:
		next = -1

	if start - 10 >= 0:
		prev = start - 10
	else:
		prev = -1


	# render results
	return render_to_response("search/srp.html", {
		'q': q,
		'queryTime': queryTime,
		'prev': prev,
		'next': next,
		'rsp': rsp,
	}, context_instance=RequestContext(request))


