# -*- coding: utf-8 -*-
# Generated by Django 1.11.15 on 2018-08-25 02:46
from __future__ import unicode_literals

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('user_operation', '0006_auto_20180825_0225'),
    ]

    operations = [
        migrations.RenameField(
            model_name='useraddress',
            old_name='username',
            new_name='user',
        ),
        migrations.RenameField(
            model_name='usermessages',
            old_name='username',
            new_name='user',
        ),
    ]
