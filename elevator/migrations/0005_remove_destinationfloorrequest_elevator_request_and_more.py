# Generated by Django 4.2.3 on 2023-07-07 06:57

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('elevator', '0004_remove_elevatorrequest_destination_floor_and_more'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='destinationfloorrequest',
            name='elevator_request',
        ),
        migrations.AddField(
            model_name='destinationfloorrequest',
            name='elevator',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, related_name='destinations', to='elevator.elevator'),
        ),
    ]
