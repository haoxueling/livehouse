# Define surrounding product type entity classes
from django.db import models


class Type(models.Model):
    # typename
    typename = models.CharField(max_length=255, blank=False, null=False, verbose_name="TypeName")

    def __str__(self):
        return self.typename

    class Meta:

        managed = False
        db_table = 'type'
        verbose_name_plural = "Surrounding Product Type"
        verbose_name = "Surrounding Product Type"
