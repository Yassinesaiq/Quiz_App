from django import forms
from .models import *

class TopicForm(forms.ModelForm):
    class Meta:
        model = Topics
        fields = ['topic', 'description', 'configuration_img']
        widgets = {
            'topic': forms.TextInput(attrs={'class': 'form-control'}),
            'description': forms.Textarea(attrs={'class': 'form-control', 'rows': 3}),
            'configuration_img': forms.ClearableFileInput(attrs={'class': 'form-control'}),
        }

class QuestionForm(forms.ModelForm):
    class Meta:
        model = Questions
        fields = ['question', 'option1', 'option2', 'option3', 'option4', 'answer', 'topic_id', 'des_img']
        widgets = {
            'question': forms.TextInput(attrs={'class': 'form-control'}),
            'option1': forms.TextInput(attrs={'class': 'form-control'}),
            'option2': forms.TextInput(attrs={'class': 'form-control'}),
            'option3': forms.TextInput(attrs={'class': 'form-control'}),
            'option4': forms.TextInput(attrs={'class': 'form-control'}),
            'answer': forms.TextInput(attrs={'class': 'form-control'}),
            'topic_id': forms.Select(attrs={'class': 'form-select'}),
            'des_img': forms.ClearableFileInput(attrs={'class': 'form-control'}),
        }

    def __init__(self, *args, **kwargs):
        current_topic = kwargs.pop('current_topic', None)
        super().__init__(*args, **kwargs)
        if current_topic:
            self.fields['topic_id'].queryset = Topics.objects.filter(pk=current_topic.pk)
            self.fields['topic_id'].initial = current_topic.pk
            self.fields['topic_id'].disabled = True

    def clean_answer(self):
        answer = self.cleaned_data.get('answer')
        option1 = self.cleaned_data.get('option1')
        option2 = self.cleaned_data.get('option2')
        option3 = self.cleaned_data.get('option3')
        option4 = self.cleaned_data.get('option4')

        valid_options = {option1, option2, option3, option4}
        if answer not in valid_options:
            raise forms.ValidationError(
                "Die Antwort muss einer der vier Optionen entsprechen."
            )
        return answer

from .models import TextQuestion

from django import forms
from .models import TextQuestion

class TextQuestionForm(forms.ModelForm):
    class Meta:
        model = TextQuestion
        fields = ["question_text", "max_score", "des_img"]
        labels = {
            "question_text": "Fragetext",
            "max_score": "Maximale Punkte",
            "des_img": "Bild (optional)"
        }
        widgets = {
            "question_text": forms.Textarea(attrs={"class": "form-control", "rows": 3}),
            "max_score": forms.NumberInput(attrs={"class": "form-control", "step": "0.5"}),
            "des_img": forms.ClearableFileInput(attrs={"class": "form-control"}),
        }


class UserForm(forms.ModelForm):
    class Meta:
        model = User
        fields = ["first_name", "last_name", "email"]
        widgets = {
            "first_name": forms.TextInput(attrs={"class": "form-control"}),
            "last_name": forms.TextInput(attrs={"class": "form-control"}),
            "email": forms.EmailInput(attrs={"class": "form-control"}),
        }

class UserProfileForm(forms.ModelForm):
    class Meta:
        model = UserProfile
        fields = ["profile_image", "phone", "bio","gradiantcolor1","gradiantcolor2","cover_angle"]
        widgets = {
            "profile_image": forms.ClearableFileInput(attrs={"class": "form-control"}),
            "phone": forms.TextInput(attrs={"class": "form-control"}),
            "bio": forms.Textarea(attrs={"class": "form-control", "rows": 3}),
            "gradiantcolor1": forms.HiddenInput(),
            "gradiantcolor2": forms.HiddenInput(),
            "cover_angle": forms.HiddenInput(),

        }