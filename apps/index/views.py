# Frontend Home View Module
from django.core.paginator import Paginator
from django.shortcuts import render
from apps.common.models import Constant
from apps.orderitem.models import Orderitem
from apps.perform.models import PerformEvent, PerformType
from apps.product.models import Product
from apps.scorerecord.models import Scorerecord
from apps.type.models import Type
from apps.util.cfra.ItemCF import ItemCF
from apps.util.cfra.UserCF import UserCF
from apps.util.cfra.model.DataModel import DataModel


# index
def index(request):
    products = PerformEvent.objects.all().order_by("-createTime")  # Get all the shows, in descending order of createTime
    paginator = Paginator(products, Constant.pageSize)
    products = paginator.page(1)
    types = PerformType.objects.all()  # All types of performances
    data = {
        "products": products,
        "types": types,
    }
    cfProducts = PerformEvent.objects.filter(is_recommend=True).order_by("-createTime")[:5]
    data["cfProducts"] = cfProducts
    hotProducts = PerformEvent.objects.all().order_by("-volume")[:5]
    data["hotProducts"] = hotProducts
    return render(request, "perform/index.html", context=data)



def setDataModel(records):
    dataModel = DataModel()
    for record in records:

        dataModel.setDataModel(record.userid_id, record.productid_id, 1.0)
    return dataModel


# Find Recommended Results
def getRecommendProducts(recommenderItemFinalDic):
    # Find Recommended Results
    if (recommenderItemFinalDic is not None) and (len(recommenderItemFinalDic) > 0):
        cfProductidsList = list()
        for cfProductid, pre in recommenderItemFinalDic:
            cfProductidsList.append(int(cfProductid))
        # Query Recommended data
        return Product.objects.filter(id__in=cfProductidsList)
    else:
        return None
