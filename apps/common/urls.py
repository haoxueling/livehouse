"""
Public module url
"""

from django.contrib import admin
from django.urls import path, include

from apps.common import views

urlpatterns = [
    path('login', views.login, name="login"),  # Jump to the login page, set name here, in order to find this route in the template file, by writing name
    path('register', views.register, name="register"),  # Jump to the registration page
    path('doLogin', views.doLogin),  # login
    path('doRegister', views.doRegister),  # Register
    path('logout', views.logout),  # logout
    path('upload', views.upload),  # upload
    path('stylebias', views.stylebia)  # visualisation chart
]
