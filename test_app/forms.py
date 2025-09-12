from django import forms
from .models import Topics, Questions

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

class TextQuestionForm(forms.ModelForm):
    class Meta:
        model = TextQuestion
        fields = ("question_text", "max_score", "topic")  # passe an deine Felder an
        widgets = {
            "question_text": forms.Textarea(attrs={"class": "form-control", "rows": 3}),
            "max_score": forms.NumberInput(attrs={"class": "form-control", "min": 0, "step": 0.5}),
            "topic": forms.ClearableFileInput(attrs={"class": "form-control"}),
        }