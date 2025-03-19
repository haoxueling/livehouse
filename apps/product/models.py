# Define product entity classes
from django.db import models

from apps import common
from apps.util.util import Util


class Product(models.Model):
    # productname
    productname = models.CharField(max_length=255, blank=False, null=False, verbose_name="ProductName")

    typeid = models.ForeignKey('type.Type', models.CASCADE,
                               db_column='typeid', blank=False, null=False, verbose_name="Type")
    # image = models.CharField(max_length=255, blank=True, null=True)

    image = models.ImageField(upload_to=Util().upload_path_handler,
                              blank=False, null=False, verbose_name="Image")
    # price
    price = models.IntegerField(blank=False, null=False, verbose_name="Price")
    # content
    content = models.TextField(blank=False, null=False, verbose_name="Content")
    # createtime
    createtime = models.CharField(max_length=255, blank=False, null=False, verbose_name="CreateTime")

    def __str__(self):
        return self.productname

    class Meta:

        managed = False
        db_table = 'product'
        verbose_name_plural = "Surrounding Product"
        verbose_name = "Surrounding Product"
