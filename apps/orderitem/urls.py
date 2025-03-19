"""
Frontend order details url
"""

from django.contrib import admin
from django.urls import path, include

from apps.orderitem import views

urlpatterns = [
    path('list', views.list),  # Order details list url
]
