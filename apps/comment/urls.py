"""
Comment function front url
"""

from django.contrib import admin
from django.urls import path, include

from apps.comment import views

urlpatterns = [
    path('doComment', views.doComment),  # Add comment
    path('list', views.list),  # Comment list
    path('edit', views.edit),  # Comment editor
    path('doEdit', views.doEdit),  # Update comments
    path('delete', views.delete),  # Comments delete
    path('detail', views.detail),  # Comment details
]
