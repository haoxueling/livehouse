# Define the shopping cart entity class
from django.db import models


class Cart(models.Model):
    # user foreign key, userid is a user object
    # on_delete=None, # Behaviour of the current table and its associated field when deleting data from an associated table.
    # on_delete=models.CASCADE, # Delete the associated data, and the associated field is also deleted.
    # on_delete=models.DO_NOTHING, # Delete the associated data and do nothing.
    # on_delete=models.PROTECT, deletes associated data, raises ProtectedError
    # blank=False cannot be empty data
    # null=False Data cannot be null.
    # verbose_name Description of the field to be displayed by the list or editor.

    userid = models.ForeignKey('user.User', models.CASCADE, db_column='userid', blank=False, null=False)

    productid = models.ForeignKey('product.Product', models.CASCADE,
                                  db_column='productid', blank=False, null=False)

    count = models.IntegerField(blank=False, null=False)

    # Nested classes, the main purpose of which is to add some functionality to the parent class, or to specify some criteria
    class Meta:
        # The default value is True, when this option is True, Django can perform operations such as migrate or migrations, deletions, etc. on database tables.
        # If this option is False, it will not create or delete database tables. It can be used for existing tables, database views, etc. Other operations are the same.
        managed = False
        db_table = 'cart'  # Corresponding database tables
