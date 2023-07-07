from . import views
from django.urls import path

urlpatterns = [
    path('index/', views.Index.as_view(), name="index"),
    path('floor/', views.FloorAPI.as_view(), name="floor"),
    path('elevator/', views.ElevatorAPI.as_view(), name="elevator"),
    path('elevator_request/', views.ElevatorRequestAPI.as_view(), name="elevator_request"),
    path('open_close_door/', views.OpenCloseElevatorDoorAPI.as_view(), name="open_close_door"),
    path('destination_floor/', views.AddElevatorDestinationAPI.as_view(), name="add_destination_floor"),
    path('update_elevator_floor/', views.UpdateElevatorFloorAPI.as_view(), name="update_elevator_floor"),
    path('run_elevator/', views.RunElevatorAPI.as_view(), name="run_elevator"),
    path('elevator_next_destination/<pk>/', views.ElevatorNextDestinationAPI.as_view(), name="elevator_next_destination"),
    path('elevator_health/<pk>/', views.ElevatorHealthAPI.as_view(), name="elevator_health"),
]