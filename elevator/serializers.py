from rest_framework.serializers import ModelSerializer, SerializerMethodField
from .models import *


class FloorSerializer(ModelSerializer):
    class Meta:
        model = Floor
        fields = "__all__"


class ElevatorSerializer(ModelSerializer):
    class Meta:
        model = Elevator
        fields = "__all__"


class ElevatorRequestSerializer(ModelSerializer):
    requested_floor = SerializerMethodField()
    elevator_number = SerializerMethodField()
    class Meta:
        model = ElevatorRequest
        fields = "__all__"

    def get_requested_floor(self, obj):
        return obj.requested_floor.floor_number

    def get_elevator_number(self, obj):
        return obj.elevator.elevator_number


class ElevatorDestinationSerializer(ModelSerializer):
    destination_floor = SerializerMethodField()
    class Meta:
        model = DestinationFloorRequest
        fields = "__all__"

    def get_destination_floor(self, obj):
        return obj.destination_floor.floor_number