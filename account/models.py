from django.db import models

# Create your models here.
class Member(models.Model):
    user_number = models.AutoField(db_column='User_number', primary_key=True)  # Field name made lowercase.
    user_name = models.CharField(db_column='User_name', max_length=20, blank=True, null=True)  # Field name made lowercase.
    user_id = models.CharField(db_column='User_id', max_length=20)  # Field name made lowercase.
    user_password = models.CharField(db_column='User_password', max_length=20)  # Field name made lowercase.

    class Meta:
        db_table = 'Member'

class Sourcecode(models.Model):
    user_number = models.OneToOneField(Member, models.DO_NOTHING, db_column='User_number', primary_key=True)  # Field name made lowercase.
    user_code = models.CharField(db_column='User_code', max_length=100)  # Field name made lowercase.
    code_date = models.DateField(blank=True, null=True)
    code_title = models.CharField(max_length=30, blank=True, null=True)
    process_time = models.FloatField(blank=True, null=True)

    class Meta:
        db_table = 'sourcecode'
