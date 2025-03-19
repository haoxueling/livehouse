
from django.core.paginator import Paginator
from django.db.models import Count, Sum
from django.shortcuts import render
from apps.collection.models import Collection
from apps.comment.models import Comment
from apps.common.models import Constant
from apps.orderitem.models import Orderitem
from apps.product.models import Product
from apps.scorerecord.models import Scorerecord
from apps.type.models import Type
from apps.util.scoreanalysisutil import ScoreAnalysis, CurScoreAnalysis


# product detail
def detail(request):
    # The product id is obtained by get request, which is a jump to the product detail page from other pages.
    # The product id is obtained by post request, which is a request for favourites, ratings, comments and pagination on the product details page.
    productid = request.GET.get("productid", request.POST.get("productid"))

    product = Product.objects.get(id=productid)

    relateProducts = Product.objects.filter(typeid_id=product.typeid_id).order_by("?")[:5]
    # of added favourites for the current product
    collectionCount = Collection.objects.filter(productid=productid).aggregate(count=Count("id"))
    # of current items purchased
    orderitemCount = Orderitem.objects.filter(productid=productid).aggregate(sum=Sum("count"))
    data = {
        "product": product,
        "relateProducts": relateProducts,
        "collectionCount": collectionCount,
        "orderitemCount": orderitemCount,
    }
    page = request.POST.get("page", 1)
    comments = Comment.objects.filter(productid=productid).order_by("-id")  # Query comments, id descending
    paginator = Paginator(comments, Constant.pageSize)
    comments = paginator.page(page)
    data["pageBean"] = comments
    data["page"] = page
    # Determine if a user is logged in
    if Constant.session_user_isLogin in request.session \
            and request.session[Constant.session_user_isLogin]:
        userid = request.session[Constant.session_user_id]
        # Get whether the logged in user has favourited the current product
        collection = Collection.objects.filter(userid=userid, productid=productid)
        if len(collection) > 0:
            data["collection"] = collection[0]
        # Get whether the logged in user has rated the current music
        scorerecord = Scorerecord.objects.filter(userid=userid, productid=productid)
        if len(scorerecord) > 0:
            data["scorerecord"] = scorerecord[0]
    # scoreAnalysis
    scoreAnalysis = ScoreAnalysis()
    # Query total ratings and number of ratings for music
    scoreCountDict = Scorerecord.objects.filter(productid=productid). \
        aggregate(count=Count("id"), totalscore=Sum("score"))
    # scoreCount
    scoreAnalysis.scoreCount = scoreCountDict["count"]
    # sumScore
    scoreAnalysis.sumScore = scoreCountDict["totalscore"]
    # avgScore
    scoreAnalysis.avgScore = scoreAnalysis.setAvgScore()

    curScoreAnalysisList = []
    # Iterate queries based on rating scores
    for i in [5, 4, 3, 2, 1]:
        curScoreAnalysis = CurScoreAnalysis()
        scoreCountDictTemp = Scorerecord.objects.filter(productid=productid, score=i). \
            aggregate(count=Count("id"), totalscore=Sum("score"))
        curScoreAnalysis.curScore = i
        curScoreAnalysis.scoreCount = scoreAnalysis.scoreCount
        curScoreAnalysis.percent = curScoreAnalysis.setPercent(scoreCountDictTemp["count"])
        curScoreAnalysisList.append(curScoreAnalysis)
    scoreAnalysis.curScoreAnalysisList = curScoreAnalysisList
    data["scoreAnalysis"] = scoreAnalysis
    return render(request, "product/detail.html", context=data)


# Product List
def list(request):
    page = request.POST.get("page", 1)
    keyword = request.POST.get("keyword", "")
    typeid = request.POST.get("typeid", "")
    types = Type.objects.all()
    products = None
    if keyword == "":
        if typeid == "":
            products = Product.objects.all().order_by("-id")
        else:
            typeid = int(typeid)
            # Query with performance surrounding type parameter, sorted by id in descending order
            products = Product.objects.filter(typeid_id=typeid).order_by("-id")
    else:
        if typeid == "":
            # Query with product name parameter, sorted by id in descending order
            products = Product.objects.filter(productname__icontains=keyword).order_by("-id")
        else:
            typeid = int(typeid)
            # Query with parameters of performance surrounding type and product name, sorted by id in descending order
            products = Product.objects.filter(productname__icontains=keyword, typeid_id=typeid).order_by("-id")
    paginator = Paginator(products, Constant.pageSize)
    products = paginator.page(page)
    data = {
        "pageBean": products,
        "types": types,
        "keyword": keyword,
        "typeid": typeid,
        "page": page,
    }
    return render(request, "product/list.html", context=data)
