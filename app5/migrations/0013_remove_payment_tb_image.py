# Generated by Django 4.1.3 on 2022-12-16 04:18

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('app5', '0012_log_tb_hashpass'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='payment_tb',
            name='image',
        ),
    ]
