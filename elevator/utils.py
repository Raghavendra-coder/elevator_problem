from .models import Floor, Elevator, ElevatorRequest
from django.shortcuts import get_object_or_404


def create_floor(floor_number):
    floor = Floor.objects.create(floor_number=floor_number)
    return floor


def get_total_floors():
    floors = Floor.objects.all()
    return floors


def create_elevator_object(data):
    elevator = Elevator.objects.create(elevator_name=data['elevator_name'])
    return elevator


def get_elevator_object(elevator_id):
    elevator = get_object_or_404(Elevator, id=elevator_id)
    return elevator


def get_all_elevator_objects():
    elevators = Elevator.objects.all()
    return elevators


def create_elevator_request(data):
    floor_number = data['floor_number']
    floor = get_object_or_404(Floor, floor_number=floor_number)
    elevator_id = data['elevator_id']
    elevator = get_object_or_404(Elevator, id=elevator_id)
    elevator_request = ElevatorRequest.objects.create(floor=floor, elevator=elevator)
    return elevator_request
