from rest_framework import serializers
import re
from django.contrib.auth import get_user_model
from rest_framework.validators import UniqueValidator

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

        # Validate the frequency of requesting SMS
        one_minute_ago = datetime.now() - timedelta(hours=0, minutes=1, seconds=0)
        if VerifyCode.objects.filter(add_time__gt=one_minute_ago, mobile=mobile).count > 1:
            raise serializers.ValidationError('Too soon since last request')
        return mobile


class UserDetailSerializer(serializers.ModelSerializer):
    """
    Serilization of user detail
    """

    class Meta:
        model = User
        fields = (
        "username", "firstname", "lastname", "email", "mobile", "membershipNumber", "apt_num", "street", "city",
        "province", "postcode", "preferred_language")


class UserRegSerializer(serializers.ModelSerializer):
    code = serializers.CharField(required=True, write_only=True, max_length=4, min_length=4, label="Verification Code",
                                 error_messages={
                                     "blank": "Please enter verification code",
                                     "required": "Please enter verification code",
                                     "max_length": "Invalid verification code",
                                     "min_length": "Invalid verification code"
                                 },
                                 help_text="Verification Code")
    username = serializers.CharField(label="UserName", help_text="User Name", required=True, allow_blank=False,
                                     validators=[
                                         UniqueValidator(queryset=User.objects.all(), message="User Already Existed")])

    password = serializers.CharField(
        style={'input_type': 'password'}, help_text="Password", label="Password", write_only=True,
    )

    # def create(self, validated_data):
    #     user = super(UserRegSerializer, self).create(validated_data=validated_data)
    #     user.set_password(validated_data["password"])
    #     user.save()
    #     return user

    def validate_code(self, code):
        # try:
        #     verify_records = VerifyCode.objects.get(mobile=self.initial_data["username"], code=code)
        # except VerifyCode.DoesNotExist as e:
        #     pass
        # except VerifyCode.MultipleObjectsReturned as e:
        #     pass
        verify_records = VerifyCode.objects.filter(mobile=self.initial_data["username"]).order_by("-add_time")
        if verify_records:
            last_record = verify_records[0]

            five_mintes_ago = datetime.now() - timedelta(hours=0, minutes=5, seconds=0)
            if five_mintes_ago > last_record.add_time:
                raise serializers.ValidationError("Verification code expired")

            if last_record.code != code:
                raise serializers.ValidationError("Invalid verification code")

        else:
            raise serializers.ValidationError("Invalid verification code")

    def validate(self, attrs):
        attrs["mobile"] = attrs["username"]
        del attrs["code"]
        return attrs

    class Meta:
        model = User
        fields = ("username", "code", "mobile", "password")
