# Generated by Django 3.2.25 on 2024-10-21 06:31

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('myapp', '0013_report_table_register'),
    ]

    operations = [
        migrations.AlterField(
            model_name='report_table',
            name='REGISTER',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='myapp.registration_table'),
        ),
    ]