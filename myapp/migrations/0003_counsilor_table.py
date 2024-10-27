# Generated by Django 3.2.25 on 2024-10-18 09:20

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('myapp', '0002_auto_20241018_1215'),
    ]

    operations = [
        migrations.CreateModel(
            name='counsilor_table',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=100)),
                ('place', models.CharField(max_length=100)),
                ('phone', models.BigIntegerField()),
                ('email', models.CharField(max_length=100)),
                ('qualification', models.CharField(max_length=100)),
                ('LOGIN', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='myapp.login_table')),
            ],
        ),
    ]
