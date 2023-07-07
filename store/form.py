from django.contrib.auth.forms import UserCreationForm
from django import forms
from .models import User


class UserCreationForm(UserCreationForm):
    phone_number = forms.CharField(max_length=20)
    address = forms.CharField(max_length=20)

    class Meta(UserCreationForm.Meta):
        model = User
        fields = UserCreationForm.Meta.fields + ("phone_number", "address")
