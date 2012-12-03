import os
import sys

path = '/afs/cs.stanford.edu/u/bipins/scratch1/csmart/'
if path not in sys.path:
    sys.path.append(path)
path = '/afs/cs.stanford.edu/u/bipins/scratch1/csmart/csmart_site'
if path not in sys.path:
    sys.path.append(path)


os.environ['DJANGO_SETTINGS_MODULE'] = 'csmart_site.settings'
os.environ['PYTHON_EGG_CACHE'] = '/afs/cs.stanford.edu/u/bipins/scratch1/csmart/csmart_site/apache/python-eggs'

import django.core.handlers.wsgi
application = django.core.handlers.wsgi.WSGIHandler()
