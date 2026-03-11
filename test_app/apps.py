from django.apps import AppConfig
from django.utils import timezone
from datetime import timedelta

class AppConfig(AppConfig):
    name = 'test_app'
    
    def ready(self):
        from test_app.models import QuizResult, TestSession, TextAnswer
        threshold = timezone.now() - timedelta(days=60)
        old_sessions = TestSession.objects.filter(started_at__lt=threshold)
        for session in old_sessions:
            TextAnswer.objects.filter(session=session).delete()
            QuizResult.objects.filter(session=session).delete()
            session.delete()
