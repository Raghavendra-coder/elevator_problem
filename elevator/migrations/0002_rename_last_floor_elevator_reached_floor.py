# Generated by Django 4.2.3 on 2023-07-06 15:02

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('elevator', '0001_initial'),
    ]

    operations = [
        migrations.RenameField(
            model_name='elevator',
            old_name='last_floor',
            new_name='reached_floor',
        ),
    ]