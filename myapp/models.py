from django.db import models

# Create your models here.
class login_table(models.Model):
    username=models.CharField(max_length=100)
    password=models.CharField(max_length=100)
    type=models.CharField(max_length=100)

class student_table(models.Model):
    LOGIN=models.ForeignKey(login_table,on_delete=models.CASCADE)
    name=models.CharField(max_length=100)
    place=models.CharField(max_length=100)
    phone=models.BigIntegerField()
    email=models.CharField(max_length=100)
    image=models.FileField()
    standered = models.CharField(max_length=100)

class registration_table(models.Model):
    LOGIN=models.ForeignKey(login_table,on_delete=models.CASCADE)
    name=models.CharField(max_length=100)
    place=models.CharField(max_length=100)
    qualification=models.CharField(max_length=100)
    phone=models.BigIntegerField()
    email=models.CharField(max_length=100)
    image=models.FileField()
    idproof=models.FileField()


class teacher_table(models.Model):
    LOGIN = models.ForeignKey(login_table, on_delete=models.CASCADE)
    name = models.CharField(max_length=100)
    place = models.CharField(max_length=100)
    qualification = models.CharField(max_length=100)
    phone = models.BigIntegerField()
    email = models.CharField(max_length=100)
    image = models.FileField()
    idproof = models.FileField()
    standered=models.CharField(max_length=100)


class counsilor_table(models.Model):
    LOGIN=models.ForeignKey(login_table,on_delete=models.CASCADE)
    name=models.CharField(max_length=100)
    place=models.CharField(max_length=100)
    phone=models.BigIntegerField()
    email=models.CharField(max_length=100)
    qualification = models.CharField(max_length=100)
    image = models.FileField()

class feedback_table(models.Model):
    STUDENT=models.ForeignKey(student_table,on_delete=models.CASCADE)
    feedback=models.CharField(max_length=100)
    date=models.DateField()

class report_table(models.Model):
    COUNSILOR = models.ForeignKey(counsilor_table, on_delete=models.CASCADE)
    STUDENT=models.ForeignKey(student_table,on_delete=models.CASCADE)
    REGISTER=models.ForeignKey(registration_table,on_delete=models.CASCADE,blank=True, null=True)
    category = models.CharField(max_length=100)
    report = models.CharField(max_length=100)
    date = models.DateField()
    status=models.CharField(max_length=100)
    reply=models.CharField(max_length=100)



