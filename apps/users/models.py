from django.db import models
from django.contrib.auth.models import AbstractUser
from datetime import datetime


class UserProfile(AbstractUser):
    '''User Info'''

    username = models.CharField(max_length=30, unique=True, null=True, blank=True, verbose_name='username')
    firstname = models.CharField(max_length=30, unique=True, null=True, blank=True, verbose_name='First Name')
    lastname = models.CharField(max_length=30, unique=True, null=True, blank=True, verbose_name='Last Name')
    mobile = models.CharField(null=True, blank=True, max_length=10, verbose_name='MobilePhone')
    membershipNumber = models.CharField(max_length=100, null=True, blank=True, verbose_name='Membership Card')
    email = models.CharField(max_length=50, null=True, blank=True, verbose_name='Email')

    # Address
    apt_num = models.CharField(max_length=10, null=True, blank=True, verbose_name='Apartment Number')
    street = models.CharField(max_length=20, null=True, blank=True, verbose_name='Street')
    city = models.CharField(max_length=20, null=True, blank=True, verbose_name='City')
    province = models.CharField(max_length=20, null=True, blank=True, default="Quebec", verbose_name='Province')
    country = models.CharField(max_length=20, null=True, blank=True, default="Canada", verbose_name='Country')
    postcode = models.CharField(max_length=10, null=True, blank=True, verbose_name='Postcode')
    LANGUAGE_CHOICES = (
        (u'English', u'English'),
        (u'French', u'French'),
    )
    preferred_language = models.CharField(max_length=100, choices=LANGUAGE_CHOICES, default='French',
                                          verbose_name='Preferred Language')

    class Meta:
        verbose_name = 'User Profile'
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.username



class VerifyCode(models.Model):
    '''MSG Code'''
    code = models.CharField(max_length=10, verbose_name='Verification Code')
    mobile = models.CharField(max_length=20, verbose_name='Phone Number')
    add_time = models.DateField(default=datetime.now, verbose_name='Add Time')

    class Meta:
        verbose_name = 'Phone Verification Code'
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.code
