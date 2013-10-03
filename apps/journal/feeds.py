from django.contrib.syndication.feeds import Feed
from django.core.urlresolvers import reverse
from django.conf import settings

from .models import Entry, published_filter

# this file appears to have fallen in disuse.

class EntryEntryFeed(Feed):
    title = settings.CMSPLUGIN_NEWS_RSS_TITLE
    description = settings.CMSPLUGIN_NEWS_RSS_DESCRIPTION

    def items(self):
        return published_filter(Entry.objects.all())[:10]
    
    def item_pubdate(self, item):
        return item.pub_date

    def __getattr__(self, name):
        # The reverse() call should be made after all URLs
        # are mapped. So we cannot use it when declaring the
        # 'link' property.

        if name == 'link':
            return reverse('news_archive_index')

        return Feed.__getattr__(self, name)

