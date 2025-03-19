"""
Frontend order url
"""

from django.contrib import admin
from django.urls import path, include

from apps.order import views

urlpatterns = [
    path('confirm', views.confirm),  # order confirmation url
    path('add', views.add),  # Add order url
    path('pay', views.pay),  # Jump to pay order page url
    path('doPay', views.doPay),  # Payment order url
    path('list', views.list),  # Order list url
    path('delete', views.delete),  # Delete order url
    path('receive', views.receive),  # receive order url
]
