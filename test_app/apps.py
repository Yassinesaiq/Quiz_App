from django.apps import AppConfig
from django.utils import timezone
from datetime import timedelta

class YourAppConfig(AppConfig):
    name = 'test_app'  

    def ready(self):
        from test_app.models import QuizResult
        threshold = timezone.now() - timedelta(days=60)
        QuizResult.objects.filter(created_at__lt=threshold).delete()
