from . import views
from django.urls import path

urlpatterns = [
    path('index/', views.Index.as_view(), name="index"),
    path('floor/', views.FloorAPI.as_view(), name="floor"),
    path('elevator/', views.ElevatorAPI.as_view(), name="elevator"),
    path('elevator_request/', views.ElevatorRequestAPI.as_view(), name="elevator_request"),
    path('add_destination_floor/', views.AddElevatorDestinationAPI.as_view(), name="add_destination_floor"),
    path('update_elevator_floor/', views.UpdateElevatorFloorAPI.as_view(), name="update_elevator_floor"),
    path('run_elevator/', views.RunElevatorAPI.as_view(), name="run_elevator"),
]