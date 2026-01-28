from django.db import models
from django.contrib.auth.models import User

class Questions(models.Model):
    question_id = models.AutoField(db_column='question_id', primary_key=True)
    question = models.TextField(db_column='question', blank=True, null=True)
    option1 = models.TextField(db_column='option1', blank=True, null=True)
    option2 = models.TextField(db_column='option2', blank=True, null=True)
    option3 = models.TextField(db_column='option3', blank=True, null=True)
    option4 = models.TextField(db_column='option4', blank=True, null=True)
    answer = models.TextField(blank=True, null=True)
    topic_id = models.ForeignKey('Topics', on_delete=models.SET_NULL, db_column='topic_id', blank=True, null=True)
    des_img = models.ImageField(db_column="image", upload_to='uploads/questions/', blank=True, null=True)

    class Meta:
        managed = True
        db_table = 'Questions'

    def __str__(self):
        return f"{self.question} - Topic : {self.topic_id.topic}"

class TopicType(models.Model):
    name = models.CharField(max_length=50, unique=True)
    def __str__(self):
        return self.name

class Topics(models.Model):
    topic_id = models.AutoField(db_column='topic_id', primary_key=True)
    topic = models.TextField(db_column='topic', blank=True, null=True,max_length=100)
    description = models.TextField(db_column="description", blank=True, null=True)
    configuration_img = models.ImageField(db_column="image", upload_to='uploads/topics/', blank=True, null=True)
    created_by = models.ForeignKey(User, on_delete=models.CASCADE)
    created_at = models.DateTimeField(auto_now_add=True)
    visible = models.BooleanField(default=True)
    topic_type = models.ForeignKey(TopicType,on_delete=models.CASCADE)  # Neu: Unterscheidungsthema für Textfragen  

    class Meta:
        managed = True
        db_table = 'Topics'
    
    def __str__(self):
        return f"{self.topic} "
    
class TestSession(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE, related_name="test_sessions")
    topic = models.ForeignKey('test_app.Topics', on_delete=models.CASCADE, related_name="sessions")
    started_at = models.DateTimeField(auto_now_add=True)
    finished_at = models.DateTimeField(null=True, blank=True)

    def __str__(self):
        return f"TestSession von {self.user.username} für {self.topic.topic} am {self.started_at.strftime('%d.%m.%Y %H:%M')}"

class QuizResult(models.Model):
    session = models.ForeignKey(TestSession, on_delete=models.CASCADE, related_name="quiz_results", null=True, blank=True)
    user = models.ForeignKey(User, on_delete=models.CASCADE, related_name='results', null=True)
    score = models.IntegerField()
    topic = models.TextField(db_column='topic', blank=True,null=True,max_length=100)
    created_at = models.DateTimeField(auto_now_add=True)
    maxsize = models.IntegerField(null=True)

    class Meta:
        managed = True
        db_table = 'Quizresult'

    def __str__(self):
        return f"{self.user.username} - Score: {self.score}"

class WrongAnswer(models.Model):
    quiz_result = models.ForeignKey(QuizResult, on_delete=models.CASCADE, related_name='wrong_answers')
    question = models.TextField()
    correct_answer = models.TextField()
    selected_option = models.TextField()

    class Meta:
        managed = True
        db_table = 'WrongAnswer'

    def __str__(self):
        return f"Wrong: {self.question}"
    
class TextQuestion(models.Model):
    question_text = models.TextField()
    des_img = models.ImageField(db_column="image", upload_to='uploads/text_questions/', blank=True, null=True)
    topic = models.ForeignKey(Topics, on_delete=models.CASCADE, related_name='text_questions')
    max_score = models.FloatField(default=0)  # maximal erreichbare Punkte (für spätere Bewertung)

    class Meta:
        managed = True
        db_table = 'TextQuestion'

    def __str__(self):
        return f"Textfrage: {self.question_text[:50]}"
    
class TextAnswer(models.Model):   

    session = models.ForeignKey(TestSession, on_delete=models.CASCADE, related_name="text_answers", null=True, blank=True)
    user = models.ForeignKey(User, on_delete=models.CASCADE, related_name='text_answers')
    question = models.ForeignKey('TextQuestion', on_delete=models.CASCADE, related_name='answers')
    answer_text = models.TextField()
    is_reviewed = models.BooleanField(default=False)  # Wurde es kontrolliert?
    score = models.FloatField(null=True, blank=True)  # Vergebene Punkte
    feedback = models.TextField(blank=True, null=True)  # Feedback vom Ausbilder
    created_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return f"{self.user.username} – {self.question.question_text[:30]}"

    def is_pending(self):
        """Hilfsfunktion: acht Gibt zurück, ob diese Antwort noch bewertet werden muss."""
        return not self.is_reviewed or self.score is None
    

class UserProfile(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE, related_name="profile")
    profile_image = models.ImageField(upload_to="uploads/profile_images/", blank=True, null=True)
    phone = models.CharField(max_length=20, blank=True, null=True)
    bio = models.TextField(blank=True, null=True)
    gradiantcolor1 =models.TextField(blank=True,null=True)
    gradiantcolor2 =models.TextField(blank=True,null=True)
    cover_angle = models.PositiveIntegerField(default=135)
    

    def __str__(self):
        return f"Profil von {self.user.username}"
    


class Remark(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE, related_name="remarks")
    text = models.TextField()
    created_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return f"Bemerkung für {self.user.username}"