"""
Front page url
"""

from django.contrib import admin
from django.urls import path, include

from apps.perform import views

urlpatterns = [
    path('ambitus', views.index),
    path('event/list', views.eventList),
    path('event/detail', views.eventDetail),
    path('booking/list', views.bookingList),
    path('booking/detail', views.bookingDetail),
    path('booking/confirm', views.confirm),
    path('booking/list', views.bookingList),
    path('booking/pay', views.pay),
    path('booking/doPay', views.doPay),
    path('booking/deleteBooking', views.deleteBooking),
    path('interaction', views.InteractionView.as_view()),
    path('interaction/submit', views.InteractionSubmit),

    path('booking', views.BookingView.as_view()),
]
