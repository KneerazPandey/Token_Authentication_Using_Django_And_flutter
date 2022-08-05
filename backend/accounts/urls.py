from django.urls import path
from rest_framework_simplejwt.views import TokenVerifyView
from rest_framework_simplejwt.views import TokenRefreshView
from . import views


urlpatterns = [
    path('register/', views.UserRegistrationAPIView.as_view()),
    path('login/', views.UserLoginAPIView.as_view()),

    path('user-details/', views.GetUserDetailsAPIView.as_view()),
    path('verify-token/', TokenVerifyView.as_view()),
    path('token/refresh/', TokenRefreshView.as_view()),
]