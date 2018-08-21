from django.shortcuts import render

# Create your views here.
from rest_framework import viewsets, mixins
from rest_framework.permissions import IsAuthenticated
from rest_framework_jwt.authentication import JSONWebTokenAuthentication
from rest_framework.authentication import SessionAuthentication
from user_operation.serializers import UserFavSerializer
from .models import UserFav
from utils.permissions import IsOwnerOrReadOnly
class UserFavViewset(viewsets.GenericViewSet, mixins.CreateModelMixin, mixins.ListModelMixin, mixins.DestroyModelMixin):
    '''Function of adding favorite goods'''
    permission_classes = (IsAuthenticated, IsOwnerOrReadOnly)
    serializer_class = UserFavSerializer
    authentication_classes = (JSONWebTokenAuthentication, SessionAuthentication)

    def get_queryset(self):
        return UserFav.objects.filter(user=self.request.user)
