from django.conf.urls.defaults import patterns, include, url
from django.contrib.auth.views import login, logout

# Uncomment the next two lines to enable the admin:
from django.contrib import admin
admin.autodiscover()

urlpatterns = patterns('polls.views',
    # Examples:
    # url(r'^$', 'csmart_site.views.home', name='home'),
    # url(r'^csmart_site/', include('csmart_site.foo.urls')),

    # Uncomment the admin/doc line below to enable admin documentation:
    # url(r'^admin/doc/', include('django.contrib.admindocs.urls')),

    # Uncomment the next line to enable the admin:
    url(r'^search/', include('search.urls')),
    url(r'^polls/', include('polls.urls')),
    url(r'^resources/', include('resources.urls')),
    url(r'^admin/', include(admin.site.urls)),
    url(r'^comments/', include('django.contrib.comments.urls')),
    url(r'', include('frontpage.urls')),
)

urlpatterns += patterns('',
    (r'^accounts/login/$',  login),
    (r'^accounts/logout/$', logout),
    (r'^accounts/register/$', 'frontpage.views.register'),
)

urlpatterns += patterns('frontpage.views',
	(r'^aboutus/$', 'aboutus'),
	(r'^aboutcsmart/$', 'aboutcsmart'),
)
