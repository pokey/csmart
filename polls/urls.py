from django.conf.urls.defaults import patterns, include, url

urlpatterns = patterns('polls.views',
    # Examples:
    # url(r'^$', 'csmart_site.views.home', name='home'),
    # url(r'^csmart_site/', include('csmart_site.foo.urls')),

    # Uncomment the admin/doc line below to enable admin documentation:
    # url(r'^admin/doc/', include('django.contrib.admindocs.urls')),

    # Uncomment the next line to enable the admin:
    url(r'^$', 'index'),
    url(r'^(?P<poll_id>\d+)/$', 'detail'),
    url(r'^(?P<poll_id>\d+)/results/$', 'results'),
    url(r'^(?P<poll_id>\d+)/vote/$', 'vote'),
)

