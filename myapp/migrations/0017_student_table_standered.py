# Generated by Django 3.2.25 on 2024-10-21 10:53

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('myapp', '0016_auto_20241021_1549'),
    ]

    operations = [
        migrations.AddField(
            model_name='student_table',
            name='standered',
            field=models.CharField(default=1, max_length=100),
            preserve_default=False,
        ),
    ]
