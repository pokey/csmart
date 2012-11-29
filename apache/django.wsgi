import os
import sys

# FixMe: [correctness] Remove hard-coded path
path = '/home/pokey'
if path not in sys.path:
    sys.path.append(path)
path = '/home/pokey/csmart_site'
if path not in sys.path:
    sys.path.append(path)


os.environ['DJANGO_SETTINGS_MODULE'] = 'csmart_site.settings'
# FixMe: [correctness] Remove hard-coded path
os.environ['PYTHON_EGG_CACHE'] = '/home/pokey/csmart_site/apache/python-eggs'

import django.core.handlers.wsgi
application = django.core.handlers.wsgi.WSGIHandler()
