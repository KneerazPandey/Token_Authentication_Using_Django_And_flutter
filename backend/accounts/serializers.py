from rest_framework import serializers
from . models import User


class UserRegistrationSerializer(serializers.ModelSerializer):
    password = serializers.CharField(min_length=6, max_length=100, write_only=True)

    class Meta:
        model = User 
        fields = ['name', 'email', 'password']

    def create(self, validated_data):
        return User.objects.create_user(**validated_data)


class UserLoginSerializer(serializers.ModelSerializer):
    password = serializers.CharField(write_only=True)
    email = serializers.CharField(max_length=255)

    class Meta:
        model = User 
        fields = ['email', 'password']

    
class UserDetailsSerializer(serializers.ModelSerializer):
    class Meta:
        model = User 
        fields = ['email', 'password', 'name']