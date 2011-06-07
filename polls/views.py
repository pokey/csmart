from django.http import HttpResponse, HttpResponseRedirect
from django.shortcuts import render_to_response, get_object_or_404
from django.template import RequestContext
from django.core.urlresolvers import reverse
from polls.models import Poll, Choice

def index(request):
	polls = Poll.objects.all()[0];
	return render_to_response("/afs/cs.stanford.edu/u/bipins/scratch1/csmart/csmart_site/polls/templates/index.html", {"polls": polls})

def detail(request, poll_id):
	try:
		p = Poll.objects.get(pk=poll_id)
	except:
		raise Http404
	return render_to_response("/afs/cs.stanford.edu/u/bipins/scratch1/csmart/csmart_site/polls/templates/detail.html", {"poll": p}, context_instance=RequestContext(request))


def vote(request, poll_id):
	p = get_object_or_404(Poll, pk=poll_id)
	try:
		selected_choice = p.choice_set.get(pk=request.POST['choice'])
	except (KeyError, Choice.DoesNotExist):
		return render_to_response('polls/detail.html', {
			'poll': p,
			'error_message': "You didn't select a choice.",
		}, context_instance=RequestContext(request))
	else:
		selected_choice.votes += 1
		selected_choice.save()
		return HttpResponseRedirect(reverse('polls.views.results', args=(p.id,)))

def results(request, poll_id):
	p = get_object_or_404(Poll, pk=poll_id)
	return render_to_response('/afs/cs.stanford.edu/u/bipins/scratch1/csmart/csmart_site/polls/templates/results.html', {"poll": p})

