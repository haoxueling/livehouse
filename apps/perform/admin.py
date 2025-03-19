from django.contrib import admin

# Register your models here.
# Backend admin product management functions
from django.contrib import admin
from django.utils.safestring import mark_safe
from apps.common.models import Constant
from apps.perform.models import Booking, PerformType, PerformEvent
from apps.util.util import Util


@admin.register(Booking)  #Add the Booking class to the admin backend
class BookingAdmin(admin.ModelAdmin):
    # List display fields
    list_display = ['showTicketName', 'booking_date', 'total_price', 'is_used','quantity']

    search_fields = ['showTicketName']

    list_per_page = Constant.pageSizeAdmin

    fields = ["user", "ticket", 'payment_status', "total_price", "is_used", "quantity","bankname","banknum","qr_code"]

    readonly_fields = ["showImage", ]

    def showTicketName(self, obj):
        return obj.ticket.name

    showTicketName.short_description = 'Perform Event'

    def showImage(self, obj):
        try:
            image = mark_safe('<img src="%s" width="80px" />' % (obj.qr_code.url,))
        except Exception as e:
            image = ''
        return image

    showImage.short_description = "Image"

    def save_model(self, request, obj, form, change):
        if not change:
            # SAVE
            obj.booking_date = Util().getCurrentTime()
        super().save_model(request, obj, form, change)

    class Media:
        js = (
            '/static/kindeditor/kindeditor-all.js',
            '/static/kindeditor/lang/zh-CN.js',
            '/static/kindeditor/config.js',
        )


@admin.register(PerformType)  # Add the PerformType class to the backend admin management
class PerformTypeAdmin(admin.ModelAdmin):

    list_display = ['typename']

    search_fields = ['typename']

    list_per_page = Constant.pageSizeAdmin

    fields = ["typename"]


@admin.register(PerformEvent)  # Add the PerformEvent class to the backend admin management
class PerformEventAdmin(admin.ModelAdmin):

    list_display = ['name', 'showTypename', 'price', 'quantity','is_recommend','startTime','endTime']

    search_fields = ['name']

    list_per_page = Constant.pageSizeAdmin

    fields = ["name", "typeId", 'price', "showImage", "image", "content","quantity","startTime","endTime","is_recommend"]

    readonly_fields = ["showImage", ]

    list_filter = ("typeId",)

    def showTypename(self, obj):
        return obj.typeId.typename

    showTypename.short_description = 'Perform Type'

    def showImage(self, obj):
        try:
            image = mark_safe('<img src="%s" width="80px" />' % (obj.image.url,))
        except Exception as e:
            image = ''
        return image

    showImage.short_description = "Image"

    def save_model(self, request, obj, form, change):
        if not change:
            obj.createTime = Util().getCurrentTime()
        super().save_model(request, obj, form, change)

    class Media:
        js = (
            '/static/kindeditor/kindeditor-all.js',
            '/static/kindeditor/lang/zh-CN.js',
            '/static/kindeditor/config.js',
        )
