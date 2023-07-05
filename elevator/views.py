from django.shortcuts import render
from rest_framework.response import Response
from rest_framework.views import APIView
from rest_framework.status import *

# Create your views here.

class Index(APIView):

    def get(self, request):
        response = {
            'status': True,
            'message': "success"
        }
        return Response(response, status=HTTP_200_OK)

