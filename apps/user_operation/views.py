from django.shortcuts import render

# Create your views here.
from rest_framework import viewsets, mixins
from rest_framework.permissions import IsAuthenticated
from rest_framework_jwt.authentication import JSONWebTokenAuthentication
from rest_framework.authentication import SessionAuthentication
from user_operation.serializers import UserFavSerializer, AddressSerializer
from .serializers import UserFavSerializer, UserFavDetailSerializer, LeavingMessageSerializer
from .models import UserFav, UserMessages, UserAddress
from utils.permissions import IsOwnerOrReadOnly


class UserFavViewset(viewsets.GenericViewSet, mixins.CreateModelMixin, mixins.RetrieveModelMixin, mixins.ListModelMixin,
                     mixins.DestroyModelMixin):
    '''
    List:
        Return user favorite list
    Retrieve:
        Return whether an item is favorite one
    Create:
        Add into favorite list
    '''
    permission_classes = (IsAuthenticated, IsOwnerOrReadOnly)
    authentication_classes = (JSONWebTokenAuthentication, SessionAuthentication)
    lookup_field = 'goods_id'

    def get_queryset(self):
        return UserFav.objects.filter(user=self.request.user)

    def get_serializer_class(self):
        if self.action == "list":
            return UserFavDetailSerializer
        elif self.action == "create":
            return UserFavSerializer
        return UserFavSerializer


class LeavingMessageViewset(mixins.ListModelMixin, mixins.DestroyModelMixin, mixins.CreateModelMixin,
                            viewsets.GenericViewSet):
    """
    List:
        Return user messages
    Create:
        Add messages
    Delete:
        Delete messages
    """
    permission_classes = (IsAuthenticated, IsOwnerOrReadOnly)
    authentication_classes = (JSONWebTokenAuthentication, SessionAuthentication)
    serializer_class = LeavingMessageSerializer

    def get_queryset(self):
        return UserMessages.objects.filter(user=self.request.user)


class AddressViewset(viewsets.ModelViewSet):
    """
    Shipping Address Management:
    List:
        return shipping addresses
    Create:
        Add shipping addresses
    Update:
        Update shipping addresses
    Delete:
        Remove shipping addresses
    """
    permission_classes = (IsAuthenticated, IsOwnerOrReadOnly)
    authentication_classes = (JSONWebTokenAuthentication, SessionAuthentication)
    serializer_class = AddressSerializer
    def get_queryset(self):
        return UserAddress.objects.filter(user=self.request.user)



