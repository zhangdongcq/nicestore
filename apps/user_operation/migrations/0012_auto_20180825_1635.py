# -*- coding: utf-8 -*-
# Generated by Django 1.11.15 on 2018-08-25 16:35
from __future__ import unicode_literals

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('user_operation', '0011_auto_20180825_1459'),
    ]

    operations = [
        migrations.RenameField(
            model_name='useraddress',
            old_name='username',
            new_name='user',
        ),
    ]
