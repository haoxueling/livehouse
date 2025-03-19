"""
Frontend shopping cart url
"""

from django.contrib import admin
from django.urls import path, include

from apps.cart import views

urlpatterns = [
    path('add', views.add),  # add cart url
    path('list', views.list),  # shopping cart list url
    path('edit', views.edit), # Shopping cart edit product quantity url
    path('delete', views.delete),  # Shopping cart delete product url
    path('cartItemCount', views.cartItemCount),  # shopping cart itemscount url
]
