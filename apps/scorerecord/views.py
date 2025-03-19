# Define the front-end scoring view module
from django.core.paginator import Paginator
from django.http import JsonResponse
from django.shortcuts import render
from apps.common.models import Constant
from apps.product.models import Product
from apps.scorerecord.models import Scorerecord
from apps.user.models import User
from apps.util.util import Util


# Add/modify scoring records
def doScorerecord(request):
    post = request.POST
    score = post.get("score")
    productid = post.get("productid")
    user = User()
    # Currently logged in user
    user.id = request.session[Constant.session_user_id]
    # Check if there is a scoring record
    records = Scorerecord.objects.filter(productid_id=productid, userid_id=user.id)
    scorerecord = None
    # If a scoring record already exists, make changes
    if len(records) > 0:
        scorerecord = records[0]
        scorerecord.score = score
        scorerecord.save()
    else:
        scorerecord = Scorerecord()
        product = Product()
        product.id = productid
        scorerecord.productid = product
        scorerecord.userid = user
        scorerecord.score = score
        scorerecord.createtime = Util().getCurrentTime()
        scorerecord.save()
    data = {
        "success": 1,
        "url": "reload"
    }
    return JsonResponse(data)


# Scoring list
def list(request):
    page = request.POST.get("page", 1)
    userid = request.session[Constant.session_user_id]
    scorerecords = Scorerecord.objects.filter(userid_id=userid).order_by("-id")
    paginator = Paginator(scorerecords, Constant.pageSize)
    scorerecords = paginator.page(page)
    data = {
        "pageBean": scorerecords,
        "page": page,
    }
    return render(request, "scorerecord/list.html", context=data)


# Delete scoring records
def delete(request):
    recordid = request.POST.get("recordid")
    userid = request.session.get(Constant.session_user_id)
    Scorerecord.objects.filter(userid_id=userid, id=recordid).delete()
    data = {
        "success": 1,
        "url": "reload"
    }
    return JsonResponse(data)
