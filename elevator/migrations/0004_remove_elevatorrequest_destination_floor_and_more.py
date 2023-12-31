# Generated by Django 4.2.3 on 2023-07-07 05:06

from django.db import migrations, models
import django.db.models.deletion
import django.utils.timezone
import uuid


class Migration(migrations.Migration):

    dependencies = [
        ('elevator', '0003_remove_elevatorrequest_floor_and_more'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='elevatorrequest',
            name='destination_floor',
        ),
        migrations.AddField(
            model_name='elevator',
            name='availability',
            field=models.CharField(blank=True, choices=[('A', 'Available'), ('B', 'Busy')], default='A', max_length=1, null=True),
        ),
        migrations.AddField(
            model_name='elevator',
            name='created_at',
            field=models.DateTimeField(auto_now_add=True, default=django.utils.timezone.now),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name='elevator',
            name='updated_by',
            field=models.DateTimeField(auto_now=True),
        ),
        migrations.AddField(
            model_name='elevatorrequest',
            name='created_at',
            field=models.DateTimeField(auto_now_add=True, default=django.utils.timezone.now),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name='elevatorrequest',
            name='updated_by',
            field=models.DateTimeField(auto_now=True),
        ),
        migrations.AddField(
            model_name='floor',
            name='created_at',
            field=models.DateTimeField(auto_now_add=True, default=django.utils.timezone.now),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name='floor',
            name='updated_by',
            field=models.DateTimeField(auto_now=True),
        ),
        migrations.AlterField(
            model_name='elevator',
            name='door_status',
            field=models.CharField(blank=True, choices=[('O', 'Open'), ('C', 'Closed')], default='C', max_length=1, null=True),
        ),
        migrations.CreateModel(
            name='DestinationFloorRequest',
            fields=[
                ('id', models.UUIDField(default=uuid.uuid4, primary_key=True, serialize=False)),
                ('created_at', models.DateTimeField(auto_now_add=True)),
                ('updated_by', models.DateTimeField(auto_now=True)),
                ('destination_floor', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, related_name='destination', to='elevator.floor')),
                ('elevator_request', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, related_name='destinations', to='elevator.elevatorrequest')),
            ],
        ),
    ]
