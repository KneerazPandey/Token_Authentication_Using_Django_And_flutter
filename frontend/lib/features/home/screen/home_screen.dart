import 'package:flutter/material.dart';
import 'package:frontend/core/controllers/controllers.dart';
import 'package:frontend/features/signin/screen/sign_in_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final user = userController.user;

    return Scaffold(
        appBar: AppBar(
          title: const Text('Home Page'),
          actions: [
            IconButton(
              onPressed: () async {
                SharedPreferences preferences =
                    await SharedPreferences.getInstance();
                preferences.remove('x-auth-access-token');
                preferences.remove('x-auth-refresh-token');
                if (!mounted) return;
                await Navigator.pushNamedAndRemoveUntil(
                  context,
                  SignInScreen.routeName,
                  (route) => false,
                );
              },
              icon: const Icon(Icons.logout),
            ),
          ],
        ),
        body: Center(
          child: Column(
            children: [
              Text(
                'Home Page',
                style: GoogleFonts.sansita(
                  fontSize: 60,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Divider(),
              Text(user.email),
              const SizedBox(height: 60),
              Text(user.name),
            ],
          ),
        ));
  }
}
