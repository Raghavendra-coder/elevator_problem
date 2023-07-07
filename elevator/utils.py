from .models import Floor, Elevator, ElevatorRequest, DestinationFloorRequest
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
    elevator = Elevator.objects.create(elevator_name=data['elevator_name'], elevator_number=data['elevator_number'], reached_floor=0)
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
    elevator_request, created = ElevatorRequest.objects.update_or_create(elevator=elevator, requested_floor=floor,)
    return elevator_request, created


def create_destination_request(destination_floor, elevator):
    create_destination, created = DestinationFloorRequest.objects.update_or_create(destination_floor=destination_floor,
                                                                          elevator=elevator
                                                                          )
    return create_destination, created



def update_elevator_floor_status(data):
    floor_number = data['floor_number']
    elevator_id = data['elevator_id']
    elevator = get_object_or_404(Elevator, id=elevator_id)

    destination_requests = DestinationFloorRequest.objects.filter(destination_floor__floor_number=floor_number,
                                                                  elevator=elevator).first()
    elevator_request = ElevatorRequest.objects.filter(requested_floor__floor_number=floor_number, elevator=elevator).first()
    if destination_requests or elevator_request:
        elevator.moving_status = "S"
        elevator.door_status = "O"
        elevator.status_light = "G"
    if destination_requests:
        destination_requests.delete()
    if elevator_request:
        elevator_request.delete()
    elevator.save()

    return elevator


def get_elevator_request_by_elevator_id(elevator_id):
    elevator = get_object_or_404(Elevator, id=elevator_id)
    elevator_requests = ElevatorRequest.objects.filter(elevator=elevator)
    all_requests = []
    for request in elevator_requests:
        if request.requested_floor:
            all_requests.append(request)
    if len(all_requests) == 0:
        return None
    else:
        return all_requests

def get_destination_request_by_elevator_id(elevator_id):
    elevator = get_object_or_404(Elevator, id=elevator_id)
    elevator_requests = DestinationFloorRequest.objects.filter(elevator=elevator)
    all_requests = []
    for request in elevator_requests:
        if request.destination_floor:
            all_requests.append(request)
    if len(all_requests) == 0:
        return None
    else:
        return all_requests


def get_elevator_request_by_elevator_and_requested_floor(elevator, requested_floor):
    request = get_object_or_404(ElevatorRequest, elevator=elevator, requested_floor=requested_floor)
    return request


def get_latest_elevator_request(elevator):
    elevator_request = ElevatorRequest.objects.filter(elevator=elevator).latest('created_at')
    return elevator_request


def next_upper_floor(current_floor, floor_list):
    next_floor = None
    for floor in floor_list:
        if floor > current_floor:
            if next_floor is None or floor < next_floor:
                next_floor = floor

    if next_floor is not None:
        return next_floor
    else:
        return None


def next_lower_floor(current_floor, floor_list):
    next_floor = None
    for floor in floor_list:
        if floor < current_floor:
            if next_floor is None or floor > next_floor:
                next_floor = floor

    if next_floor is not None:
        return next_floor
    else:
        return None


def create_sample_floors_and_elevator(floor_count):
    create_floor(floor_count)
    elevator = Elevator.objects.create(elevator_name="sample", elevator_number=1,
                                       reached_floor=0)
