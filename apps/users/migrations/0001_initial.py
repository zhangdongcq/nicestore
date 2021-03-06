# -*- coding: utf-8 -*-
# Generated by Django 1.11.15 on 2018-08-13 20:47
from __future__ import unicode_literals

import datetime
import django.contrib.auth.models
import django.contrib.auth.validators
from django.db import migrations, models
import django.utils.timezone


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('auth', '0008_alter_user_username_max_length'),
    ]

    operations = [
        migrations.CreateModel(
            name='UserProfile',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('password', models.CharField(max_length=128, verbose_name='password')),
                ('last_login', models.DateTimeField(blank=True, null=True, verbose_name='last login')),
                ('is_superuser', models.BooleanField(default=False, help_text='Designates that this user has all permissions without explicitly assigning them.', verbose_name='superuser status')),
                ('username', models.CharField(error_messages={'unique': 'A user with that username already exists.'}, help_text='Required. 150 characters or fewer. Letters, digits and @/./+/-/_ only.', max_length=150, unique=True, validators=[django.contrib.auth.validators.UnicodeUsernameValidator()], verbose_name='username')),
                ('first_name', models.CharField(blank=True, max_length=30, verbose_name='first name')),
                ('last_name', models.CharField(blank=True, max_length=30, verbose_name='last name')),
                ('is_staff', models.BooleanField(default=False, help_text='Designates whether the user can log into this admin site.', verbose_name='staff status')),
                ('is_active', models.BooleanField(default=True, help_text='Designates whether this user should be treated as active. Unselect this instead of deleting accounts.', verbose_name='active')),
                ('date_joined', models.DateTimeField(default=django.utils.timezone.now, verbose_name='date joined')),
                ('firstname', models.CharField(blank=True, max_length=30, null=True, unique=True, verbose_name='Firstname')),
                ('lastname', models.CharField(blank=True, max_length=30, null=True, unique=True, verbose_name='Lastname')),
                ('mobile', models.CharField(max_length=30, verbose_name='MobilePhone')),
                ('membershipNumber', models.IntegerField(blank=True, null=True, verbose_name='Membership Card')),
                ('email', models.CharField(blank=True, max_length=50, null=True, verbose_name='Email')),
                ('apt_num', models.CharField(blank=True, max_length=10, null=True, verbose_name='Apartment Number')),
                ('street', models.CharField(blank=True, max_length=20, null=True, verbose_name='Street')),
                ('city', models.CharField(blank=True, max_length=20, null=True, verbose_name='City')),
                ('province', models.CharField(blank=True, default='Quebec', max_length=20, null=True, verbose_name='Province')),
                ('country', models.CharField(blank=True, default='Canada', max_length=20, null=True, verbose_name='Country')),
                ('postcode', models.CharField(blank=True, max_length=10, null=True, verbose_name='Postcode')),
                ('preferred_language', models.CharField(choices=[('E', 'English'), ('F', 'French')], default='French', max_length=100, verbose_name='language')),
                ('groups', models.ManyToManyField(blank=True, help_text='The groups this user belongs to. A user will get all permissions granted to each of their groups.', related_name='user_set', related_query_name='user', to='auth.Group', verbose_name='groups')),
                ('user_permissions', models.ManyToManyField(blank=True, help_text='Specific permissions for this user.', related_name='user_set', related_query_name='user', to='auth.Permission', verbose_name='user permissions')),
            ],
            options={
                'verbose_name_plural': 'User Profile',
                'verbose_name': 'User Profile',
            },
            managers=[
                ('objects', django.contrib.auth.models.UserManager()),
            ],
        ),
        migrations.CreateModel(
            name='VerifyCode',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('code', models.CharField(max_length=10, verbose_name='Verification Code')),
                ('mobile', models.CharField(max_length=20, verbose_name='Phone Number')),
                ('add_time', models.DateField(default=datetime.datetime.now, verbose_name='Add Time')),
            ],
            options={
                'verbose_name_plural': 'Phone Verification Code',
                'verbose_name': 'Phone Verification Code',
            },
        ),
    ]
