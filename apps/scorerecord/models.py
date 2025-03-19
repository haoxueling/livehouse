# Define the scoring entity class
from django.db import models
from apps.product.models import Product


class Scorerecord(models.Model):
    # User
    userid = models.ForeignKey('user.User', models.CASCADE, db_column='userid',
                               blank=False, null=False, verbose_name="User")
    # Product
    productid = models.ForeignKey(Product, models.CASCADE, db_column='productid',
                                  blank=False, null=False, verbose_name="ProductName")
    # score
    score = models.CharField(max_length=255, blank=False, null=False, verbose_name="Score")
    # createtime
    createtime = models.CharField(max_length=255, blank=False, null=False, verbose_name="CreateTime")

    class Meta:
        managed = False
        db_table = 'scorerecord'
        verbose_name_plural = "ScoreRecord"
        verbose_name = "ScoreRecord"
