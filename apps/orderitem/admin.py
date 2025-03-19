# Order Details Administrator Module
from django.contrib import admin
from apps.common.models import Constant
from apps.orderitem.models import Orderitem


@admin.register(Orderitem)  # Add the Orderitem class to the backend admin management
class OrderitemAdmin(admin.ModelAdmin):
    # List display fields
    list_display = ['id', 'showOrderid', 'productid', 'price', 'count', 'totalprice']

    search_fields = ['orderid__id', 'productid__productname']

    list_per_page = Constant.pageSizeAdmin
    # Edit the fields to be edited on the page
    fields = ['id', 'showOrderid', 'productid', 'price', 'count', 'totalprice']
    # Edit read-only fields on the page
    readonly_fields = ['id', 'showOrderid', 'productid', 'price', 'count', 'totalprice']

    def showOrderid(self, obj):
        return obj.orderid.id

    showOrderid.short_description = "Order ID"

    def has_add_permission(self, request):
        return False

    # Disable the delete action
    def has_delete_permission(self, request, obj=None):
        return False
