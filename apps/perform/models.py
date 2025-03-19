from django.db import models

from apps.user.models import User
from apps.util.util import Util

# Create your models here.

PAYMENT_STATUS_CHOICES = (
    ('pending', 'Pending'),
    ('paid', 'Paid'),
    ('failed', 'Failed'),
)


class Booking(models.Model):
    """
    Booking
    """
    id = models.BigAutoField(primary_key=True, verbose_name="ID")
    user = models.ForeignKey(User, on_delete=models.CASCADE, related_name='booking_user', verbose_name='User')
    ticket = models.ForeignKey(to="PerformEvent", on_delete=models.CASCADE, related_name='booking_ticket',
                               null=False, blank=False, verbose_name='Perform Event')
    booking_date = models.DateTimeField(auto_now_add=True, verbose_name='Booking Date')
    payment_status = models.CharField(max_length=50, choices=PAYMENT_STATUS_CHOICES, default='pending',
                                      verbose_name='Payment Status')
    total_price = models.DecimalField(max_digits=10, decimal_places=2, verbose_name='Total Price')
    is_used = models.BooleanField(default=False, verbose_name='Is_used')
    quantity = models.IntegerField(verbose_name="Quantity")
    # Bank Name
    bankname = models.CharField(max_length=255, blank=True, null=True, verbose_name="Bank Name")
    # Card Number
    banknum = models.CharField(max_length=255, blank=True, null=True, verbose_name="Card Number")

    qr_code = models.ImageField(upload_to=Util().upload_path_handler,
                                blank=False, null=False, verbose_name="QR Code")

    def __str__(self):
        return self.ticket.name

    class Meta:
        managed = True
        db_table = 'perform_booking'
        verbose_name = 'Perform Booking'
        verbose_name_plural = 'Perform Booking'


class PerformType(models.Model):
    typename = models.CharField(max_length=255, blank=False, null=False, verbose_name="TypeName")

    def __str__(self):
        return self.typename

    class Meta:
        managed = False
        db_table = 'perform_type'
        verbose_name_plural = "Perform Type"
        verbose_name = "Perform Type"


class PerformEvent(models.Model):
    # PerformEvent
    name = models.CharField(max_length=255, blank=False, null=False, verbose_name="Name")

    typeId = models.ForeignKey(to="PerformType", on_delete=models.CASCADE, related_name="event_type",
                               blank=False, null=False, verbose_name="PerformType")
    image = models.ImageField(upload_to=Util().upload_path_handler,
                              blank=False, null=False, verbose_name="Image")
    # price
    price = models.IntegerField(blank=False, null=False, verbose_name="Price")
    # content
    content = models.TextField(blank=False, null=False, verbose_name="Content")
    # CreateTime
    createTime = models.DateTimeField(auto_now=True, blank=False, null=False, verbose_name="CreateTime")

    quantity = models.IntegerField(blank=False, null=False, verbose_name="Quantity")

    startTime = models.DateTimeField(max_length=255, blank=False, null=False, verbose_name="StartTime")

    endTime = models.DateTimeField(max_length=255, blank=False, null=False, verbose_name="EndTime")

    is_recommend = models.BooleanField(blank=False, null=False, default=False, verbose_name="Is_recommend")

    volume = models.IntegerField(blank=False, null=False, verbose_name="Volume", default=0)

    def __str__(self):
        return self.name

    class Meta:

        managed = False
        db_table = 'perform_event'
        verbose_name_plural = "Perform Event"
        verbose_name = "Perform Event"


class Interaction(models.Model):
    """
    Interaction
    """
    title = models.CharField(max_length=255, blank=True, null=True, verbose_name="Title")
    content = models.TextField(blank=False, null=False, verbose_name="Content")
    target = models.ForeignKey(PerformEvent, on_delete=models.CASCADE, blank=True, null=True, verbose_name="Target")
    user = models.ForeignKey(User, on_delete=models.CASCADE,
                             db_column='userid', blank=False, null=False, verbose_name="User")
    createdTime = models.DateTimeField(auto_now=True, verbose_name="CreatedTime")

    def __str__(self):
        return self.content


    # def contentShort(self):
    #     if len(str(self.content)) > 30:
    #         return '{}...'.format(str(self.content)[0:30])
    #     else:
    #         return str(self.content)
    #
    # contentShort.short_description = "Interaction Content"

    class Meta:
        managed = True
        db_table = 'interaction'
        verbose_name_plural = "Interaction"
        verbose_name = verbose_name_plural
