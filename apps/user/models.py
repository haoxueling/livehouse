# Frontend user entity class
from django.core import validators
from django.db import models
from apps import user
from apps.util.util import Util


class User(models.Model):
    # Setting null=True only means that the field can be empty in the database.
    # But you still need to enter the value when you add data using the backend management, because Django automatically does data validation and does not allow the field to be empty.
    # If you want to save the field as null in Django, you need to add another parameter: blank=True.
    username = models.CharField(max_length=255, blank=False, null=False, verbose_name="UserName")
    password = models.CharField(max_length=255, blank=False, null=False, verbose_name="Password")
    email = models.CharField(max_length=255, blank=False, null=False,
                             validators=[validators.EmailValidator(message="The mailbox is not formatted correctly!")], verbose_name="Email")
    # header = models.CharField(max_length=255, blank=True, null=True)
    header = models.ImageField(upload_to=Util().upload_path_handler
                               , blank=True, null=False, verbose_name="Image")
    createtime = models.CharField(max_length=50, blank=False, null=False, verbose_name="CreateTime")

    def __str__(self):
        return self.username

    class Meta:

        managed = False
        db_table = 'user'
        verbose_name_plural = "User"
        verbose_name = "User"
