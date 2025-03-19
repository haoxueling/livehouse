# Define the order details entity class
from django.db import models

from apps.order.models import Order


class Orderitem(models.Model):
    # Order foreign key, orderid is an order object
    orderid = models.ForeignKey(Order, models.CASCADE,
                                db_column='orderid', blank=False, null=False, verbose_name="OrderID")

    productid = models.ForeignKey('product.Product', models.CASCADE,
                                  db_column='productid', blank=False, null=False, verbose_name="Name")
    userid = models.ForeignKey('user.User', models.CASCADE,
                               db_column='userid', blank=False, null=False, verbose_name="User")
    # price
    price = models.CharField(max_length=255, blank=False, null=False, verbose_name="Price")
    # Count
    count = models.CharField(max_length=255, blank=False, null=False, verbose_name="Count")
    # Total Price
    totalprice = models.CharField(max_length=255, blank=False, null=False, verbose_name="Total Price")

    class Meta:

        managed = False
        db_table = 'orderitem'  # database table
        verbose_name_plural = "Order Details"
        verbose_name = "Order Details"
