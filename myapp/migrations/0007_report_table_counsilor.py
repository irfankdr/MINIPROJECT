# Generated by Django 3.2.25 on 2024-10-18 11:35

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('myapp', '0006_alter_report_table_report'),
    ]

    operations = [
        migrations.AddField(
            model_name='report_table',
            name='COUNSILOR',
            field=models.ForeignKey(default=1, on_delete=django.db.models.deletion.CASCADE, to='myapp.counsilor_table'),
            preserve_default=False,
        ),
    ]
