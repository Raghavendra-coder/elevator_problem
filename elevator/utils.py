from .models import Floor, Elevator, ElevatorRequest
from django.shortcuts import get_object_or_404


def create_floor(floor_number):
    floor = Floor.objects.create(floor_number=floor_number)
    return floor


def get_total_floors():
    floors = Floor.objects.all()
    return floors


def get_floor_object(floor_number):
    floor = get_object_or_404(Floor, floor_number=floor_number)
    return floor


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
    elevator_request = ElevatorRequest.objects.create(requested_floor=floor, elevator=elevator)
    return elevator_request


def update_elevator_floor_status(data):
    floor_number = data['floor_number']
    elevator_id = data['elevator_id']
    elevator = get_object_or_404(Elevator, id=elevator_id)
    elevator.reached_floor = floor_number
    elevator_requests = ElevatorRequest.objects.filter(destination_floor__floor_number=floor_number)
    elevator_requests.delete()
    elevator.save()

    return elevator


def get_elevator_request_by_elevator_id(elevator_id):
    elevator_request = get_object_or_404(Elevator, id=elevator_id)
    return elevator_request


def get_elevator_request_by_elevator_and_requested_floor(elevator, requested_floor):
    request = get_object_or_404(ElevatorRequest, elevator=elevator, requested_floor=requested_floor)
    return request


def next_upper_floor(current_floor, floor_list):
    try:
        next_floor = sorted(floor_list)[floor_list.index(current_floor) + 1:][0]
    except:
        next_floor = None
    return next_floor


def next_lower_floor(current_floor, floor_list):
    try:
        next_floor = sorted(floor_list)[:floor_list.index(current_floor)][-1]
    except:
        next_floor = None
    return next_floor