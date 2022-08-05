import 'package:flutter/material.dart';
import 'package:frontend/features/home/screen/home_screen.dart';
import 'package:frontend/features/signin/screen/sign_in_screen.dart';
import 'package:frontend/features/signup/screen/sign_up_screen.dart';
import 'package:google_fonts/google_fonts.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case SignUpScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (BuildContext context) => const SignUpScreen(),
      );
    case SignInScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (BuildContext context) => const SignInScreen(),
      );
    case HomeScreen.routeName:
      return MaterialPageRoute(
        builder: (BuildContext context) => const HomeScreen(),
      );
    default:
      return MaterialPageRoute(
        builder: (BuildContext context) => Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.red,
            title: const Text('Page Not Found'),
          ),
          body: Center(
            child: Text(
              'Page Not Found',
              style: GoogleFonts.sansita(
                fontSize: 60,
                color: Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      );
  }
}
