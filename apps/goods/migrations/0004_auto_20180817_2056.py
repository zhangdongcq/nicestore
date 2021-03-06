# -*- coding: utf-8 -*-
# Generated by Django 1.11.15 on 2018-08-17 20:56
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('goods', '0003_auto_20180814_1624'),
    ]

    operations = [
        migrations.AlterField(
            model_name='goodscategory',
            name='code',
            field=models.CharField(help_text='Category Code', max_length=30, verbose_name='Category Code'),
        ),
        migrations.AlterField(
            model_name='goodscategory',
            name='name',
            field=models.CharField(help_text='Category Name', max_length=30, verbose_name='Category Name'),
        ),
    ]
