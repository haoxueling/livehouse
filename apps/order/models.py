# Define the order entity class
from django.db import models

from apps.common import contexts


class Order(models.Model):
    # user foreign key, userid is a user object
    # on_delete=None, # Behaviour of the current table and its associated field when deleting data from an associated table.
    # on_delete=models.CASCADE, # Delete the associated data, and the associated field is also deleted.
    # on_delete=models.DO_NOTHING, # Delete the associated data and do nothing.
    # on_delete=models.PROTECT, deletes associated data, raises ProtectedError
    # blank=False cannot be empty data
    # null=False Data cannot be null.
    # verbose_name Description of the field to be displayed by the list or editor.
    userid = models.ForeignKey('user.User', models.CASCADE,
                               db_column='userid', blank=False, null=False, verbose_name="User")
    # Total Price
    totalprice = models.CharField(max_length=255, blank=False, null=False, verbose_name="Total Price")
    # Name of bank
    bankname = models.CharField(max_length=255, blank=True, null=True, verbose_name="Name of bank")
    # Card Number
    banknum = models.CharField(max_length=255, blank=True, null=True, verbose_name="Card Number")
    # Phone
    phone = models.CharField(max_length=255, blank=True, null=True, verbose_name="Phone")
    # Address
    address = models.CharField(max_length=255, blank=True, null=True, verbose_name="Address")
    # Create Time
    createtime = models.CharField(max_length=255, blank=True, null=True, verbose_name="Create Time")
    # Pay Time
    paytime = models.CharField(max_length=255, blank=True, null=True, verbose_name="Pay Time")
    # Send Time
    sendtime = models.CharField(max_length=255, blank=True, null=True, verbose_name="Send Time")
    # Receive Time
    receivetime = models.CharField(max_length=255, blank=True, null=True, verbose_name="Receive Time")
    # Order status (1: unpaid, 2: paid, 3: dispatched, 4, received)
    state = models.IntegerField(blank=False, null=False,
                                verbose_name="Order Status", choices=contexts.shareOrderStateParamsList)

    class Meta:

        managed = False
        db_table = 'order'  # Corresponding database tables
        verbose_name_plural = "order"
        verbose_name = "order"
