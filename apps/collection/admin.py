# Backend admin favourites function
from django.contrib import admin
from apps.collection.models import Collection
from apps.common.models import Constant
from apps.util.util import Util


# Collections feature class for backend admin
@admin.register(Collection)  # Add the collection class to the backend admin management
class CollectionAdmin(admin.ModelAdmin):
    # List display fields
    list_display = ['showUsername', 'showProductname', 'createtime']
    # Add links to list display fields (disabled, no modifications allowed)
    list_display_links = None
    # Search box fields on page table page, fuzzy search, username, product name
    search_fields = ['userid__username', 'productid__productname']
    # of articles displayed per page
    list_per_page = Constant.pageSizeAdmin

    # List display page, some fields need to be formatted or show some attributes of the foreign key, user foreign key username
    def showUsername(self, obj):
        return obj.userid.username

    # Set the title of the field to be displayed
    showUsername.short_description = 'Username'


    def showProductname(self, obj):
        return obj.productid.productname


    showProductname.short_description = 'Productname'


    def has_add_permission(self, request):
        return False
