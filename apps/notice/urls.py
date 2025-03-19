"""
Public module url
"""

from django.contrib import admin
from django.urls import path, include

from apps.notice import views

urlpatterns = [
    path('list', views.list),  # notice list
]
