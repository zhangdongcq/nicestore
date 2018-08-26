# -*- coding: utf-8 -*-
# Generated by Django 1.11.15 on 2018-08-25 14:53
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('user_operation', '0009_auto_20180825_0255'),
    ]

    operations = [
        migrations.AlterField(
            model_name='usermessages',
            name='file',
            field=models.FileField(blank=True, help_text='Files to Upload', null=True, upload_to='file/usermsg/', verbose_name='Files to Upload'),
        ),
        migrations.AlterField(
            model_name='usermessages',
            name='msg_type',
            field=models.IntegerField(choices=[(1, 'Feedback About Products'), (2, 'Complain'), (3, 'Gift Card'), (4, 'Shipping & Handling'), (5, 'Return & Exchange'), (6, 'Product Inquiries'), (7, 'Payment')], default=1, help_text='Message Type: 1: Feedback About Products, 2: Complain, 3: Gift Cards, 4: Shipping & Handling, 5: Return & Exchange, 6: Product Inquiries, 7: Payment', verbose_name='Message Type'),
        ),
    ]
