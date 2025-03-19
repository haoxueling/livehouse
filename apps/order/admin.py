# Order function class in backend admin
from django.contrib import admin, messages
from django.contrib.admin import SimpleListFilter
from django.utils.safestring import mark_safe

from apps.common import contexts
from apps.common.models import Constant
from apps.order.models import Order
from apps.orderitem.models import Orderitem

# 订单状态过滤器，这是自定义订单列表页面中的过滤
from apps.util.util import Util


# Order status filter, this is the custom order list page in the filter
# Custom order status filter class, mainly in the order list page can be queried by order status
class StateFilter(SimpleListFilter):
    title = 'Order Status'
    parameter_name = 'state'

    def lookups(self, request, model_admin):
        return contexts.shareOrderStateParamsList

    def queryset(self, request, queryset):
        if self.value():
            return queryset.filter(state=self.value())


@admin.register(Order)  # Add Order class to backend admin management
class OrderAdmin(admin.ModelAdmin):
    # List Display Fields
    list_display = ['id', 'userid', 'phone', 'totalprice', 'createtime', 'showState']

    search_fields = ['userid__username']

    list_per_page = Constant.pageSizeAdmin
    # Edit the fields to be edited on the page
    fields = ["id", "userid", "totalprice", 'bankname',
              "banknum", 'phone', "address", 'createtime',
              "paytime", 'sendtime', "receivetime", 'state', "showOrderitem"]
    # Edit read-only fields on the page
    readonly_fields = ["id", "userid", "totalprice", 'bankname',
                       "banknum", 'phone', "address", 'createtime',
                       "paytime", 'sendtime', "receivetime", "showOrderitem"]
    # Filter fields on the list page
    list_filter = (StateFilter,)
    # Rewrite the list page to remove the delete action
    actions = ['delete_selected']


    def showState(self, obj):
        if obj.state:
            return contexts.shareOrderStateParamsDic[obj.state]

    # Set the title of the field to be displayed
    showState.short_description = "Order Status"

    # On the order details page, display a list of order details, implemented by spelling html
    def showOrderitem(self, obj):
        html = ""
        try:
            orderitems = Orderitem.objects.filter(orderid_id=obj.id)
            if orderitems and len(orderitems) > 0:
                html += "<table>"
                html += "<tr>"
                html += "<th>Order Details ID</th>"
                html += "<th>Name</th>"
                html += "<th>Price</th>"
                html += "<th>Number</th>"
                html += "<th>Total price</th>"
                html += "</tr>"
                for orderitem in orderitems:
                    html += "<tr>"
                    html += "<td>%s</td>" % orderitem.id
                    html += "<td>%s</td>" % orderitem.productid.productname
                    html += "<td>%s</td>" % orderitem.price
                    html += "<td>%s</td>" % orderitem.count
                    html += "<td>%s</td>" % orderitem.totalprice
                    html += "</tr>"
                html += "</table>"
                html = mark_safe(html)
        except Exception as e:
            html = ''
        return html

    showOrderitem.short_description = "Order Details"

    def save_model(self, request, obj, form, change):
        if change:
            # save
            # Determine if the username already exists
            newState = obj.state
            oldOrder = Order.objects.get(id=obj.id)
            if oldOrder.state == 4:
                messages.error(request, "Operation failed! The order has been received!")
                messages.set_level(request, messages.ERROR)
            else:
                if oldOrder.state == 3:
                    messages.error(request, "Operation failed! The order has been shipped!")
                    messages.set_level(request, messages.ERROR)
                else:
                    if oldOrder.state == 1:
                        messages.error(request, "Operation failed! The order was not paid!")
                        messages.set_level(request, messages.ERROR)
                    else:
                        if oldOrder.state == 2:
                            if newState == 3:
                                obj.sendtime = Util().getCurrentTime()
                                super().save_model(request, obj, form, change)
                            else:
                                messages.error(request, "The operation failed!")
                                messages.set_level(request, messages.ERROR)
                        else:
                            messages.error(request, "The operation failed!")
                            messages.set_level(request, messages.ERROR)

    # Rewrite the delete action
    def delete_selected(modeladmin, request, queryset):
        c = 0
        for i in queryset:
            state = i.state
            if state == 1:
                i.delete()
                c += 1
        msg = None
        if c > 0:
            msg = 'Successfully deleted {} orders!'.format(c)
        else:
            msg = 'The operation failed! Only [Unpaid] orders can be deleted!'
        modeladmin.message_user(request, msg)

    delete_selected.short_description = 'Delete the selected  order'


    def has_add_permission(self, request):
        return False
