from django.conf.urls.defaults import patterns, include, url

urlpatterns = patterns('resources.views',
    url(r'^(?P<resource_id>\d+)$', 'show'),
)
