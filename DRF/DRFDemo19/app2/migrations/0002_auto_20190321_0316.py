# -*- coding: utf-8 -*-
# Generated by Django 1.11.4 on 2019-03-21 03:16
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('app2', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='user',
            name='u_name',
            field=models.CharField(max_length=100, unique=True),
        ),
    ]
