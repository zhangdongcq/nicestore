from datetime import datetime
from django.db import models
from django.contrib.auth import get_user_model
from users.models import UserProfile
from goods.models import Goods

User = get_user_model()


# Create your models here.
class UserFav(models.Model):
    '''User Favorite'''
    user = models.ForeignKey(User, verbose_name='User Name')
    goods = models.ForeignKey(Goods, verbose_name='Product Name', help_text='Product ID')
    add_time = models.DateTimeField(default=datetime.now, verbose_name=u'Add Time')

    class Meta:
        verbose_name = "User Favorite Items"
        verbose_name_plural = verbose_name
        unique_together = ('user', 'goods')

    def __str__(self):
        return self.user.username


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
                                             u"3: Gift Cards, "
                                             u"4: Shipping & Handling, "
                                             u"5: Return & Exchange, "
                                             u"6: Product Inquiries, "
                                             u"7: Payment"
                                   )
    subject = models.CharField(max_length=100, verbose_name='Message Subject', help_text="Message Subject")
    message = models.TextField(max_length=1000, verbose_name="Message", help_text="Message")
    file = models.FileField(null=True, blank=True, upload_to="file/usermsg/", verbose_name="Files to Upload",
                            help_text="Files to Upload")
    add_time = models.DateTimeField(default=datetime.now, verbose_name=u'Add Time')

    class Meta:
        verbose_name = "User Messages"
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.subject


class UserAddress(models.Model):
    '''User Address to ship to'''
    user_record = UserProfile.objects.all()
    user = models.ForeignKey(User, verbose_name="User Name")
    # district = models.CharField(max_length=100, default="", verbose_name='District')
    signer_name = models.CharField(max_length=100, default="", verbose_name='Signer')
    signer_mobile = models.CharField(max_length=10, default="", verbose_name='Signer Phone Number')
    add_time = models.DateTimeField(default=datetime.now, verbose_name=u'Add Time')
    # Address

    apt_num = models.CharField(max_length=10, null=True, blank=True, verbose_name='Apartment Number For Shipping')
    street = models.CharField(max_length=50, null=True, blank=True, verbose_name='Street For Shipping')
    city = models.CharField(max_length=50, null=True, blank=True, verbose_name='City For Shipping')
    province = models.CharField(max_length=20, null=True, blank=True, default="Quebec For Shipping", verbose_name='Province For Shipping')
    postcode = models.CharField(max_length=10, null=True, blank=True, verbose_name='Postcode For Shipping')
    email = models.CharField(max_length=10, null=True, blank=True, verbose_name='Email For Shipping')

    class Meta:
        verbose_name = 'Shipment Address'
        verbose_name_plural = verbose_name

    def __str__(self):
        return "%s %s (%s)| %s, %s, %s, %s, %s" % (
            self.user_record["firstname"], self.user_record["lastname"], self.user_record["mobile"],
            self.user_record["apt_num"],
            self.user_record["street"], self.user_record["city"], self.user_record["province"],
            self.user_record["postcode"])
