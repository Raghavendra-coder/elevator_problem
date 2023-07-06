from django.shortcuts import render
from rest_framework.response import Response
from rest_framework.views import APIView
from rest_framework.status import *
from . import services
from global_utils import create_response
from response_codes import ResponseCodes

# Create your views here.

class Index(APIView):

    def get(self, request):
        response = {
            'status': True,
            'message': "success"
        }
        return Response(response, status=HTTP_200_OK)


class FloorAPI(APIView):

    def get(self):
        try:
            total_floors = services.get_total_floors_service()
            response = create_response(201, ResponseCodes.SUCCESS, True, total_floors, None, None)
        except Exception as e:
            response = create_response(500, ResponseCodes.ERROR, False, None, ResponseCodes.SOMETHING_WENT_WRONG.name, str(e))
        return response

    def post(self, request):
        try:
            data = request.data
            create_floor = services.create_floor_service(data)
            response = create_response(201, ResponseCodes.SUCCESS, True, create_floor, None, None)
        except Exception as e:
            response = create_response(500, ResponseCodes.ERROR, False, None, ResponseCodes.SOMETHING_WENT_WRONG.name, str(e))
        return response


class ElevatorAPI(APIView):

    def get(self, request):
        try:
            elevator_id = request.query_params.get('elevator_id')
            all_elevators = services.get_elevator_details_service(elevator_id)
            response = create_response(201, ResponseCodes.SUCCESS, True, all_elevators, None, None)
        except Exception as e:
            response = create_response(500, ResponseCodes.ERROR, False, None, ResponseCodes.SOMETHING_WENT_WRONG.name, str(e))
        return response

    def post(self, request):
        try:
            data = request.data
            create_elevator = services.create_elevator_service(data)
            response = create_response(201, ResponseCodes.SUCCESS, True, create_elevator, None, None)
        except Exception as e:
            response = create_response(500, ResponseCodes.ERROR, False, None, ResponseCodes.SOMETHING_WENT_WRONG.name, str(e))
        return response


class ElevatorRequestAPI(APIView):

    def get(self, request):
        try:
            floor_number = request.query_params.get('floor_number')
            elevator_id = request.query_params.get('elevator_id')
            elevator_request = services.get_elevator_request_services(floor_number, elevator_id)
            response = create_response(200, ResponseCodes.SUCCESS, True, elevator_request, None, None)
        except Exception as e:
            response = create_response(500, ResponseCodes.ERROR, False, None, ResponseCodes.SOMETHING_WENT_WRONG.name, str(e))
        return response


    def post(self, request):
        try:
            data = request.data
            create_elevator_request = services.create_elevator_request_service(data)
            response = create_response(201, ResponseCodes.SUCCESS, True, create_elevator_request, None, None)

        except Exception as e:
            response = create_response(500, ResponseCodes.ERROR, False, None, ResponseCodes.SOMETHING_WENT_WRONG.name, str(e))
        return response


class AddElevatorDestinationAPI(APIView):

    def post(self, request):
        try:
            data = request.data
            add_destination = services.add_destination_floor_service(data)
            response = create_response(200, ResponseCodes.SUCCESS, True, add_destination, None, None)
        except Exception as e:
            response = create_response(500, ResponseCodes.ERROR, True, None, ResponseCodes.SOMETHING_WENT_WRONG.name, str(e))
        return response


class UpdateElevatorFloorAPI(APIView):

    def post(self, request):
        try:
            data = request.data
            update_elevator_floor = services.update_elevator_floor_service(data)
            response = create_response(200, ResponseCodes.SUCCESS, True, update_elevator_floor, None, None)

        except Exception as e:
            response = create_response(500, ResponseCodes.ERROR, False, None, ResponseCodes.SOMETHING_WENT_WRONG.name, str(e))
        return response


class RunElevatorAPI(APIView):

    def post(self, request):
        try:
            data = request.data
            run_elevator = services.run_elevator_service(data)
            response = create_response(200, ResponseCodes.SUCCESS, True, run_elevator, None, None)
        except Exception as e:
            response = create_response(500, ResponseCodes.ERROR, False, None, ResponseCodes.SOMETHING_WENT_WRONG.name, str(e))
        return response