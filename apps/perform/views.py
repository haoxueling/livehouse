
from django.core.paginator import Paginator
from django.http import HttpResponse, JsonResponse
from django.shortcuts import render, redirect
from rest_framework.views import APIView

from apps.common.models import Constant
from apps.orderitem.models import Orderitem
from apps.perform.models import Booking, PerformType, PerformEvent, Interaction
from apps.product.models import Product
from apps.scorerecord.models import Scorerecord
from apps.type.models import Type
from apps.user.models import User
from apps.util.cfra.ItemCF import ItemCF
from apps.util.cfra.UserCF import UserCF
from apps.util.cfra.model.DataModel import DataModel



def index(request):
    products = Product.objects.all().order_by("-id")  # Get all products, in descending order of ids
    paginator = Paginator(products, Constant.pageSize)
    products = paginator.page(1)
    types = Type.objects.all()
    data = {
        "products": products,
        "types": types,
    }
    # Determine if a user is logged in
    if request.session.get(Constant.session_user_isLogin, None):
        # User is logged in
        # Currently logged in user id
        cUserid = request.session.get(Constant.session_user_id)
        print("Query all order details data")
        records = Orderitem.objects.all()
        # Construct a user-commodity purchase matrix
        dataModel = setDataModel(records)
        # User-based recommendations
        userCf = UserCF()
        # Calling the recommendation algorithm
        recommenderItemFinalDicBasedUser = userCf.recommend(dataModel, int(cUserid))
        if (recommenderItemFinalDicBasedUser is None) or (len(recommenderItemFinalDicBasedUser) == 0):
            recommenderItemFinalDicBasedUser = []
        # # Project-based recommendations
        itemCF = ItemCF()
        # Calling Recommendation Algorithms
        recommenderItemFinalDicBasedItem = itemCF.recommend(dataModel, int(cUserid))
        if (recommenderItemFinalDicBasedItem is None) or (len(recommenderItemFinalDicBasedItem) == 0):
            recommenderItemFinalDicBasedItem = []
        recommenderItemFinalList = recommenderItemFinalDicBasedUser + recommenderItemFinalDicBasedItem
        if recommenderItemFinalList is None or len(recommenderItemFinalList) == 0:
            # Collaborative filtering algorithms have no recommendation results for rating descending recommendations (also items not purchased by currently logged in users)
            print("Collaborative filtering algorithm has no recommendation results for product rating descending recommendation")
            sql = " select i.*,sum(o.score),count(i.id) from product i " \
                  " left join scorerecord o on o.productid = i.id " \
                  " where i.id not in " \
                  "     ( select oo.productid from orderitem oo " \
                  "         join `order` ooo on oo.orderid = ooo.id " \
                  "         where ooo.userid = " + str(cUserid) + " ) " \
                                                                  " group by i.id " \
                                                                  " order by sum(o.score) desc,count(i.id) desc " \
                                                                  " limit 0,5"
            # Find Recommended Results
            cfItems = Product.objects.raw(sql)
            data["cfProducts"] = cfItems
        else:
            # Find Recommended Results
            cfItems = getRecommendProducts(recommenderItemFinalList)
            data["cfProducts"] = cfItems
    # Hot recommendations are made regardless of whether the user is logged in or not
    # Recommended in descending order based on the number of favourites added
    sql = " select p.*,count(c.productid) from product as p " \
          "     join collection as c " \
          "     on p.id = c.productid " \
          "     group by c.productid " \
          "     order by count(c.productid) desc limit 0,5"
    hotProducts = Product.objects.raw(sql)
    data["hotProducts"] = hotProducts

    return render(request, "index/index.html", context=data)


# bookinglist
def bookingList(request):
    page = getRequest(request, "page", 1)
    user = getUserByRequest(request)
    bookings = Booking.objects.filter(user_id=user.id).order_by("-booking_date")
    paginator = Paginator(bookings, Constant.pageSize)
    bookings = paginator.page(page)
    print(bookings, 'bookings')
    result = []
    for booking in bookings:
        obj = {
            "booking": booking,
            "ticket": booking.ticket
        }
        result.append(obj)
    paginator = Paginator(result, Constant.pageSize)
    result = paginator.page(page)
    data = {
        "pageBean": result,
        "page": page,
    }
    return render(request, "perform/list.html", context=data)


def bookingDetail(request):
    booking_id = getRequest(request, "booking_id")
    user = getUserByRequest(request)
    bookings = Booking.objects.filter(user_id=user.id, id=booking_id).order_by("-booking_date")
    result = []
    for booking in bookings:
        obj = {
            "booking": booking,
            "ticket": booking.ticket
        }
        result.append(obj)
    data = {
        "bookings": result,
        "booking": bookings.first(),
        "ticket": bookings.first().ticket
    }
    return render(request, "perform/bookingItem.html", context=data)


# confirm
def confirm(request):
    ticket_id = getRequest(request, 'ticket_id')
    print(ticket_id, 'ticket_id')
    ticket = PerformEvent.objects.filter(id=ticket_id).first()
    moreTicket = ticket.quantity - ticket.volume
    data = {"ticket": ticket, "moreTicket": moreTicket}
    return render(request, "perform/confirm.html", context=data)


# booking pay
def pay(request):
    booking_id = getRequest(request, 'booking_id')
    booking = Booking.objects.filter(id=booking_id).first()
    ticket = booking.ticket
    moreTicket = ticket.quantity - ticket.volume
    data = {"booking": booking,
            "ticket": ticket,
            "moreTicket": moreTicket
            }
    return render(request, "perform/pay.html", context=data)


def deleteBooking(request):
    booking_id = getRequest(request, 'booking_id')
    booking = Booking.objects.filter(id=booking_id).first()
    booking.delete()
    result = {
        "success": 1,
        "url": '/perform/booking/list'
    }
    return JsonResponse(result)


def doPay(request):
    booking_id = getRequest(request, 'booking_id')
    bankname = getRequest(request, 'bankname')
    banknum = getRequest(request, 'banknum')
    user = getUserByRequest(request)
    booking = Booking.objects.filter(id=booking_id).first()
    success = 0
    url = "/perform/booking/list"
    if booking:
        booking.banknum = banknum
        booking.bankname = bankname
        booking.payment_status = 'paid'
        booking.save()
        event = booking.ticket
        event.volume += booking.quantity
        event.save()
        success = 1
    data = {
        "success": success,
        "url": url
    }
    return JsonResponse(data)


def addBooking(request):
    data = {}

# Constructing a User-Project Purchase Matrix
def setDataModel(records):
    dataModel = DataModel()
    for record in records:
        # Constructing a User-Project Purchase Matrix
        dataModel.setDataModel(record.userid_id, record.productid_id, 1.0)
    return dataModel


# Find Recommended Results
def getRecommendProducts(recommenderItemFinalDic):
    # Find Recommended Results
    if (recommenderItemFinalDic is not None) and (len(recommenderItemFinalDic) > 0):
        cfProductidsList = list()
        for cfProductid, pre in recommenderItemFinalDic:
            cfProductidsList.append(int(cfProductid))
        # Find Recommended Results
        return Product.objects.filter(id__in=cfProductidsList)
    else:
        return None


def getUserByRequest(request):
    user_id = request.session.get(Constant.session_user_id)
    return User.objects.filter(id=user_id).first()


def getRequest(request, key, defaultValue=None):
    method = request.method
    if method == "GET":
        return request.GET.get(key, defaultValue)
    if method == "POST":
        return request.POST.get(key, defaultValue)


def getPostData(request, key, defaultValue=None):
    if request.method == "POST" or request.method == "PUT":
        if key in request.data:
            return request.data[key]
        else:
            return defaultValue
    if request.method == "GET":
        return request.GET.get(key, defaultValue)


# eventList
def eventList(request):
    page = getRequest(request, "page", 1)
    keyword = getRequest(request, "keyword", "")
    typeId = getRequest(request, "typeid", "")
    types = PerformType.objects.all()
    products = None
    if keyword == "":
        if typeId == "":
            products = PerformEvent.objects.all().order_by("-createTime")
        else:
            typeId = int(typeId)

            products = PerformEvent.objects.filter(typeId_id=typeId).order_by("-createTime")
    else:
        if typeId == "":

            products = PerformEvent.objects.filter(productname__icontains=keyword).order_by("-createTime")
        else:
            typeId = int(typeId)

            products = PerformEvent.objects.filter(name__icontains=keyword, typeId_id=typeId).order_by("-createTime")
    paginator = Paginator(products, Constant.pageSize)
    products = paginator.page(page)
    data = {
        "pageBean": products,
        "types": types,
        "keyword": keyword,
        "typeid": typeId,
        "page": page,
    }
    return render(request, "perform/eventList.html", context=data)


# eventDetail
def eventDetail(request):
    productid = getRequest(request, 'productid')

    product = PerformEvent.objects.get(id=productid)

    relateProducts = PerformEvent.objects.filter(typeId_id=product.typeId_id).order_by("?")[:5]
    data = {
        "product": product,
        "relateProducts": relateProducts,
    }
    return render(request, "perform/eventDetail.html", context=data)


class InteractionView(APIView):
    """
    Interaction
    """

    def get(self, request):
        page = getRequest(request, "page", 1)
        events = PerformEvent.objects.all()
        firstEvent = events.first()
        selectedId = getRequest(request, 'selectedId', firstEvent.id)
        interactions = Interaction.objects.filter(target_id=selectedId)
        paginator = Paginator(interactions, Constant.pageSize)
        interactions = paginator.page(page)
        data = {
            "events": events,
            "pageBean": interactions,
            "page": page,
            "selectedId": int(selectedId)
        }
        return render(request, "perform/interaction.html", context=data)


def InteractionSubmit(request):
    user = getUserByRequest(request)
    content = getRequest(request, 'interactionContent', '')
    eventId = getRequest(request, 'eventId')
    event = PerformEvent.objects.filter(id=eventId).first()
    Interaction.objects.create(content=content, target=event, user=user)
    return redirect("/perform/interaction?selectedId=%s" % eventId)


class BookingView(APIView):
    """
    Booking
    """

    def post(self, request):
        user = getUserByRequest(request)
        result = {}
        if user is not None:
            ticket_id = getPostData(request, "ticket_id")
            ticket = PerformEvent.objects.filter(id=ticket_id).first()
            payment_status = getPostData(request, "payment_status", 'pending')
            total_price = getPostData(request, "total_price")
            count = getPostData(request, "count", 1)
            booking = Booking.objects.create(user=user, ticket=ticket, total_price=total_price,
                                             payment_status=payment_status, quantity=count)

            return redirect("/perform/booking/pay?booking_id=%s" % + booking.id)
        else:
            result = {
                "data": '',
                "msg": "Booking Failed！",
                "code": 400
            }
            return redirect("/perform/booking/pay")

    """
    use ticket
    """

    def put(self, request):
        book_id = getPostData(request, "book_id")
        booking = Booking.objects.filter(id=book_id).first()
        booking.is_used = True
        booking.save()
        result = {
            "200": 200,
            "data": booking
        }
        return JsonResponse(result)
