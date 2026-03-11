import os
from celery import Celery

os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'Quiz_App.settings')

app = Celery('Quiz_App')
app.config_from_object('django.conf:settings', namespace='CELERY')
app.autodiscover_tasks()
