"""
Frontend user url
"""

from django.contrib import admin
from django.urls import path, include

from apps.user import views

urlpatterns = [
    path('detail', views.detail),  # User details
    path('edit', views.edit),  # User edit
    path('doEdit', views.doEdit),  # Save user edits
    path('password', views.password),  # Reset Password
    path('doPassword', views.doPassword),  # Save Reset Password
]
