from django.db import models


# Create your models here.

class Notice(models.Model):
    title = models.CharField(max_length=255, blank=False, null=False, verbose_name="Title of notice")
    content = models.TextField(blank=False, null=False, verbose_name="Content of the notice")
    time = models.CharField(max_length=255, blank=False, null=False, verbose_name="Release time")

    # def __str__(self):
    #     return self.title


    class Meta:

        managed = False
        db_table = 'notice'  # Corresponding database tables
        verbose_name_plural = "notice"
        verbose_name = "notice"
