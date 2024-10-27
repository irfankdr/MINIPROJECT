# Generated by Django 3.2.25 on 2024-10-21 10:05

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('myapp', '0014_alter_report_table_register'),
    ]

    operations = [
        migrations.CreateModel(
            name='teacher_table',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=100)),
                ('place', models.CharField(max_length=100)),
                ('qualification', models.CharField(max_length=100)),
                ('phone', models.BigIntegerField()),
                ('email', models.CharField(max_length=100)),
                ('image', models.FileField(upload_to='')),
                ('idproof', models.FileField(upload_to='')),
                ('type', models.CharField(max_length=100)),
                ('standered', models.CharField(max_length=100)),
                ('LOGIN', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='myapp.login_table')),
            ],
        ),
    ]
