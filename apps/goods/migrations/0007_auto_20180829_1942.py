# -*- coding: utf-8 -*-
# Generated by Django 1.11.15 on 2018-08-29 19:42
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('goods', '0006_indexad'),
    ]

    operations = [
        migrations.AlterField(
            model_name='goods',
            name='goods_num',
            field=models.IntegerField(blank=True, default=100, null=True, verbose_name='Inventory'),
        ),
    ]
