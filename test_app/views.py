from django.contrib.auth.models import Group, User
from rest_framework import permissions, viewsets
from rest_framework.pagination import PageNumberPagination
from rest_framework.response import Response
from .serializers import *
from .models import *
from django.shortcuts import *
from .forms import *
from django.db import transaction
from django.contrib.auth.decorators import login_required
import logging
from django.contrib.auth import logout
from django.contrib import messages
from django.views.decorators.http import require_POST
from django.utils import timezone
from datetime import timedelta
from rest_framework.authtoken.models import Token
from rest_framework.views import APIView
from django.contrib.auth import authenticate
from rest_framework.permissions import IsAuthenticated
from rest_framework.authentication import TokenAuthentication
from openpyxl import Workbook
from django.utils.timezone import localtime

class UserViewSet(viewsets.ModelViewSet):
    """
    API endpoint that allows users to be viewed or edited.
    """
    queryset = User.objects.all().order_by('-date_joined')
    serializer_class = UserSerializer
    permission_classes = [permissions.IsAuthenticated]


class GroupViewSet(viewsets.ModelViewSet):
    """
    API endpoint that allows groups to be viewed or edited.
    """
    queryset = Group.objects.all().order_by('name')
    serializer_class = GroupSerializer
    permission_classes = [permissions.IsAuthenticated]


class CustomPagination(PageNumberPagination):
    def get_paginated_response(self, data):
        return Response(data)
    
class QuestionsViewset(viewsets.ModelViewSet):
    queryset = Questions.objects.all()
    serializer_class = QuestionSerializer
    pagination_class = CustomPagination

    def get_queryset(self):
        queryset = super().get_queryset()
        topic_id = self.request.query_params.get('topic_id')
        if topic_id is not None:
            queryset = queryset.filter(topic_id=topic_id)
        return queryset

class TopicViewset(viewsets.ModelViewSet):
    queryset = Topics.objects.filter(visible=True) 
    serializer_class = TopicSerializer
    pagination_class = CustomPagination
   

@login_required
def topics_list(request):
    topics = Topics.objects.all()
    return render(request, 'topics_list.html', {'topics': topics})
@login_required
def topic_questions(request, topic_id):
    topic = get_object_or_404(Topics, pk=topic_id)
    questions = Questions.objects.filter(topic_id=topic)
    return render(request, 'topic_questions.html', {'topic': topic, 'questions': questions})


# ---------------- Topics ---------------- #
@login_required
def add_topic(request):
    if request.method == "POST":
        form = TopicForm(request.POST, request.FILES)
        if form.is_valid():
            topic = form.save(commit=False)
            topic.created_by = request.user
            topic.created_at = timezone.now()+ timedelta(hours=2)
            topic.save()
            form.save()
            return redirect('topics_list')
    else:
        form = TopicForm()
    return render(request, 'add_edit_topic.html', {'form': form, 'title': 'Thema hinzufügen'})
@login_required
def edit_topic(request, topic_id):
    topic = get_object_or_404(Topics, pk=topic_id)
    if request.method == "POST":
        form = TopicForm(request.POST, request.FILES, instance=topic)
        if form.is_valid():
            topic = form.save(commit=False)
            topic.created_by = request.user
            topic.created_at = timezone.now()+ timedelta(hours=2)
            topic.save()
            form.save()
            return redirect('topics_list')
    else:
        form = TopicForm(instance=topic)
    return render(request, 'add_edit_topic.html', {'form': form, 'title': 'Thema bearbeiten'})
@login_required
def delete_topic(request, topic_id):
    topic = get_object_or_404(Topics, pk=topic_id)
    with transaction.atomic():
        # alle fragen löschen 
        Questions.objects.filter(topic_id=topic).delete()
        # dann Thema löschen
        topic.delete()
    return redirect('topics_list')


# ---------------- Questions ---------------- #
@login_required
def add_question(request, topic_id):
    topic = get_object_or_404(Topics, pk=topic_id)

    if request.method == 'POST':
        form = QuestionForm(request.POST, request.FILES, current_topic=topic)
        if form.is_valid():
            question = form.save(commit=False)
            question.topic_id = topic
            question.save()

            if 'save_continue' in request.POST:
                return redirect('add_question', topic_id=topic.pk)  # neue Frage zum gleichen Thema
            else:
                return redirect('topic_questions', topic_id=topic.pk)  # zurück zur Übersicht
    else:
        form = QuestionForm(current_topic=topic)

    return render(request, 'add_edit_question.html', {
        'form': form,
        'title': f'Frage hinzufügen zu: {topic.topic}',
        'topic': topic
    })



@login_required
def edit_question(request, question_id):
    question = get_object_or_404(Questions, pk=question_id)

    if request.method == "POST":
        form = QuestionForm(request.POST, request.FILES, instance=question)
        if form.is_valid():
            form.save()
            return redirect('topic_questions', topic_id=question.topic_id.pk)
    else:
        form = QuestionForm(instance=question)
        logger = logging.getLogger(__name__)
        logger.info(question.des_img)

    return render(request, 'add_edit_question.html', {
        'form': form,
        'title': 'Frage bearbeiten',
        'topic': question.topic_id
    })
@login_required
def delete_question(request, question_id):
    question = get_object_or_404(Questions, pk=question_id)
    topic_id = question.topic_id.topic_id
    question.delete()
    return redirect('topic_questions', topic_id=topic_id)

@login_required
def dashboard(request):
    topics_count = Topics.objects.count()
    questions_count = Questions.objects.count()
    latest_topics = Topics.objects.filter(created_by=request.user).order_by('-created_at')[:5]

    return render(request, 'dashboard.html', {
        'topics_count': topics_count,
        'questions_count': questions_count,
        'latest_topics': latest_topics,
    })

@require_POST
def logout_view(request):
    logout(request)  # This removes the session
    messages.success(request, "Sie wurden erfolgreich abgemeldet.")
    return redirect('login')  # or use 'home' or a custom page

@login_required
def toggle_topic_visibility(request, topic_id):
    topic = get_object_or_404(Topics, pk=topic_id)
    topic.visible = not topic.visible
    topic.save()
    return redirect('topics_list')



class LoginView(APIView):
    def post(self, request):
        username = request.data.get("username")
        password = request.data.get("password")
        user = authenticate(username=username, password=password)

        if user:
            token, created = Token.objects.get_or_create(user=user)
            return Response({"token": token.key})
        return Response({"error": "Invalid credentials"}, status=400)
        


class SubmitResultView(APIView):
    authentication_classes = [TokenAuthentication]
    permission_classes = [IsAuthenticated]

    def post(self, request):
        print("Authorization Header:", request.META.get('HTTP_AUTHORIZATION'))
        serializer = QuizResultSerializer(data=request.data, context={'request': request})
        if serializer.is_valid():
            serializer.save()
            return Response({'status': 'success'}, status=201)
        return Response(serializer.errors, status=400)


@login_required
def score_list_view(request):
    results = QuizResult.objects.prefetch_related("wrong_answers", "user").order_by("-created_at")
    for result in results:
    # Berechne das Löschdatum: 60 Tage nach Erstellung
     result.deletion_date = localtime(result.created_at + timedelta(days=60))
    return render(request, "score_list.html", {"results": results})

#Excel Datei Herunterladen 

from openpyxl.styles import Font, PatternFill

@login_required
def download_result_excel(request, result_id):
    # Nur Admins dürfen Ergebnisse herunterladen
    if not request.user.is_staff:
        return HttpResponse("Nicht erlaubt", status=403)

    try:
        result = QuizResult.objects.get(id=result_id)
    except QuizResult.DoesNotExist:
        return HttpResponse("Ergebnis nicht gefunden", status=404)

    workbook = Workbook()
    sheet = workbook.active
    sheet.title = "Quiz Ergebnis"

    bold_font = Font(bold=True)

    # Kopfzeilen
    sheet["A1"] = "Benutzer"
    sheet["B1"] = result.user.username
    sheet["A2"] = "Thema"
    sheet["B2"] = str(result.topic)
    sheet["A3"] = "Punkte"
    sheet["B3"] = result.score
    sheet["A4"] = "Datum"
    sheet["B4"] = result.created_at.strftime('%d.%m.%Y %H:%M')

    for cell in ["A1", "A2", "A3", "A4"]:
        sheet[cell].font = bold_font

    sheet.append([])  # Leerzeile

    # Tabelle der falschen Antworten
    sheet.append(["Frage", "Richtige Antwort", "Gegebene Antwort"])
    last_row = sheet.max_row
    for col in range(1, 4):
        sheet.cell(row=last_row, column=col).font = bold_font

    for wrong in result.wrong_answers.all():
        sheet.append([
            wrong.question,
            wrong.correct_answer,
            wrong.selected_option
        ])

    # Antwort
    response = HttpResponse(
        content_type='application/vnd.openxmlformats-officedocument.spreadsheetml.sheet'
    )
    filename = f"{result.user.username}_result_{result.id}.xlsx"
    response['Content-Disposition'] = f'attachment; filename="{filename}"'

    workbook.save(response)
    return response

from openpyxl import Workbook
from django.http import HttpResponse
from .models import QuizResult
from openpyxl.styles import Font, PatternFill

from django.contrib.admin.views.decorators import staff_member_required
@staff_member_required
def download_all_results_excel(request):
    from openpyxl import Workbook
    from openpyxl.styles import Font, PatternFill
    from django.http import HttpResponse
    from .models import QuizResult

    workbook = Workbook()
    sheet = workbook.active
    sheet.title = "Alle Ergebnisse"

    # Farben und Formatierungen
    bold_font = Font(bold=True)
    green_fill = PatternFill(start_color="C6EFCE", end_color="C6EFCE", fill_type="solid")  # Hellgrün
    red_fill = PatternFill(start_color="FFC7CE", end_color="FFC7CE", fill_type="solid")    # Hellrot
    blue_fill = PatternFill(start_color="90D5FF", end_color="90D5FF", fill_type="solid")    # Hellrot

    # Kopfzeile
    headers = [
        "Benutzer", "Vorname", "Nachname", 
        "Thema", "Score", "Datum", 
        "Frage", "Richtige Antwort", "Falsch Gewählt"
    ]
    sheet.append(headers)

    for col in range(1, len(headers) + 1):
        cell = sheet.cell(row=1, column=col)
        cell.font = bold_font

    # Datenzeilen schreiben
    for result in QuizResult.objects.all().prefetch_related("wrong_answers", "user"):
        wrongs = result.wrong_answers.all()
        if wrongs:
            for wrong in wrongs:
                sheet.append([
                    result.user.username,
                    result.user.first_name,
                    result.user.last_name,
                    str(result.topic),
                    result.score,
                    result.created_at.strftime("%d.%m.%Y %H:%M"),
                    wrong.question,
                    wrong.correct_answer,
                    wrong.selected_option
                ])
        else:
            sheet.append([
                result.user.username,
                result.user.first_name,
                result.user.last_name,
                str(result.topic),
                result.score,
                result.created_at.strftime("%d.%m.%Y %H:%M"),
                "100%", "Richtig", "Beantwortet"
            ])

    # Spalten einfärben
    richt_col = 8  
    falsch_col = 9 
    score_col = 5
    for row in sheet.iter_rows(min_row=2, max_row=sheet.max_row):
        row[richt_col - 1].fill = green_fill
        row[falsch_col - 1].fill = red_fill
        row[score_col - 1].fill = blue_fill

    # Download vorbereiten
    response = HttpResponse(
        content_type="application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"
    )
    response["Content-Disposition"] = 'attachment; filename="alle_ergebnisse.xlsx"'
    workbook.save(response)
    return response



@login_required
def delete_result(request, result_id):
    result = get_object_or_404(QuizResult, pk=result_id)
    result_id = result.result_id
    result.delete()
    return redirect('score_list_view')


