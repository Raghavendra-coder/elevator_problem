from . import views
from django.urls import path

urlpatterns = [
    path('index/', views.Index.as_view(), name="index"),
    path('floor/', views.FloorAPI.as_view(), name="floor"),
    path('elevator/', views.ElevatorAPI.as_view(), name="elevator"),
    path('elevator_request/', views.ElevatorRequestAPI.as_view(), name="elevator_request"),
]