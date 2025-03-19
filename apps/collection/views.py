# Frontend Collection View Module
from django.core.paginator import Paginator
from django.http import JsonResponse
from django.shortcuts import render

from apps.collection.models import Collection
from apps.common.models import Constant
from apps.product.models import Product
from apps.user.models import User


from apps.util.util import Util


# Add/remove Collection
def doCollection(request):
    post = request.POST
    productid = post.get("productid")
    userid = request.session[Constant.session_user_id]  # Get the id of the currently logged in user from session
    collection = Collection.objects.filter(productid=productid, userid=userid)  # Find Collection
    if len(collection) > 0:
        collection.delete()  # If collection exists, then delete
    else:
        collection = Collection()
        collection.userid_id = userid
        collection.productid_id = productid
        collection.createtime = Util().getCurrentTime()
        collection.save()  # Add a collection
    data = {
        "success": 1,
        "url": "reload"
    }
    return JsonResponse(data)


# collection list
def list(request):
    page = request.POST.get("page", 1)
    userid = request.session[Constant.session_user_id]
    collections = Collection.objects.filter(userid_id=userid).order_by("-id")  # Find current user's collection, id descending
    paginator = Paginator(collections, Constant.pageSize)
    collections = paginator.page(page)
    data = {
        "pageBean": collections,
        "page": page,
    }
    return render(request, "collection/list.html", context=data)
