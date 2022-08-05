# Django Flutter Token Authentication
This application uses Django Rest Framework Simple JWT Authentication to perform token-based user authentication.


# About the Project 
When a user registers for the application and logs in, Simple JWT is used to produce a token. The token includes access tokens and refresh tokens. Shared Preferences is used in mobile applications to store these tokens. Therefore, the user didn't need to log in again the next time they opened the application. Additionally, a refresh token is used to generate new tokens automatically whenever the access token has expired. The application's restricted pages can only be accessed by using the access token.

# Language
    Python
    Dart

## Framework
    Django
    Django Rest Framework
    Flutter

## Python Packages
    corsheaders
    djangorestframework-simplejwt

## Flutter packages
    google_fonts
    http
    get
    shared_preferences

# Steps of running App
**Note: First of all install python and flutter in your local machine and install the following packages using the below commands**

```bash
    pip install django
    pip install djangorestframework
    pip install corsheaders
    pip install djangorestframework-simplejwt
```

---

```bash
    flutter pub add google_fonts
    flutter pub add http
    flutter pub add get
    flutter pub add shared_preferences
```

---

```bash
    cd backend
    python manage.py runserver
```


**Run the flutter app using an Android or iOS emulator after starting the server.**

### **Note:-**
Use the command to create superuser to gain access to the admin page.
```bash
    python manage.py createsuperuser
```

# About Django
Python-based Django is a free and open-source web application framework. Clean, practical design and quick web development are both possible with it. It was created by seasoned programmers to simplify repetitious chores so that we could concentrate on creating apps rather than inventing the wheel. Read more about django through [documentation](https://docs.djangoproject.com/en/4.0/)

# About Django Rest Framework
For creating Web APIs, the Django REST framework offers a potent and adaptable toolbox. The following are some motives for using the REST framework: For your developers, the Web browsable API is a major usability win. Read more about django rest framework through [documentation](https://www.django-rest-framework.org/)

# About Flutter
For the development of native mobile applications, Google offers the free and open-source Flutter UI framework. Flutter, which was introduced in 2017, enables programmers to create mobile applications using a single codebase and programming language. Building apps for both iOS and Android is now easier and quicker thanks to this capabilities. Learn more about flutter through [documentation](https://docs.flutter.dev/)

