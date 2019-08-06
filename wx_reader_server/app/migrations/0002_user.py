# Generated by Django 2.2.3 on 2019-07-31 01:10

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('app', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='User',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('tel', models.CharField(max_length=32)),
                ('password', models.CharField(max_length=512)),
                ('nickname', models.CharField(default='新用户', max_length=64, null=True)),
                ('headimg', models.CharField(default='', max_length=128, null=True)),
                ('desp', models.CharField(max_length=256, null=True)),
                ('signing', models.CharField(max_length=256, null=True)),
            ],
        ),
    ]