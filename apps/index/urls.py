"""
Front page url
"""

from django.contrib import admin
from django.urls import path, include

from apps.index import views

urlpatterns = [
    path('', views.index),  # Home url

]
