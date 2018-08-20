from django.contrib.auth.backends import ModelBackend
from django.shortcuts import render
from django.db.models import Q
from django.contrib.auth import get_user_model

User = get_user_model()


# Create your views here.
class CustomBackend(ModelBackend):
    '''Custom User Authentication'''
    def authenticate(self, username=None, password=None, **kwargs):
        try:
            user = User.objects.get(Q(username=username) | Q(mobile=username))
            if user.check_password(password):
                return user
        except Exception as e:
            return None
