from django.contrib import admin
from .models import *

# Register your models here.
admin.site.register(Topics)
class TopicAdmin(admin.ModelAdmin):
    list_display = ('title', 'created_by', 'visible')
    list_filter = ('visible',)
    actions = ['make_visible', 'make_hidden']

    @admin.action(description='Mark selected topics as visible')
    def make_visible(self, request, queryset):
        queryset.update(visible=True)

    @admin.action(description='Mark selected topics as hidden')
    def make_hidden(self, request, queryset):
        queryset.update(visible=False)


admin.site.register(Questions)
admin.site.register(QuizResult)
admin.site.register(WrongAnswer)
admin.site.register(TextAnswer)
admin.site.register(TextQuestion)
admin.site.register(TestSession)
