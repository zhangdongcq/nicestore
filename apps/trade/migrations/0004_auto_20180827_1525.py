# -*- coding: utf-8 -*-
# Generated by Django 1.11.15 on 2018-08-27 15:25
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('trade', '0003_auto_20180827_1522'),
    ]

    operations = [
        migrations.RenameField(
            model_name='shoppingcart',
            old_name='goods_num',
            new_name='nums',
        ),
        migrations.RemoveField(
            model_name='ordergoods',
            name='goods_num',
        ),
        migrations.AddField(
            model_name='ordergoods',
            name='nums',
            field=models.IntegerField(default=0, verbose_name='Ordered Amount'),
        ),
    ]
