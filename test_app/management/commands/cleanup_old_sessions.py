from django.core.management.base import BaseCommand
from django.utils import timezone
from datetime import timedelta
from test_app.models import QuizResult, TestSession, TextAnswer

class Command(BaseCommand):
    help = 'Delete old test sessions and related data'

    def handle(self, *args, **options):
        threshold = timezone.now() - timedelta(days=60)
        old_sessions = TestSession.objects.filter(started_at__lt=threshold)
        
        count = 0
        for session in old_sessions:
            session.delete()  
            count += 1
            
        self.stdout.write(self.style.SUCCESS(f'Successfully deleted {count} old sessions.'))