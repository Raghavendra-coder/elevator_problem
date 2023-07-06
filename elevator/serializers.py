from rest_framework.serializers import ModelSerializer
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
    class Meta:
        model = ElevatorRequest
        fields = "__all__"
