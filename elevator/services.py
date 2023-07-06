from .models import Floor, ElevatorRequest
from . import utils
from .serializers import FloorSerializer, ElevatorSerializer, ElevatorRequestSerializer
from django.shortcuts import get_object_or_404


def create_floor_service(data):
    """
    this service is to create floors for a building
    """

    total_floors = data['total_floors']
    latest_floor = Floor.objects.Latest()
    created_floors = []
    if not latest_floor:
        start = 0
    else:
        start = latest_floor.floor_number + 1
    for i in range(start, total_floors):
        floor_object = utils.create_floor(i)
        created_floors.append(floor_object)
    floor_serializer = FloorSerializer(created_floors, many=True)
    return floor_serializer.data


def get_total_floors_service():
    """
    this service is to get total floors
    """
    total_floors = utils.get_total_floors().count()
    data = {
        "total_floors": total_floors
    }
    return data


def get_elevator_details_service(elevator_id):
    """
    this service is to get details of an elevator if elevator id is provided
    else will return the details of all elevators
    """
    if elevator_id:
        elevator = utils.get_elevator_object(elevator_id)
        data = ElevatorSerializer(elevator).data
    else:
        elevators = utils.get_all_elevator_objects()
        data = ElevatorSerializer(elevators, many=True).data
    return data


def create_elevator_service(data):
    """
    this service is to create elevator
    data = {
    "elevator_name": "X-2"
       }
    """
    create_elevator = utils.create_elevator_object(data)
    data = ElevatorSerializer(create_elevator).data
    return data


def get_elevator_request_services(floor_number, elevator_id):
    """
    this service is to get elevator request according to floor number if floor number provided in the query parameters
    and according to speciific elevator if provided elevator id
    if not provided will get all requests
    """
    if elevator_id:
        elevator_requests = utils.get_elevator_request_by_elevator_id(elevator_id)
        request_serializer = ElevatorRequestSerializer(elevator_requests)
    else:
        elevator_requests = ElevatorRequest.objects.all()
        if floor_number:
            elevator_requests = elevator_requests.filter(floor__floor_number=floor_number)
        request_serializer = ElevatorRequestSerializer(elevator_requests, many=True)
    return request_serializer.data



def create_elevator_request_service(data):
    """
    this service is to create an elevator request on a perticular floor and on a specific elevator
    data = {
    "floor_number" : 2,
    "elevator_number" : 2
    }
    """
    create_elevator_request = utils.create_elevator_request(data)
    request_serializer = ElevatorRequestSerializer(create_elevator_request).data
    return request_serializer.data


def add_destination_floor_service(data):
    """
    this service is to add the destination floor.
    data = {
    "floor_number": 2,
    "elevator_id": "<id>"
    "destination_floor: 3
    }
    """
    current_floor = utils.get_floor_object(data['floor_number'])
    destination_floor = utils.get_floor_object(data['destination_floor'])
    elevator = utils.get_elevator_object(data['elevator_id'])

    elevator_request = utils.get_elevator_request_by_elevator_and_requested_floor(elevator, current_floor)
    elevator_request.destination_floor = destination_floor
    elevator_request.save()
    return f"Floor : {data['destination_floor']} Destination added"


def update_elevator_floor_service(data):
    """
    this service is to update  the elevator such that this elevator has reached this floor.
    data = {
    "floor_number": 2,
    "elevator_id": 3
    }
    """
    update_elevator_floor = utils.update_elevator_floor_status(data)
    elevator_serializer = ElevatorSerializer(update_elevator_floor)
    return elevator_serializer.data


def run_elevator_service(data):
    """
    this service is to run the elevator ie changing the moving status ie if it will go-up/go-down/still
    data = {
    "elevator_id" : "<elevator_id>",
    "current_floor": 9,

    }
    """
    current_floor = data['current_floor']
    elevator_id = data['elevator_id']
    elevator = utils.get_elevator_object(elevator_id)
    elevator_requests = utils.get_elevator_request_by_elevator_id(elevator_id)
    if not elevator_requests:
        elevator.moving_status = "S"
        elevator.status_light = "G"
        elevator.save()
    else:
        all_requested_floors = []
        all_destination_floors = []
        for request in elevator_requests:
            all_requested_floors.append(request.requested_floor.floor_number)
            all_destination_floors.append(request.destination_floor.floor_number)
        if current_floor > elevator.reached_floor:
            next_request_floor = utils.next_upper_floor(current_floor, all_requested_floors)
            next_destination_floor = utils.next_upper_floor(current_floor, all_destination_floors)
            if next_request_floor or next_destination_floor:
                elevator.moving_status = "U"
            else:
                elevator.moving_status = "D"
        else:
            next_request_floor = utils.next_lower_floor(current_floor, all_requested_floors)
            next_destination_floor = utils.next_lower_floor(current_floor, all_destination_floors)
            if next_request_floor or next_destination_floor:
                elevator.moving_status = "D"
            else:
                elevator.moving_status = "U"
        elevator.status_light = "R"
    elevator.save()
    elevator_serializer = ElevatorSerializer(elevator)
    return elevator_serializer.data

