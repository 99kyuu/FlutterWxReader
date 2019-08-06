# Generated by Django 2.2.3 on 2019-07-27 15:19

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Book',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=128)),
                ('author', models.CharField(max_length=128)),
                ('rank', models.DecimalField(decimal_places=2, default=0.0, max_digits=4)),
                ('star', models.IntegerField(default=0)),
                ('fav', models.IntegerField(default=0)),
                ('brief', models.TextField(null=True)),
                ('originalPrice', models.DecimalField(decimal_places=2, max_digits=10)),
                ('price', models.DecimalField(decimal_places=2, max_digits=10)),
                ('content', models.TextField(null=True)),
                ('cateory', models.IntegerField(default=0)),
                ('cover', models.CharField(max_length=128, null=True)),
                ('ad', models.CharField(max_length=512, null=True)),
            ],
        ),
        migrations.CreateModel(
            name='BookComment',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('book', models.IntegerField(default=0)),
                ('content', models.TextField()),
                ('like', models.IntegerField(default=0)),
                ('author', models.TextField(default='匿名用户')),
            ],
        ),
        migrations.CreateModel(
            name='Category',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=32)),
                ('desp', models.CharField(max_length=256, null=True)),
            ],
        ),
        migrations.CreateModel(
            name='News',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('title', models.CharField(max_length=128)),
                ('brief', models.CharField(max_length=512, null=True)),
                ('content', models.TextField()),
                ('img', models.CharField(max_length=128)),
            ],
        ),
    ]