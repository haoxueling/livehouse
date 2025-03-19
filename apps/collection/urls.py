"""
Collection function foreground url
"""

from django.contrib import admin
from django.urls import path, include

from apps.collection import views

urlpatterns = [
    path('doCollection', views.doCollection),  # Add/remove Collection
    path('list', views.list),  # Collection list
]
