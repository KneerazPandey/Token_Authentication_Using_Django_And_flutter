import 'package:flutter/material.dart';
import 'package:frontend/features/signup/widgets/sign_up_body.dart';

class SignUpScreen extends StatelessWidget {
  static const String routeName = '/sign-up';

  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/background.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: const SingleChildScrollView(
              child: SignUpBody(),
            ),
          ),
        ),
      ),
    );
  }
}
