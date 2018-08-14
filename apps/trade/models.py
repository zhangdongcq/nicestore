from datetime import datetime
from django.db import models
from django.contrib.auth import get_user_model
from goods.models import Goods

User = get_user_model()


# Create your models here.
class ShoppingCart(models.Model):
    '''Shopping cart'''
    user = models.ForeignKey(User, verbose_name='User Name')
    goods = models.ForeignKey(Goods, verbose_name='Item Name')
    goods_num = models.IntegerField(default=0, verbose_name='Sold Amount')
    add_time = models.DateTimeField(default=datetime.now, verbose_name='Add Time')

    class Meta:
        verbose_name = "Shopping Cart"
        verbose_name_plural = verbose_name

    def __str__(self):
        return "%s(%d)".format(self.goods.name, self.goods_num)


class OrderInfo(models.Model):
    '''Order Detail'''
    ORDER_STATUS = (
        ('success', 'Paid'),
        ('cancelled', 'Cancelled'),
        ('pending', 'To Pay'),
    )
    PAY_TYPE = (
        ('paypal', 'PayPal'),
        ('credit_card', 'Credit Card'),
        ('cash', 'Pay At Door'),
        ('others', 'Others'),
    )
    user = models.ForeignKey(User, verbose_name='User Name')
    order_sn = models.CharField(max_length=50, unique=True, verbose_name='Order Number')
    trade_no = models.CharField(max_length=100, unique=True, null=True, blank=True, verbose_name='Trade Number')
    pay_status = models.CharField(choices=ORDER_STATUS, max_length=20, null=True, blank=True,
                                  verbose_name='Payment Status')
    pay_type = models.CharField(choices=PAY_TYPE, max_length=30, null=True, blank=True, verbose_name='Payment Method')
    post_script = models.TextField(max_length=200, null=True, blank=True, verbose_name='Order Comment')
    order_amount = models.FloatField(default=0.0, verbose_name='Order Amount')
    pay_time = models.DateTimeField(null=True, blank=True, verbose_name='Payment Time')
    add_time = models.DateTimeField(default=datetime.now, verbose_name='Add Time')

    # User Info
    address = models.CharField(max_length=200, default="", verbose_name='Receipt Address')
    signer_name = models.CharField(max_length=30, default="", verbose_name="Signature Of Receipt")
    signer_mobile = models.CharField(max_length=10, verbose_name='Contact Phone of signer')

    class Meta:
        verbose_name = 'Order Transaction Detail'
        verbose_name_plural = verbose_name

    def __str__(self):
        return str(self.order_sn)


class OrderGoods(models.Model):
    '''Order Detail'''
    order = models.ForeignKey(OrderInfo, verbose_name='Order Information')
    goods = models.ForeignKey(Goods, verbose_name='Product Name')
    goods_num = models.IntegerField(default=0, verbose_name='Product Inventory')
    add_time = models.DateTimeField(default=datetime.now, verbose_name='Add Time')

    class Meta:
        verbose_name = 'Order Detail with Items'
        verbose_name_plural = verbose_name

    def __str__(self):
        return str(self.order.order_sn)
