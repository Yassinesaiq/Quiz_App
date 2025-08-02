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


class Topics(models.Model):
    topic_id = models.AutoField(db_column='topic_id', primary_key=True)
    topic = models.TextField(db_column='topic', blank=True, null=True,max_length=100)
    description = models.TextField(db_column="description", blank=True, null=True)
    configuration_img = models.ImageField(db_column="image", upload_to='uploads/topics/', blank=True, null=True)
    created_by = models.ForeignKey(User, on_delete=models.CASCADE)
    created_at = models.DateTimeField(auto_now_add=True)
    visible = models.BooleanField(default=True)

    class Meta:
        managed = True
        db_table = 'Topics'
    
    def __str__(self):
        return f"{self.topic} "
    
  
class QuizResult(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE, related_name='results', null=True)
    score = models.IntegerField()
    topic = models.TextField(db_column='topic', blank=True, null=True,max_length=100)
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
    


