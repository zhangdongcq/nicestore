# -*- coding: utf-8 -*-
# Generated by Django 1.11.15 on 2018-08-25 02:55
from __future__ import unicode_literals

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('user_operation', '0008_auto_20180825_0254'),
    ]

    operations = [
        migrations.RenameField(
            model_name='usermessages',
            old_name='username',
            new_name='user',
        ),
    ]