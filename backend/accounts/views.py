from rest_framework.response import Response
from rest_framework import generics, status
from rest_framework.permissions import IsAuthenticated
from django.contrib.auth import authenticate
from . serializers import UserRegistrationSerializer, UserLoginSerializer, UserDetailsSerializer
from . utils import Utils


class UserRegistrationAPIView(generics.GenericAPIView):
    serializer_class = UserRegistrationSerializer

    def post(self, request):
        serializer = self.serializer_class(data=request.data)
        if serializer.is_valid(raise_exception=True):
            serializer.save()
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)



class UserLoginAPIView(generics.GenericAPIView):
    serializer_class = UserLoginSerializer
    
    def post(self, request):
        serializer = self.serializer_class(data=request.data)
        if serializer.is_valid(raise_exception=True):
            email = request.data.get('email')
            password = request.data.get('password')
            user = authenticate(request, email=email, password=password)
            if user is not None:
                tokens = Utils.get_tokens_for_user(user)
                response = {}
                response['data'] = {
                    'id': str(user.id),
                    'email': str(user.email),
                    'name': str(user.name),
                }
                response['tokens'] = tokens
                return Response(response, status=status.HTTP_200_OK)
            return Response({'error': 'Email and password did not match'}, status=status.HTTP_400_BAD_REQUEST)
        return Response({'error': 'Email and password did not match'}, status=status.HTTP_400_BAD_REQUEST)


class GetUserDetailsAPIView(generics.GenericAPIView):
    serializer_class = UserDetailsSerializer
    permission_classes = [IsAuthenticated]
    
    def get(self, request):
        serializer = UserDetailsSerializer(request.user)
        return Response(serializer.data, status=status.HTTP_200_OK) 
