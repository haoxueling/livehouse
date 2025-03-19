"""

"""

from django.contrib import admin
from django.urls import path, include

from apps.product import views

urlpatterns = [
    path('detail', views.detail),
    path('list', views.list),
]
