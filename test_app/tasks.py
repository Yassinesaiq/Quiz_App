from celery import shared_task
from django.utils import timezone
from datetime import timedelta
from .models import QuizResult, TestSession, TextAnswer

@shared_task
def cleanup_old_sessions():
    threshold = timezone.now() - timedelta(days=60)
    old_sessions = TestSession.objects.filter(started_at__lt=threshold)
    
    count = 0
    for session in old_sessions:
        session.delete()
        count += 1
        
    return f"Deleted {count} old sessions."
