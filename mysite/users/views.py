from .serializers import *
from .models import *
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework.permissions import IsAuthenticated
from rest_framework.authentication import TokenAuthentication
from django.views.decorators.csrf import csrf_exempt

# Create your views here.
@csrf_exempt
class RegisterView(APIView):
    def post(self,request):
        serializers=Userserializer(data=request)
        if serializers.is_valid():
            serializers.save()
            return Response({"error":False})
        return Response({"error":True})