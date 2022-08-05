import 'package:flutter/material.dart';
import 'package:frontend/core/controllers/controllers.dart';
import 'package:frontend/core/routes/routing.dart';
import 'package:frontend/features/home/screen/home_screen.dart';
import 'package:frontend/features/signin/screen/sign_in_screen.dart';
import 'package:frontend/features/signin/services/sign_in_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final SignInService _signInService = SignInService();

  @override
  void initState() {
    super.initState();
    getUserData();
  }

  void getUserData() async {
    await _signInService.getUserData(context: context);
    if (tokenController.accessTokenCounter == 1) {
      await _signInService.getUserData(context: context);
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: (RouteSettings routeSettings) =>
          generateRoute(routeSettings),
      debugShowCheckedModeBanner: false,
      home: userController.user.email.isNotEmpty
          ? const HomeScreen()
          : const SignInScreen(),
    );
  }
}
