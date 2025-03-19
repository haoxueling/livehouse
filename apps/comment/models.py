# Define the comment entity class
from django.db import models


class Comment(models.Model):
    # Content of comments
    content = models.TextField(max_length=255, blank=False, null=False, verbose_name="Comments")
    # user foreign key, userid is a user object
    # on_delete=None, # Behaviour of the current table and its associated field when deleting data from an associated table.
    # on_delete=models.CASCADE, # Delete the associated data, and the associated field is also deleted.
    # on_delete=models.DO_NOTHING, # Delete the associated data and do nothing.
    # on_delete=models.PROTECT, deletes associated data, raises ProtectedError
    # blank=False cannot be empty data
    # null=False Data cannot be null.
    # verbose_name Description of the field to be displayed by the list or editor.
    userid = models.ForeignKey('user.User', models.CASCADE,
                               db_column='userid', blank=False, null=False, verbose_name="Username")

    productid = models.ForeignKey('product.Product', models.CASCADE,
                                  db_column='productid', blank=False, null=False, verbose_name="Productname")
    createtime = models.CharField(max_length=255, blank=False,
                                  null=False, verbose_name="AddTime")


    def __str__(self):
        return self.content


    def contentShort(self):
        if len(str(self.content)) > 30:
            return '{}...'.format(str(self.content)[0:30])
        else:
            return str(self.content)


    contentShort.short_description = "Comments"


    class Meta:

        managed = False
        db_table = 'comment'  # Corresponding database tables
        verbose_name_plural = "comment"
        verbose_name = "comment"
