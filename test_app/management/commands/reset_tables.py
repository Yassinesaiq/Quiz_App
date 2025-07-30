from django.core.management.base import BaseCommand
from django.db import connection, transaction
from django.apps import apps

class Command(BaseCommand):
    help = "Truncate tables and reset AUTO_INCREMENT counters (MySQL)"

    def handle(self, *args, **options):
        # List of models to reset; modify as needed or get all models dynamically
        app_label = 'test_app'  
        models = apps.get_app_config(app_label).get_models()

        table_names = [model._meta.db_table for model in models]

        with connection.cursor() as cursor:
            self.stdout.write("Disabling foreign key checks...")
            cursor.execute("SET FOREIGN_KEY_CHECKS = 0;")

            for table in table_names:
                self.stdout.write(f"Truncating table {table}...")
                cursor.execute(f"TRUNCATE TABLE `{table}`;")

            self.stdout.write("Enabling foreign key checks...")
            cursor.execute("SET FOREIGN_KEY_CHECKS = 1;")

        self.stdout.write(self.style.SUCCESS("All tables truncated and AUTO_INCREMENT reset."))
