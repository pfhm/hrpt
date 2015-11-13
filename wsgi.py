# this is used to run the website with apache and mod_wsgi

import os
import sys
import site

sys.path.append('/var/www/hrpt')
site.addsitedir('/var/www/hrpt/lib/python2.7/site-packages')

os.environ['DJANGO_SETTINGS_MODULE'] = 'settings'

import django.core.handlers.wsgi
application = django.core.handlers.wsgi.WSGIHandler()
