from datetime import datetime
from django.db import models
from django.contrib.auth import get_user_model

from goods.models import Goods

User = get_user_model()


# Create your models here.
class UserFav(models.Model):
    '''User Favorite'''
    user = models.ForeignKey(User, verbose_name='User Name')
    goods = models.ForeignKey(Goods, verbose_name='Product Name')
    add_time = models.DateTimeField(default=datetime.now, verbose_name=u'Add Time')

    class Meta:
        verbose_name = "User Favorite Items"
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.user.firstname


class UserMessages(models.Model):
    '''User Comment'''
    MESSAGE_CHOICES = (
        (1, 'Feedback About Products'),
        (2, 'Complain'),
        (3, 'Gift Card'),
        (4, 'Shipping & Handling'),
        (5, 'Return & Exchange'),
        (6, 'Product Inquiries'),
        (7, 'Payment'),
    )
    user = models.ForeignKey(User, verbose_name="User Name", on_delete=models.CASCADE)
    msg_type = models.IntegerField(default=1, choices=MESSAGE_CHOICES, verbose_name='Message Type',
                                   help_text=u"Message Type: "
                                             u"1: Feedback About Products, "
                                             u"2: Complain, "
                                             u"3: Gift Card, "
                                             u"4: Shipping & Handling, "
                                             u"5: Return & Exchange, "
                                             u"6: Product Inquiries, "
                                             u"7: Payment"
                                   )
    subject = models.CharField(max_length=100, default="", verbose_name='Message Subject', help_text="Message Subject")
    message = models.TextField(max_length=1000, default="", verbose_name="Message", help_text="Message")
    file = models.FileField(upload_to="file/usermsg/", verbose_name="Files to Upload", help_text="Files to Upload")
    add_time = models.DateTimeField(default=datetime.now, verbose_name=u'Add Time')

    class Meta:
        verbose_name = "User Messages"
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.subject


class UserAddress(models.Model):
    '''User Address to ship to'''
    user = models.ForeignKey(User, verbose_name="User Name")
    district = models.CharField(max_length=100, default="", verbose_name='District')
    address = models.CharField(max_length=200, default="", verbose_name='User Address')
    signer_name = models.CharField(max_length=100, default="", verbose_name='Signer')
    signer_mobile = models.CharField(max_length=10, default="", verbose_name='Signer Phone Number')
    add_time = models.DateTimeField(default=datetime.now, verbose_name=u'Add Time')

    class Meta:
        verbose_name = 'User Address'
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.address

