from .serializers import *
from .models import *
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework.permissions import IsAuthenticated
from rest_framework.authentication import TokenAuthentication
# Create your views here.

class RegisterView(APIView):
    def post(self,request):
        serializers=UserSerializer(data=request)
        if serializers.is_valid():
            serializers.save()
            return Response({"error":False})
        return Response({"error":True})