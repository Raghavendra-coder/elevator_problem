# Generated by Django 4.2.3 on 2023-07-07 13:17

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('elevator', '0005_remove_destinationfloorrequest_elevator_request_and_more'),
    ]

    operations = [
        migrations.AddField(
            model_name='elevator',
            name='elevator_health',
            field=models.CharField(blank=True, choices=[('W', 'WORKING'), ('NW', 'NOT-WORKING'), ('UM', 'UNDER-MAINTAINACE')], default='W', max_length=2, null=True),
        ),
    ]
