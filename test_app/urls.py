"""
URL configuration for test_app project.

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/5.2/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path, include
from rest_framework import routers
from .views import SubmitResultView

from . import views
from . import settings
from django.conf.urls.static import static
from django.contrib.auth import views as auth_views
from .views import logout_view
from rest_framework.authtoken.views import obtain_auth_token
# Router configuration
router = routers.DefaultRouter()
router.register(r'users', views.UserViewSet)
router.register(r'groups', views.GroupViewSet)
router.register(r'questions', views.QuestionsViewset)
router.register(r'topic', views.TopicViewset)

# URL patterns
urlpatterns = [

    path('admin/', admin.site.urls),
    path('api/', include(router.urls)),  # Consolidated API routes
    path('api-auth/', include('rest_framework.urls', namespace='rest_framework')),
    path('topics/', views.topics_list, name='topics_list'),
    path('topics/<int:topic_id>/', views.topic_questions, name='topic_questions'),
    path('topics/add/', views.add_topic, name='add_topic'),
    path('topics/<int:topic_id>/edit/', views.edit_topic, name='edit_topic'),
    path('topics/<int:topic_id>/delete/', views.delete_topic, name='delete_topic'),
    path('questions/add/<int:topic_id>/', views.add_question, name='add_question'),
    path('questions/<int:question_id>/edit/', views.edit_question, name='edit_question'),
    path('topics/<int:topic_id>/questions/', views.topic_questions, name='topic_questions'),
    path('questions/<int:question_id>/delete/', views.delete_question, name='delete_question'),
    path('', views.dashboard, name='dashboard'),
    path('login/', auth_views.LoginView.as_view(template_name='login.html'), name='login'),
    path('logout/', auth_views.LogoutView.as_view(next_page='login'), name='logout'),
    path('api/login/', obtain_auth_token, name='api_token_auth'),
    path('topics/<int:topic_id>/toggle_visibility/', views.toggle_topic_visibility, name='toggle_topic_visibility'),
    path('api/submit-result/', SubmitResultView.as_view()),
    path('score/', views.score_list_view ,name='score_list_view'),
    path('download_excel/<int:result_id>/', views.download_result_excel, name='download_result_excel'),
    path('download/all-results/', views.download_all_results_excel, name='download_all_results_excel'),
    path('score/<int:result_id>/delete/', views.delete_result, name='delete_result'),
    path('score/delete/', views.delete_all_result, name='delete_all_result'),
    path('api/user/', views.get_current_user, name='get_current_user'),

]

# Serve media files during development
if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT) 
               