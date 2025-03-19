"""
Score function front url
"""

from django.contrib import admin
from django.urls import path, include

from apps.scorerecord import views

urlpatterns = [
    path('doScorerecord', views.doScorerecord),  # Add/modify scoring records
    path('list', views.list),
    path('delete', views.delete),
]
