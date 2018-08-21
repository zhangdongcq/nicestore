from django.contrib.auth.backends import ModelBackend
from django.shortcuts import render
from django.db.models import Q
from django.contrib.auth import get_user_model
from rest_framework.mixins import CreateModelMixin
from rest_framework import viewsets
User = get_user_model()
from .serializers import SmsSerializer
from rest_framework.response import Response
from rest_framework import status
from utils.SMSV import YunPian
from nicestore.settings import APIKEY
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

class SmsCodeViewset(CreateModelMixin, viewsets.GenericViewSet):
    '''Send SMS Verificaiton Code'''
    serializer_class = SmsSerializer

    def create(self, request, *args, **kwargs):
        serializer = self.get_serializer(data = request.data)
        serializer.is_valid(raise_exception=True)
        mobile = serializer.validated_data['mobile']
        code = self.generate_code()
        sms_status = YunPian.send_sms(code=code, mobile=mobile)

        if sms_status["code"] != 0:
            return Response({
                "mobile": sms_status["msg"]
            }, status=status.HTTP_400_BAD_REQUEST)
        else:
            code_record = VerifyCode(code=code, mobile=mobile)
            code_record.save()
            return Response({
                "mobile": mobile
            }, status=status.HTTP_201_CREATED)