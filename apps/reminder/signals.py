import django.dispatch

reminder_sent = django.dispatch.Signal(
                        providing_args=['user'])
