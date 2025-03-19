# Backend admin product management functions
from django.contrib import admin
from django.contrib.admin import SimpleListFilter
from django.utils.safestring import mark_safe
from apps.common.models import Constant
from apps.product.models import Product
from apps.type.models import Type
from apps.util.util import Util


@admin.register(Product)  # Add the product class to the backend admin management
class ProductAdmin(admin.ModelAdmin):

    list_display = ['productname', 'showTypename', 'price', 'createtime']

    search_fields = ['productname']

    list_per_page = Constant.pageSizeAdmin

    fields = ["productname", "typeid", 'price', "showImage", "image", "content"]

    readonly_fields = ["showImage", ]

    list_filter = ("typeid",)


    def showTypename(self, obj):
        return obj.typeid.typename


    showTypename.short_description = 'Surrounding Product Type'

    def showImage(self, obj):
        try:
            image = mark_safe('<img src="%s" width="80px" />' % (obj.image.url,))
        except Exception as e:
            image = ''
        return image

    showImage.short_description = "Image"


    def save_model(self, request, obj, form, change):
        if not change:

            obj.createtime = Util().getCurrentTime()
        super().save_model(request, obj, form, change)

    class Media:
        js = (
            '/static/kindeditor/kindeditor-all.js',
            '/static/kindeditor/lang/zh-CN.js',
            '/static/kindeditor/config.js',
        )
