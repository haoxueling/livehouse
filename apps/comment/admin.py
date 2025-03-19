# Backend admin comment function
from django.contrib import admin
from apps.comment.models import Comment
from apps.common.models import Constant
from apps.util.util import Util


# Comment function class for backend admin
@admin.register(Comment)  # Add the comment class to the backend admin management
class CommentAdmin(admin.ModelAdmin):
    # List display fields
    list_display = ['showUsername', 'showproductname', 'contentShort', 'createtime']
    # Add links to list display fields (jump to detail or moderation pages)
    list_display_links = ['showUsername', 'showproductname', 'contentShort', ]
    # Search box field on list page, fuzzy search: username, product name
    search_fields = ['userid__username', 'productid__productname']
    # of articles displayed per page
    list_per_page = Constant.pageSizeAdmin
    # Edit the fields to be edited on the page
    fields = ["userid", "productid", "content", 'createtime']
    # Edit page read-only fields
    readonly_fields = ["userid", "productid", "content", 'createtime']


    def showUsername(self, obj):
        return obj.userid.username

    # Set the title of the field to be displayed
    showUsername.short_description = 'Username'


    def showproductname(self, obj):
        return obj.productid.productname

    # Set the title of the field to be displayed
    showproductname.short_description = 'productname'


    def has_add_permission(self, request):
        return False
