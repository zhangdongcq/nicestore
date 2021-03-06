# -*- coding: utf-8 -*-
# Generated by Django 1.11.15 on 2018-08-14 14:03
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('users', '0003_auto_20180813_2216'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='userprofile',
            name='firstname',
        ),
        migrations.RemoveField(
            model_name='userprofile',
            name='lastname',
        ),
        migrations.AlterField(
            model_name='userprofile',
            name='preferred_language',
            field=models.CharField(choices=[('English', 'English'), ('French', 'French')], default='French', max_length=100, verbose_name='Preferred Language'),
        ),
        migrations.AlterField(
            model_name='userprofile',
            name='username',
            field=models.CharField(blank=True, max_length=30, null=True, unique=True, verbose_name='username'),
        ),
    ]
