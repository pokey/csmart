from django.http import HttpResponse
from django.shortcuts import render_to_response, get_object_or_404
from django.template import RequestContext
from resources.models import Resource, Review, ReviewForm


def show(request, resource_id):
   res = get_object_or_404(Resource, pk=resource_id)

   if request.method == 'POST': # If the form has been submitted...
       form = ReviewForm(request.POST) # A form bound to the POST data
       if form.is_valid(): # All validation rules pass
          name = form.cleaned_data['name']
          value = form.cleaned_data['value']
          comment = form.cleaned_data['comment']
          email = form.cleaned_data['email']
          rating = Review(resource=res, name=name, rating=value,
                          comment=comment, email=email)
          rating.save()

   reviews = Review.objects.filter(resource__pk=resource_id)
   for review in reviews:
      review.ratingHack = [0 for num in range(review.rating)]

   return render_to_response('resources/show.html', {'res': res, 'reviews':
      reviews}, context_instance = RequestContext(request))
