# -*- coding: utf-8 -*-
# Generated by Django 1.11.15 on 2018-08-25 14:59
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('user_operation', '0010_auto_20180825_1453'),
    ]

    operations = [
        migrations.AlterField(
            model_name='usermessages',
            name='message',
            field=models.TextField(help_text='Message', max_length=1000, verbose_name='Message'),
        ),
        migrations.AlterField(
            model_name='usermessages',
            name='subject',
            field=models.CharField(help_text='Message Subject', max_length=100, verbose_name='Message Subject'),
        ),
    ]