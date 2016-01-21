from optparse import make_option
from datetime import datetime, timedelta

from django.core.management.base import BaseCommand
from django.core.mail import EmailMultiAlternatives

from ...models import FailedEmail, QueuedEmail, SentEmail
from django.utils.html import strip_tags
from ...send import create_message

import time
import traceback




class Command(BaseCommand):
    """
    If called without argunments, this command will never return and it will continuously
    pull entries from QueuedEmail table.

    Probably, the easiest is to run this inside screen and then detach.
    Might be a good idea to redirect the output too.
    """


    help = "Send emails queued manually from a template."
    option_list = BaseCommand.option_list + (
        make_option('--queues', action='store_true', dest='queues', default=False,
            help='Print debug info'),
    )


    def handle(self, *args, **options):
        if options.get('queues'):
            print "QueuedEmail: " + str(QueuedEmail.objects.count())
            print "SentEmail: " + str(SentEmail.objects.count())
            print "FailedEmail: " + str(FailedEmail.objects.count())
            return None

        print "Started email sending job..."
        print  str(QueuedEmail.objects.count()) + " Emails in queue"

        while True:
            a_bunch_of_queued_email = QueuedEmail.objects.order_by("id")
            for queued_email in a_bunch_of_queued_email:

                nl_instance = queued_email.manual_newsletter

                # we can still use the object after the delete(),
                #just delete its row in the database because it will be copied
                # either to reminder_failed_email or reminder_sent_email
                queued_email.delete()

                try:
                    text_base, html_content = create_message(queued_email.user, nl_instance, "sv")
                    text_content = strip_tags(text_base)

                    msg = EmailMultiAlternatives(
                        queued_email.manual_newsletter.subject,
                        text_content,
                        "%s <%s>" % (nl_instance.sender_name, nl_instance.sender_email),
                        [queued_email.user.email],
                    )

                    msg.attach_alternative(html_content, "text/html")
                    msg.send()

                    sent_email = SentEmail(
                        user=queued_email.user,
                        manual_newsletter=nl_instance,
                        queued = nl_instance.timestamp #TODO: remove this from the model
                    )
                    sent_email.save()



                except Exception, e:

                    failed_email = FailedEmail(
                        user = queued_email.user,
                        manual_newsletter = nl_instance,
                        message = str(e)[:254],
                        traceback = traceback.format_exc()
                    )

                    failed_email.save()


            print "Wait three seconds..."
            time.sleep(3)
