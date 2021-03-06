# -*- coding: utf-8 -*-
# Generated by Django 1.11.8 on 2019-03-15 11:29
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('app', '0003_auto_20190315_0640'),
    ]

    operations = [
        migrations.CreateModel(
            name='GOODs',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('productid', models.CharField(max_length=10)),
                ('productimg', models.CharField(max_length=100)),
                ('productname', models.CharField(max_length=100)),
                ('productlongname', models.CharField(max_length=100)),
                ('ads', models.CharField(max_length=100)),
                ('specifics', models.CharField(max_length=100)),
                ('price', models.FloatField()),
                ('marketprice', models.FloatField()),
                ('categoryname_1st', models.CharField(max_length=50)),
                ('categoryname_2st', models.CharField(max_length=50)),
                ('categoryname_3st', models.CharField(max_length=50)),
                ('storenums', models.IntegerField()),
                ('seller', models.CharField(max_length=50)),
                ('selleraddr', models.CharField(max_length=100)),
                ('sellername', models.CharField(max_length=50)),
            ],
            options={
                'db_table': 'goods_5',
            },
        ),
    ]
