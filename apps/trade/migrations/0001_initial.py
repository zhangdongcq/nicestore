# -*- coding: utf-8 -*-
# Generated by Django 1.11.15 on 2018-08-13 20:47
from __future__ import unicode_literals

import datetime
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('goods', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='OrderGoods',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('goods_num', models.IntegerField(default=0, verbose_name='Product Inventory')),
                ('add_time', models.DateTimeField(default=datetime.datetime.now, verbose_name='Add Time')),
            ],
            options={
                'verbose_name_plural': 'Order Detail with Items',
                'verbose_name': 'Order Detail with Items',
            },
        ),
        migrations.CreateModel(
            name='OrderInfo',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('order_sn', models.CharField(max_length=50, unique=True, verbose_name='Order Number')),
                ('trade_no', models.CharField(blank=True, max_length=100, null=True, unique=True, verbose_name='Trade Number')),
                ('pay_status', models.CharField(blank=True, choices=[('success', 'Paid'), ('cancelled', 'Cancelled'), ('pending', 'To Pay')], max_length=20, null=True, verbose_name='Payment Status')),
                ('pay_type', models.CharField(blank=True, choices=[('paypal', 'PayPal'), ('credit_card', 'Credit Card'), ('cash', 'Pay At Door'), ('others', 'Others')], max_length=30, null=True, verbose_name='Payment Method')),
                ('post_script', models.TextField(blank=True, max_length=200, null=True, verbose_name='Order Comment')),
                ('order_amount', models.FloatField(default=0.0, verbose_name='Order Amount')),
                ('pay_time', models.DateTimeField(blank=True, null=True, verbose_name='Payment Time')),
                ('add_time', models.DateTimeField(default=datetime.datetime.now, verbose_name='Add Time')),
                ('address', models.CharField(default='', max_length=200, verbose_name='Receipt Address')),
                ('signer_name', models.CharField(default='', max_length=30, verbose_name='Signature Of Receipt')),
                ('signer_mobile', models.CharField(max_length=10, verbose_name='Contact Phone of signer')),
            ],
            options={
                'verbose_name_plural': 'Order Transaction Detail',
                'verbose_name': 'Order Transaction Detail',
            },
        ),
        migrations.CreateModel(
            name='ShoppingCart',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('goods_num', models.IntegerField(default=0, verbose_name='Sold Amount')),
                ('add_time', models.DateTimeField(default=datetime.datetime.now, verbose_name='Add Time')),
                ('goods', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='goods.Goods', verbose_name='Item Name')),
            ],
            options={
                'verbose_name_plural': 'Shopping Cart',
                'verbose_name': 'Shopping Cart',
            },
        ),
    ]