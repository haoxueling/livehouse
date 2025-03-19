from django.contrib import admin
from apps.notice.models import Notice
from apps.common.models import Constant
from apps.util.util import Util


@admin.register(Notice)
class NoticeAdmin(admin.ModelAdmin):
    # List display fields
    list_display = ['title', 'content', 'time']

    search_fields = ['title']

    list_per_page = Constant.pageSizeAdmin

    # Edit the fields to be edited on the page
    fields = ["title", "content", "time"]


    # readonly_fields = ["title", ]

    # def showTypename(self, obj):
    #     return obj.typeid.typename
    #
    # # Setting the title of the field to display
    # showTypename.short_description = 'notice'

    #Rewriting the save method
    def save_model(self, request, obj, form, change):
        if not change:
            #save
            obj.time = Util().getCurrentTime()
        super().save_model(request, obj, form, change)

    # class Media:
    #     js = (
    #         '/static/kindeditor/kindeditor-all.js',
    #         '/static/kindeditor/lang/zh-CN.js',
    #         '/static/kindeditor/config.js',
    #     )

# admin.site.register(Notice,NoticeAdmin)
