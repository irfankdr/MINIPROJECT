# Generated by Django 3.2.25 on 2024-10-18 11:30

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('myapp', '0005_report_table'),
    ]

    operations = [
        migrations.AlterField(
            model_name='report_table',
            name='report',
            field=models.CharField(max_length=100),
        ),
    ]
