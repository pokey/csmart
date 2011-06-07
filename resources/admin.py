from django.db import models
from django.contrib import admin
from resources.models import Resource
from django import forms


class ResourceAdmin(admin.ModelAdmin):

	fieldsets = (
		('None', {
			'fields': ('url', 'name', 'description', 'resource_type', 'level', 'topics', 'author', 'is_document'),
		}),
		('Advanced', {
			'classes': ('collapse',),
			'fields': ('rating', 'date', 'uploaded_by'),
		}),
	)

	#list_display	= ('name', url)
	list_filter	= ('level', 'date', 'uploaded_by')
	search_fields	= ['name', 'url']
	filter_horizontal = ('resource_type',)
	



admin.site.register(Resource, ResourceAdmin)
