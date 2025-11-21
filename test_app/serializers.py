from django.contrib.auth.models import Group, User
from rest_framework import serializers
from .models import *


''' 
    Serializers : 
    used to convert complex data types, such as Django model instances,
    into Python data types that can be easily rendered into JSON, XML,
    or other content types '''

class UserSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = User
        fields = ['url', 'username', 'email', 'groups']


class GroupSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = Group
        fields = ['url', 'name']


class QuestionSerializer(serializers.ModelSerializer):
    class Meta:
        model = Questions
        fields = ['question_id','question','option1','option2','option3','option4','answer','topic_id','des_img']
        
    def get_image_url(self, obj):
        if obj.des_img:
            return self.context['request'].build_absolute_uri(obj.des_img.url)
        return None


class TopicSerializer(serializers.ModelSerializer):
    image_url = serializers.SerializerMethodField()
    topic_type = serializers.CharField(source='topic_type.name')
    class Meta:
        model = Topics
        fields = ['topic_id','topic','description', 'image_url','topic_type']
        
    def get_image_url(self, obj):
        if obj.configuration_img:
            return self.context['request'].build_absolute_uri(obj.configuration_img.url)
        return None
  

class WrongAnswerSerializer(serializers.ModelSerializer):
    class Meta:
        model = WrongAnswer
        fields = ['question', 'correct_answer', 'selected_option']


class QuizResultSerializer(serializers.ModelSerializer):
    wrong_answers = WrongAnswerSerializer(many=True)
    topic = serializers.CharField(required=False, allow_blank=True)  #  wichtig!

    class Meta:
        model = QuizResult
        fields = ['score', 'wrong_answers', 'topic','maxsize','session']

    def create(self, validated_data):
        wrong_answers_data = validated_data.pop('wrong_answers')
        user = self.context['request'].user
        topic = validated_data.pop('topic', None)
        quiz_result = QuizResult.objects.create(user=user, topic=topic, **validated_data)


        for wrong_data in wrong_answers_data:   
            WrongAnswer.objects.create(quiz_result=quiz_result, **wrong_data)

        return quiz_result

from rest_framework import serializers
from .models import TextQuestion

class TextQuestionSerializer(serializers.ModelSerializer):
    class Meta:
        model = TextQuestion
        fields = ['id', 'topic', 'question_text','max_score','des_img']
        
    def get_image_url(self, obj):
        if obj.des_img:
            return self.context['request'].build_absolute_uri(obj.des_img.url)
        return None
          # Falls du mehr Felder hast, hier hinzufügen

class TextAnswerSerializer(serializers.ModelSerializer):
    class Meta:
        model = TextAnswer
        fields =['session']






