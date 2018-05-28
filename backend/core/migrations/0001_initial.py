# -*- coding: utf-8 -*-
# Generated by Django 1.10 on 2018-04-13 19:11
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Course',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('professor', models.CharField(max_length=100)),
                ('name', models.CharField(max_length=250)),
                ('type', models.CharField(max_length=20)),
                ('units', models.CharField(max_length=10)),
                ('section', models.CharField(max_length=5)),
                ('days', models.CharField(max_length=10)),
                ('start_time', models.TimeField(blank=True, null=True)),
                ('end_time', models.TimeField(blank=True, null=True)),
                ('room', models.CharField(max_length=100)),
                ('dpt', models.CharField(max_length=5)),
                ('num', models.CharField(max_length=5)),
                ('sis_num', models.CharField(max_length=5)),
                ('building', models.CharField(max_length=250)),
            ],
        ),
    ]