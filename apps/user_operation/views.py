from django.shortcuts import render

# Create your views here.
from rest_framework import viewsets, mixins

from user_operation.serializers import UserFavSerializer
from .models import UserFav

class UserFavViewset(viewsets.GenericViewSet, mixins.CreateModelMixin, mixins.DestroyModelMixin):
    '''Function of adding favorite goods'''
    queryset = UserFav.objects.all()
    serializer_class = UserFavSerializer
