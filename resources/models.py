from django.db import models
from django.contrib.auth.models import User
from datetime import datetime
from django import forms
from django.utils.text import capfirst
from resource_types.models import ResourceType

LEVEL_CHOICES = (
	('apcs', 'APCS'),
)


class Resource(models.Model):

	url		= models.URLField('resource URL', unique=True)
	name 		= models.CharField('name', max_length=500)
	#resource_type	= models.CharField('resource type', choices=RESOURCE_TYPE_CHOICES, max_length=200)
	resource_type	= models.ManyToManyField(ResourceType)
	is_document	= models.BooleanField('this an indexable document', help_text='Should this document turn up in the search results? Examples of where this should be checked are PDFs, PPTs etc., and examples where this should be unchecked are web-pages and directories that serve as landing pages to other resources', default=True)
	topics		= models.CharField('topics covered', max_length=500, blank=True, null=True)
	description	= models.TextField('a short note describing the resource', blank=True, null=True)
	level		= models.CharField('level', choices=LEVEL_CHOICES, max_length=100, blank=True, null=True)
	author		= models.CharField('author, if known', max_length=100, blank=True, null=True)
	rating		= models.DecimalField('user rating (from 0.0 to 5.0)', max_digits=2, decimal_places=1, default=0.0)
	date		= models.DateTimeField('uploaded at', default=datetime.now, blank=True, null=True)
	uploaded_by	= models.ForeignKey(User, default=User.objects.get(pk=1))


	def __unicode__(self):
		return self.name

class Review(models.Model):

	resource	= models.ForeignKey(Resource)
	rating		= models.IntegerField('rating (1 to 5)')
	comment		= models.TextField('user comment')
	name 		= models.CharField('name', max_length=500)
	email		= models.EmailField('user email', blank=True)
	date		= models.DateTimeField('uploaded at', auto_now_add=True)


	def __unicode__(self):
		return self.name

class ReviewForm(forms.Form):
	name 		= forms.CharField(max_length=500)
	value		= forms.IntegerField(min_value=1, max_value=5)
	comment		= forms.CharField()
	email		= forms.EmailField(required=False)
