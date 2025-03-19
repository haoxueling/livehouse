# Front-end order detail view module
from django.shortcuts import render
from apps.common.models import Constant
from apps.order.models import Order
from apps.orderitem.models import Orderitem
from apps.scorerecord.models import Scorerecord


# Order details list
def list(request):
    orderid = request.GET.get("orderid")
    userid = request.session[Constant.session_user_id]  # userid
    orderitems = Orderitem.objects.filter(orderid_id=orderid)
    order = Order.objects.get(id=orderid)  # Enquire about orders
    data = {
        "orderitems": orderitems,
        "order": order,
    }
    return render(request, "orderitem/list.html", context=data)
