# Backend admin Scoring function
from django.contrib import admin
from apps.common.models import Constant
from apps.scorerecord.models import Scorerecord
from apps.util.util import Util


# Scoring function class for backend admin
@admin.register(Scorerecord)  # Add the record class to the backend admin management
class ScorerecordAdmin(admin.ModelAdmin):

    list_display = ['showUsername', 'showproductname', 'score', 'createtime']

    list_display_links = ['showUsername', 'showproductname', ]

    search_fields = ['userid__username', 'productid__productname']

    list_per_page = Constant.pageSizeAdmin

    fields = ["userid", "productid", "score", "createtime"]

    readonly_fields = ["userid", "productid", "score", "createtime"]

    list_filter = ('score',)

    def showUsername(self, obj):
        return obj.userid.username

    showUsername.short_description = 'User'

    def showproductname(self, obj):
        return obj.productid.productname

    showproductname.short_description = 'ProductName'

    def has_add_permission(self, request):
        return False
