# Generated by Django 4.1.3 on 2022-11-28 04:45

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('app5', '0009_alter_payment_tb_time'),
    ]

    operations = [
        migrations.CreateModel(
            name='order_tb',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=255)),
                ('offprice', models.CharField(max_length=255)),
                ('status', models.CharField(max_length=255)),
                ('totalamount', models.CharField(max_length=255)),
            ],
        ),
    ]
