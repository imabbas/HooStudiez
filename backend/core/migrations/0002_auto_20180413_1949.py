# -*- coding: utf-8 -*-
# Generated by Django 1.10 on 2018-04-13 19:49
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('core', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='course',
            name='days',
            field=models.CharField(default='', max_length=20),
        ),
    ]