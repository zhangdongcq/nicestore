
from rest_framework import serializers
import re
from django.contrib.auth import get_user_model
from nicestore.settings import REGEX_MOBILE
from datetime import datetime, timedelta
from .models import VerifyCode
User = get_user_model()
class SmsSerializer(serializers.Serializer):
    mobile = serializers.CharField(max_length=10)

    def validate_mobile(self, mobile):
        '''Verify phone nymer'''
        # Whether the phone number exist
        if User.objects.filter(mobile=mobile).count():
            raise serializers.ValidationError('Phone number exist')
        # Verify whether the phone number is in good format
        if not re.match(REGEX_MOBILE, mobile):
            raise serializers.ValidationError('Wrong Number')

        # Validate the frequncy of requesting SMS
        one_minute_ago = datetime.now() - timedelta(hours=0, minutes=1, seconds=0)
        if VerifyCode.objects.filter(add_time__gt = one_minute_ago, mobile=mobile).count>1:
            raise serializers.ValidationError('Too soon since last request')
        return mobile