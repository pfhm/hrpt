from optparse import make_option
from datetime import datetime, timedelta

from django.core.management.base import BaseCommand

from ...send import send_reminders
from ...models import get_settings

class Command(BaseCommand):
    help = "Send reminders."
    option_list = BaseCommand.option_list + (
        make_option('--fake', action='store_true', dest='fake', default=False,
            help='Fake the sending of the emails; print the emails to be sent on screen instead.'),
    )

    def handle(self, *args, **options):
        fake = options.get('fake', False)

        if not get_settings():
            return u"0 reminders sent"

        reminder_settings = get_settings()

        if reminder_settings.currently_sending and\
            reminder_settings.last_process_started_date + timedelta(hours=3) > datetime.now():
            return u"0 reminders sent"


        reminder_settings.currently_sending = True
        reminder_settings.last_process_started_date = datetime.now()
        reminder_settings.save()
        try:
            return u'%d reminders sent.\n' % send_reminders(fake=fake)
        finally:
            reminder_settings = get_settings()
            reminder_settings.currently_sending = False
            reminder_settings.save()
