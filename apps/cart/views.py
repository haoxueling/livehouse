# Frontend Shopping Cart View Module
from django.db.models import Count
from django.http import JsonResponse
from django.shortcuts import render
from apps.cart.models import Cart
from apps.common.models import Constant


# Add to Cart
def add(request):
    post = request.POST
    count = int(post.get("count", 1))  # Parameters, number of commodities
    productid = post.get("productid")  # Parameters, commodity primary key
    userid = request.session[Constant.session_user_id]  # Logged-in user primary key
    cart = Cart()
    cart.userid_id = userid
    cart.productid_id = productid
    # Query the shopping cart and update the number of items if duplicates are added.
    searchCart = Cart.objects.filter(productid_id=productid, userid_id=userid)
    if len(searchCart) > 0:
        searchCart[0].count = searchCart[0].count + count
        searchCart[0].save()  # save
    else:
        cart.count = count
        cart.save()  # save
    data = {  # Return parameters
        "success": 1,  # 1: Successful operation
        "url": "reload"  # Reload the requested page
    }
    return JsonResponse(data)


# Shopping Cart List
def list(request):
    userid = request.session[Constant.session_user_id]
    carts = Cart.objects.filter(userid_id=userid).order_by("-id")  # Find the current user's shopping cart, id descending
    data = {
        "carts": carts,
    }
    return render(request, "cart/list.html", context=data)


# of products edited in the shopping cart
def edit(request):
    post = request.POST
    cartid = post.get("cartid")
    count = post.get("count")
    cart = Cart.objects.get(id=cartid)  # Enquiry Cart
    tempCount = cart.count + int(count)
    if tempCount > 0:
        cart.count = tempCount
        cart.save()  # save
    data = {
        "success": 1,
        "url": "reload"
    }
    return JsonResponse(data)


# Shopping Cart Delete Product
def delete(request):
    post = request.POST
    cartid = post.get("cartid")
    Cart.objects.filter(id=cartid).delete()  # delete
    data = {
        "success": 1,
        "url": "reload"
    }
    return JsonResponse(data)


# of shopping cart items
def cartItemCount(request):
    userid = request.session[Constant.session_user_id]  # userid
    itemCount = Cart.objects.filter(userid_id=userid).aggregate(count=Count("id"))  # Aggregate queries
    data = {
        "cartItemCount": itemCount
    }
    return JsonResponse(data)
