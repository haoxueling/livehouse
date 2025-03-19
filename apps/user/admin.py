# Define admin front-end user functions
from django.contrib import admin, messages
from django.utils.safestring import mark_safe
from WebShopRSMPython import settings
from apps.common.models import Constant
from apps.user.models import User
from apps.util.util import Util


# admin.site.register(User)
@admin.register(User)
class UserAdmin(admin.ModelAdmin):

    list_display = ['username', 'email', 'createtime']

    search_fields = ['username']

    list_per_page = Constant.pageSizeAdmin

    fields = ["username", "email", "showHeader", 'header']

    readonly_fields = ('showHeader',)

    actions = ['resetPassword']


    def showHeader(self, obj):
        try:
            header = mark_safe('<img src="%s" width="80px" />' % (obj.header.url,))
        except Exception as e:
            header = mark_safe('<img src="%s" width="80px" />' % (settings.MEDIA_URL + Constant.default_user_header,))
        return header

    showHeader.short_description = "Image"

    # Reset password
    def resetPassword(self, request, queryset):
        queryset.update(password=Constant.default_user_password)
        messages.info(request, "initial password:%s！" % Constant.default_user_password)

    resetPassword.short_description = "Reset user password"


    def save_model(self, request, obj, form, change):
        if change:
            # Modify
            # Determine if the username already exists
            username = obj.username
            userid = obj.id
            users = User.objects.filter(username=username).exclude(id=userid)
            if len(users) > 0:
                messages.error(request, "Operation failed! Username already exists!")
                messages.set_level(request, messages.ERROR)
            else:
                if not obj.header:
                    obj.header = Constant.default_user_header
                else:
                    users = User.objects.filter(pk=userid)
                    if obj.header != Constant.default_user_header and obj.header.name != users[0].header.name:
                        obj.header.name = Util().upload_path_handler(instance=None, filename=obj.header.name)
                super().save_model(request, obj, form, change)
        else:
            # Add
            # Determine if the username already exists
            username = obj.username
            users = User.objects.filter(username=username)
            if len(users) > 0:
                messages.error(request, "Operation failed! Username already exists!")
                messages.set_level(request, messages.ERROR)
            else:
                obj.password = Constant.default_user_password
                obj.createtime = Util().getCurrentTime()
                if not obj.header:
                    obj.header = Constant.default_user_header
                else:
                    if obj.header != Constant.default_user_header:
                        obj.header.name = Util().upload_path_handler(instance=None, filename=obj.header.name)
                super().save_model(request, obj, form, change)
                messages.info(request, "initial password:%s！" % Constant.default_user_password)
                # messages.set_level(request, messages.INFO)
