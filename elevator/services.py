from .models import Floor, ElevatorRequest
from . import utils
from .serializers import *
from django.shortcuts import get_object_or_404
from elevator_problem.exceptions import BusinessException
from response_codes import ResponseCodes


def create_floor_service(data):
    """
    this service is to create floors for a building
    """

    total_floors = data['total_floors']
    try:
        latest_floor = Floor.objects.latest('created_at')
    except:
        latest_floor = None
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
    "elevator_name": "X-2",
    "elevator_number": "1"
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
        request_serializer = ElevatorRequestSerializer(elevator_requests, many=True)
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
    "elevator_id" : 2
    }
    """
    elevator = utils.get_elevator_object(data['elevator_id'])
    if elevator.elevator_health != "W":
        raise BusinessException(ResponseCodes.ELEVATOR_NOT_WORKING.name)
    create_elevator_request, created = utils.create_elevator_request(data)
    if created:
        code = 201 #new request added
    else:
        code = 200
    request_serializer = ElevatorRequestSerializer(create_elevator_request)
    data = {
        "code": code,
        "data": request_serializer.data
    }

    return data


def open_or_close_door_service(data):
    """
    this service is to open the elevator door if its closed and vice versa if the elevator's
     moving status of the elevator is also 'still'
    data = {
    "floor_number": 2,
    "elevator_id" : "<id>"
    }
    """
    elevator = utils.get_elevator_object(data['elevator_id'])
    if elevator.moving_status == "S":
        if elevator.door_status == "C":
            elevator.door_status = "O"
        else:
            elevator.door_status = "C"
        elevator.save()
        return f"Door : {elevator.door_status}"
    else:
        return f"Door cannot be opened"


def get_destination_floor_service(elevator_id):
    """
    this service is to get all destination floor of an elevator
    """
    if not elevator_id:
        raise BusinessException(ResponseCodes.NO_ELEVATOR_ID_PROVIDED.name)
    else:
        elevator = utils.get_elevator_object(elevator_id)
        destinations = DestinationFloorRequest.objects.filter(elevator_request__elevator=elevator)
        destination_serializer = ElevatorDestinationSerializer(destinations, many=True)
        return destination_serializer.data



def add_destination_floor_service(data):
    """
    this service is to add the destination floor.
    data = {
    "floor_number": 2, #Not necessary
    "elevator_id": "<id>"
    "destination_floor": 3
    }
    """
    destination_floor = utils.get_floor_object(data['destination_floor'])
    elevator = utils.get_elevator_object(data['elevator_id'])
    if elevator.elevator_health != "W":
        raise BusinessException(ResponseCodes.ELEVATOR_NOT_WORKING.name)
    create_destination, created = utils.create_destination_request(destination_floor, elevator)
    if created:
        code = 201
    else:
        code = 200
    elevator.door_status = "C"
    elevator.save()
    destination_request_serializer = ElevatorDestinationSerializer(create_destination)
    data = {
        "code": code,
        "data": destination_request_serializer.data
    }
    return data


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
    destination_requests = utils.get_destination_request_by_elevator_id(elevator_id)
    elevator.door_status = "C"
    if not elevator_requests and not destination_requests:
        elevator.moving_status = "S"
        elevator.status_light = "G"
        elevator.availability = "A"
        elevator.save()
    else:
        if elevator_requests:
            all_requested_floors = [elevator.requested_floor.floor_number for elevator in elevator_requests]
        else:
            all_requested_floors = []
        if destination_requests:
            all_destination_floors = [destination.destination_floor.floor_number for destination in destination_requests]
        else:
            all_destination_floors = []
        if elevator.availability == "A" and elevator_requests:
            if current_floor > all_requested_floors[0]:
                elevator.moving_status = "D"
            else:
                elevator.moving_status = "U"
        else:
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
                if next_request_floor != None or next_destination_floor != None:
                    elevator.moving_status = "D"
                else:
                    elevator.moving_status = "U"


        elevator.availability = "B"
        elevator.status_light = "R"
    elevator.reached_floor = current_floor
    elevator.save()
    elevator_serializer = ElevatorSerializer(elevator)
    return elevator_serializer.data


def elevator_next_destination_service(elevator_id):
    """
    this service is to find the next destination of the provided elevator id
    """

    elevator = utils.get_elevator_object(elevator_id)
    moving_status = elevator.moving_status
    last_floor = elevator.reached_floor
    elevator_requests = utils.get_elevator_request_by_elevator_id(elevator_id)
    destination_requests = utils.get_destination_request_by_elevator_id(elevator_id)
    if elevator_requests:
        all_requested_floors = [elevator.requested_floor.floor_number for elevator in elevator_requests]
    else:
        all_requested_floors = []
    if destination_requests:
        all_destination_floors = [destination.destination_floor.floor_number for destination in destination_requests]
    else:
        all_destination_floors = []
    next_destination = None
    if moving_status == "U":
        next_request_floor = utils.next_upper_floor(last_floor, all_requested_floors)
        next_destination_floor = utils.next_upper_floor(last_floor, all_destination_floors)

        if not next_request_floor:
            next_destination = next_destination_floor
        elif not next_destination_floor:
            next_destination = next_request_floor
        elif next_request_floor and next_destination_floor:
            if next_request_floor < next_destination_floor :
                next_destination = next_request_floor
            else:
                next_destination = next_destination_floor
        else:
            next_destination = None
    else:
        next_request_floor = utils.next_lower_floor(last_floor, all_requested_floors)
        next_destination_floor = utils.next_lower_floor(last_floor, all_destination_floors)
        if not next_request_floor:
            next_destination = next_destination_floor
        elif not next_destination_floor:
            next_destination = next_request_floor
        elif next_request_floor and next_destination_floor:
            if next_request_floor > next_destination_floor:
                next_destination = next_request_floor
            else:
                next_destination = next_destination_floor
        else:
            next_destination = None
    return next_destination


def get_elevator_health_service(elevator_id):
    """
    this service is to get the elevator health
    W = Working
    UM = Under Maintainance
    NW = Not Working
    """
    elevator = utils.get_elevator_object(elevator_id)
    health = elevator.elevator_health
    return health


def change_elevator_health_service(elevator_id, data):
    """
    this service is to change the elevator health
    W = Working
    UM = Under Maintainance
    NW = Not Working
    data = {
    "health": "W/UM/NW"
    """
    elevator = utils.get_elevator_object(elevator_id)
    elevator.elevator_health = data["health"]
    elevator.save()
    return f"elevator's health changed to {elevator.elevator_health}"

