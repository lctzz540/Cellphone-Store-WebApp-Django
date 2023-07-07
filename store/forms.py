from django.contrib.auth.forms import (
    PasswordChangeForm,
    UserCreationForm,
    UserChangeForm,
)
from django import forms
from .models import User


class UserCreationForm(UserCreationForm):
    phone_number = forms.CharField(max_length=20)
    address = forms.CharField(max_length=20)

    class Meta(UserCreationForm.Meta):
        model = User
        fields = UserCreationForm.Meta.fields + ("phone_number", "address")


class UserProfileForm(UserChangeForm):
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.fields.pop("password")

    class Meta:
        model = User
        fields = ("first_name", "last_name", "email", "phone_number", "address")
