# Frontend order view module
from django.core.paginator import Paginator
from django.http import JsonResponse
from django.shortcuts import render, redirect
from apps.cart.models import Cart
from apps.common.models import Constant
from apps.order.models import Order
from apps.orderitem.models import Orderitem
from apps.product.models import Product
from apps.util.util import Util


# Confirmation of orders
def confirm(request):
    post = request.POST
    paramFlag = post.get("paramFlag", "")  # Determine whether to buy directly or from a shopping cart
    userid = request.session[Constant.session_user_id]  # userid
    carts = []
    data = {}
    if paramFlag == "cart":
        carts = Cart.objects.filter(userid_id=userid)  # Find the current user's shopping cart, id descending
        data["paramFlag"] = paramFlag
        if len(carts) == 0:
            return redirect('/cart/list')
    else:
        productid = post.get("productid")
        count = post.get("count", 1)
        cart = Cart()
        cart.productid_id = productid
        cart.count = int(count)
        carts.append(cart)
    data["carts"] = carts
    return render(request, "order/confirm.html", context=data)



# Add orders
def add(request):
    post = request.POST
    paramFlag = post.get("paramFlag", "")  # Determine whether to buy directly or from a shopping cart
    address = post.get("address")
    phone = post.get("phone")
    userid = request.session[Constant.session_user_id]
    carts = []
    if paramFlag == "cart":
        carts = Cart.objects.filter(userid_id=userid)
        if len(carts) == 0:
            return redirect('/cart/list')
    else:
        productid = post.get("productid")
        count = post.get("count", 1)
        cart = Cart()
        product = Product.objects.get(id=productid)
        cart.productid = product
        cart.count = int(count)
        carts.append(cart)
    order = Order()
    order.userid_id = userid
    order.createtime = Util().getCurrentTime()
    order.address = address
    order.phone = phone
    order.state = 1
    order.save()  # order save
    totalPrice = 0
    # Save order details
    for cart in carts:
        orderitem = Orderitem()
        orderitem.orderid = order
        orderitem.userid_id = userid
        orderitem.count = cart.count
        orderitem.price = cart.productid.price
        orderitem.productid = cart.productid
        orderitem.totalprice = float(orderitem.price) * int(orderitem.count)
        totalPrice += float(orderitem.totalprice)
        orderitem.save()
    order.totalprice = totalPrice
    order.save()
    if paramFlag == "cart":
        carts.delete()
    return redirect("/order/pay?orderid=%s" % +order.id)


# Jump to pay order page
def pay(request):
    orderid = request.GET.get("orderid")
    userid = request.session[Constant.session_user_id]
    order = Order.objects.get(id=orderid, userid_id=userid, state=1)  # Enquire about orders
    data = {}
    if order:
        orderitems = Orderitem.objects.filter(orderid_id=orderid)  # Check order details
        data["order"] = order
        data["orderitems"] = orderitems
    return render(request, "order/pay.html", context=data)


# Payment of orders
def doPay(request):
    orderid = request.POST.get("orderid")
    bankname = request.POST.get("bankname")
    banknum = request.POST.get("banknum")
    userid = request.session[Constant.session_user_id]
    order = Order.objects.get(id=orderid, userid_id=userid, state=1)
    success = 0
    url = "/order/list"
    if order:
        order.banknum = banknum
        order.bankname = bankname
        order.state = 2
        order.paytime = Util().getCurrentTime()
        order.save()  # save
        success = 1
    data = {
        "success": success,
        "url": url
    }
    return JsonResponse(data)


# Order List
def list(request):
    page = request.POST.get("page", 1)
    userid = request.session[Constant.session_user_id]
    orders = Order.objects.filter(userid_id=userid).order_by("-id")  # Find the current user's order record, id descending
    paginator = Paginator(orders, Constant.pageSize)
    orders = paginator.page(page)
    data = {
        "pageBean": orders,
        "page": page,
    }
    return render(request, "order/list.html", context=data)


# Delete Order
def delete(request):
    orderid = request.POST.get("orderid")
    userid = request.session[Constant.session_user_id]
    order = Order.objects.get(id=orderid, userid_id=userid, state=1)
    success = 0
    if order:
        order.delete()  # Delete Order
        success = 1
    data = {
        "success": success,
        "url": "/order/list"
    }
    return JsonResponse(data)


# receive
def receive(request):
    orderid = request.POST.get("orderid")
    order = Order.objects.get(id=orderid)
    success = 0
    if order and order.state == 3:
        order.state = 4
        order.receivetime = Util().getCurrentTime()
        order.save()  # save
        success = 1
    data = {
        "success": success,
        "url": "reload"
    }
    return JsonResponse(data)
