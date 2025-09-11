from django.contrib.auth.models import Group, User
from rest_framework import viewsets ,status
from rest_framework.pagination import PageNumberPagination
from rest_framework.response import Response
from .serializers import *
from .models import *
from django.shortcuts import *
from .forms import *
from django.db import transaction
from django.contrib.auth.decorators import login_required
import logging
from django.contrib.auth import logout , authenticate
from django.contrib import messages
from django.views.decorators.http import require_POST
from django.utils import timezone
from datetime import timedelta
from rest_framework.authtoken.models import Token
from rest_framework.views import APIView
from rest_framework.permissions import IsAuthenticated ,AllowAny
from rest_framework.authentication import TokenAuthentication
from openpyxl import Workbook
from django.utils.timezone import localtime
from rest_framework.decorators import api_view, permission_classes
from django.contrib.auth.models import User
from django.http import HttpResponse
from openpyxl.styles import Font, PatternFill
from django.contrib.admin.views.decorators import staff_member_required
from rest_framework import generics
from .models import TextQuestion
from .serializers import TextQuestionSerializer
from rest_framework.response import Response
from rest_framework import status
from django.urls import reverse




class UserViewSet(viewsets.ModelViewSet):
    """
    API endpoint that allows users to be viewed or edited.
    """
    queryset = User.objects.all().order_by('-date_joined')
    serializer_class = UserSerializer
    permission_classes = [IsAuthenticated]


class GroupViewSet(viewsets.ModelViewSet):
    """
    API endpoint that allows groups to be viewed or edited.
    """
    queryset = Group.objects.all().order_by('name')
    serializer_class = GroupSerializer
    permission_classes = [IsAuthenticated]


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
    permission_classes = [IsAuthenticated]

class TextQuestionViewset(viewsets.ModelViewSet):
    queryset = TextQuestion.objects.all()
    serializer_class = TextQuestionSerializer
    pagination_class = CustomPagination
    permission_classes = [IsAuthenticated]
   

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
    
        
@api_view(['GET'])
@permission_classes([IsAuthenticated])
def get_current_user(request):
    user = request.user
    data = [{
        "username": user.username,
        "first_name": user.first_name,
        "last_name": user.last_name
    }]
    return Response(data, status=status.HTTP_200_OK)


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

from django.db.models import Q

@login_required
def score_list_view(request):
    results = QuizResult.objects.select_related("user", "session").prefetch_related("wrong_answers").order_by("-created_at")

    for result in results:
        # Lokale Zeit und Löschdatum
        result.created_at = localtime(result.created_at + timedelta(hours=2))
        result.deletion_date = localtime(result.created_at + timedelta(days=60))

        # Textantworten der Session laden
        session_id = result.session.id if result.session else None
        if session_id:
            text_answers = TextAnswer.objects.filter(session_id=session_id).select_related("question")
        else:
            text_answers = TextAnswer.objects.none()

        # Berechnung der Textantwort-Scores & MaxScores
        total_text_score = 0
        total_text_max_score = 0
        for ans in text_answers:
            if ans.score is not None:
                total_text_score += ans.score
            total_text_max_score += ans.question.max_score  # 🔑 Holt max_score von jeder Frage

        # Werte in result-Objekt anhängen (damit Template zugreifen kann)
        result.text_answers = text_answers
        result.pending_count = text_answers.filter(score__isnull=True).count()
        result.total_text_score = total_text_score

        #  Gesamtberechnung:
        quiz_score = result.score or 0
        quiz_max = result.maxsize or 0

        total_score = quiz_score + total_text_score
        total_max = quiz_max + total_text_max_score

        # Werte anfügen
        result.total_score = total_score
        result.total_max_score = total_max
        result.session_id = session_id

    return render(request, "score_list.html", {"results": results})





#Excel Datei Herunterladen 
#https://openpyxl.readthedocs.io/en/stable/
from openpyxl.styles import Font, PatternFill

from django.http import HttpResponse
from django.shortcuts import get_object_or_404
from openpyxl import Workbook
from openpyxl.styles import Font
from django.contrib.auth.decorators import login_required

from .models import QuizResult

@login_required
def download_result_excel(request, id):
    if not request.user.is_staff:
        return HttpResponse("Nicht erlaubt", status=403)

    result = get_object_or_404(QuizResult, id=id)
    session = result.session  # damit wir die dazugehörigen TextAnswers bekommen

    workbook = Workbook()
    sheet = workbook.active
    sheet.title = "Testergebnis"

    bold_font = Font(bold=True)

    # === Kopfbereich ===
    sheet["A1"] = "Benutzer"
    sheet["B1"] = result.user.get_full_name() or result.user.username
    sheet["A2"] = "Thema"
    sheet["B2"] = str(result.topic)
    sheet["A3"] = "Gesamtpunkte"
    sheet["B3"] = result.score
    sheet["A4"] = "Datum"
    sheet["B4"] = result.created_at.strftime('%d.%m.%Y %H:%M')

    for cell in ["A1", "A2", "A3", "A4"]:
        sheet[cell].font = bold_font

    sheet.append([])

    # === MCQ-Falsche Antworten ===
    sheet.append(["MCQ - Frage", "Richtige Antwort", "Gegebene Antwort"])
    last_row = sheet.max_row
    for col in range(1, 4):
        sheet.cell(row=last_row, column=col).font = bold_font

    if result.wrong_answers.exists():
        for wrong in result.wrong_answers.all():
            sheet.append([wrong.question, wrong.correct_answer, wrong.selected_option])
    else:
        sheet.append(["Alle Fragen korrekt beantwortet 🎉", "", ""])

    # === Textantworten ===
    if session:
        text_answers = session.text_answers.select_related("question").all()
        if text_answers.exists():
            sheet.append([])  # Leerzeile
            sheet.append(["TEXTFRAGEN", "Bewertung", "Feedback"])
            last_row = sheet.max_row
            for col in range(1, 4):
                sheet.cell(row=last_row, column=col).font = bold_font

            for ans in text_answers:
                sheet.append([
                    ans.question.question_text,
                    ans.score if ans.score is not None else "Noch nicht bewertet",
                    ans.feedback or ""
                ])

    response = HttpResponse(
        content_type="application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"
    )
    response['Content-Disposition'] = f'attachment; filename="{result.user.username}_result_{result.id}.xlsx"'

    workbook.save(response)
    return response


@staff_member_required
def download_all_results_excel(request):

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
@transaction.atomic  # alles oder nichts – sichert Datenkonsistenz
def delete_result(request, id):
    result = get_object_or_404(QuizResult.objects.select_related("session"), id=id)
    session = result.session  # die zugehörige TestSession

    #  WrongAnswers löschen (gehören direkt zu QuizResult)
    result.wrong_answers.all().delete()

    #  TextAnswers der gleichen Session löschen (wenn Session existiert)
    if session:
        session.text_answers.all().delete()
        session.delete()  # Session selbst löschen

    # QuizResult löschen
    result.delete()

    return redirect("score_list_view")


from django.db import transaction

@login_required
@transaction.atomic
def delete_all_result(request):
    #  Alle Sessions zuerst löschen (löscht automatisch TextAnswers, wenn on_delete=CASCADE)
    from .models import TestSession, QuizResult  # Import hier, um Zirkularimporte zu vermeiden
    TestSession.objects.all().delete()
    # alle QuizResults löschen (löscht WrongAnswers per on_delete=CASCADE)
    QuizResult.objects.all().delete()

    return redirect("score_list_view")


@staff_member_required
def text_answers_list(request):
    session_id = request.GET.get("session")
    if not session_id:
        return HttpResponse("Session nicht angegeben", status=400)

    answers = TextAnswer.objects.filter(session_id=session_id).select_related("question", "user")
    return render(request, "text_answers_list.html", {
        "answers": answers,
        "session_id": session_id
    })


@staff_member_required
def review_text_answer(request, answer_id):
    answer = get_object_or_404(TextAnswer, pk=answer_id)
    session_id = request.GET.get("session") or request.POST.get("session")

    if not session_id:
        return HttpResponse("Session nicht angegeben", status=400)

    if request.method == "POST":
        score = request.POST.get("score")
        feedback = request.POST.get("feedback")
        max_score = answer.question.max_score
        if score:
            score_val = float(score)
            answer.score = min(score_val, max_score)  # Prevent exceeding max score
        answer.feedback = feedback
        answer.is_reviewed = True
        answer.save()

        return redirect(f"{reverse('text_answers_list')}?session={session_id}")

    return render(request, "review_text_answer.html", {"answer": answer})



class TextQuestionByTopicNameView(generics.ListAPIView):
    serializer_class = TextQuestionSerializer

    def get_queryset(self):
        topic_name = self.request.query_params.get('topic')
        if topic_name:
            return TextQuestion.objects.filter(topic__topic=topic_name)
        return TextQuestion.objects.none()




from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status
from rest_framework.permissions import IsAuthenticated
from .models import TextQuestion, TextAnswer, TestSession, Topics

class SubmitTextAnswerAPI(APIView):
    permission_classes = [IsAuthenticated]

    def post(self, request):
        question_id = request.data.get("question")
        answer_text = request.data.get("answer_text")
        session_id = request.data.get("session")  # 🔑 New: session ID from Android
        topic_name = request.data.get("topic")       # optional fallback to auto-create session

        if not question_id or not answer_text:
            return Response({"error": "question and answer_text are required"}, status=status.HTTP_400_BAD_REQUEST)

        try:
            question = TextQuestion.objects.get(id=question_id)
        except TextQuestion.DoesNotExist:
            return Response({"error": "Question not found"}, status=status.HTTP_404_NOT_FOUND)

        # 🔑 Ensure session exists (create one if none provided)
        session = None
        if session_id:
            session = TestSession.objects.filter(id=session_id, user=request.user).first()

        if not session:
            if topic_name:
                try:
                    topic = Topics.objects.get(topic=topic_name)
                except Topics.DoesNotExist:
                    return Response({"error": "Topic not found"}, status=status.HTTP_404_NOT_FOUND)
                session = TestSession.objects.create(user=request.user, topic=topic)
            else:
                return Response({"error": "Session not found and no topic provided"}, status=status.HTTP_400_BAD_REQUEST)

        # Speichern der Textantwort
        text_answer = TextAnswer.objects.create(
            user=request.user,
            question=question,
            answer_text=answer_text,
            session=session  # ✅ Link to session
        )

        return Response(
            {"success": "Answer saved", "session_id": session.id},  # 🔑 Send back session ID
            status=status.HTTP_201_CREATED
        )



@api_view(["POST"])
@permission_classes([IsAuthenticated])
def start_test_session(request):
    topic_name = request.data.get("topic")
    topic = Topics.objects.filter(topic=topic_name).first()
    if not topic:
        return Response({"error": "Topic not found"}, status=404)

    session = TestSession.objects.create(user=request.user, topic=topic)
    return Response({"session_id": session.id})


@login_required
def delete_session(request, session_id):
    session = get_object_or_404(TestSession, pk=session_id)

    # Optional: Nur Admins oder Besitzer dürfen löschen
    if not request.user.is_staff and session.user != request.user:
        return HttpResponse("Nicht erlaubt", status=403)

    session.delete()
    return redirect('score_list_view')


@staff_member_required
def choose_topic_type(request):
    """Zeigt Auswahl zwischen MCQ, Text oder kombiniertem Test."""
    if request.method == "POST":
        choice = request.POST.get("choice")
        if choice:
            # Weiterleitung zu deiner normalen Topic-Create-View
            return redirect(f"{reverse('create_topic')}?type={choice}")
    return render(request, "choose_topic_type.html")


def create_topic(request):
    topic_type = request.GET.get("type", "mcq")  # default = mcq
    # topic_type kannst du ins Template geben, um z. B. spezielle Felder anzuzeigen
    return render(request, "create_topic.html", {"topic_type": topic_type})
