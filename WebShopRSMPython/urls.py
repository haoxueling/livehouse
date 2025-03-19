# 路由配置文件，它的本质是URL模式以及要为该URL模式调用的视图函数之间的映射表
from django.conf.urls.static import static
from django.contrib import admin
from django.urls import path, include

from WebShopRSMPython import settings

urlpatterns = [
    path('',include('apps.common.urls')),  # 公共模块功能路由，前台登录、注册、注销、文件上传等
    path('',include('apps.index.urls')),  # 前台首页
    path('index/',include('apps.index.urls')),  # 前台首页
    path('perform/', include('apps.perform.urls')),  # 购票相关
    path('product/',include('apps.product.urls')),  # 前台商品
    path('user/',include('apps.user.urls')),  # 前台用户
    path('collection/',include('apps.collection.urls')),  # 前台收藏
    path('comment/',include('apps.comment.urls')),  # 前台评论
    path('cart/',include('apps.cart.urls')),  # 前台购物车
    path('order/',include('apps.order.urls')),  # 前台订单
    path('orderitem/',include('apps.orderitem.urls')),  # 前台订单详情
    path('scorerecord/',include('apps.scorerecord.urls')),  # 前台评分记录
    path('notice/',include('apps.notice.urls')),  # 前台评分记录
    path('admin/', admin.site.urls),
]

# 设置图片路由访问规则: 访问 media 的接口会自动访问到本项目目录下的头像文件夹下的静态资源
urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)

admin.site.site_header = "Livehouse Booking System Backstage"  # 后台登录页面登录form框标题，后台页面头部标题
admin.site.site_title = "Livehouse Booking System Backstage Managem"  # 后台网页的title
admin.site.index_title = "HomePage"  # 后台首页显示
