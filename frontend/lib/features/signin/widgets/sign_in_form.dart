import 'package:flutter/material.dart';
import 'package:frontend/core/widgets/custom_button.dart';
import 'package:frontend/core/widgets/custom_text_from_field.dart';
import 'package:frontend/features/signin/services/sign_in_service.dart';
import 'package:frontend/features/signup/screen/sign_up_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({Key? key}) : super(key: key);

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final _signInFormKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final SignInService _signInService = SignInService();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void signIn() async {
    await _signInService.signInUser(
      context: context,
      email: _emailController.text,
      password: _passwordController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _signInFormKey,
      child: Column(
        children: [
          const SizedBox(height: 26),
          CustomTextFormField(
            controller: _emailController,
            hintText: 'E-mail',
          ),
          const SizedBox(height: 26),
          CustomTextFormField(
            controller: _passwordController,
            hintText: 'Password',
            obscureText: true,
          ),
          const SizedBox(height: 26),
          TextButton(
            onPressed: () {},
            child: Text(
              'Forget your Password?',
              style: GoogleFonts.poppins(
                fontSize: 14,
                color: Colors.grey,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
          const SizedBox(height: 40),
          CustomButton(
            buttonName: 'SignIn',
            onPressed: () {
              if (_signInFormKey.currentState!.validate()) {
                signIn();
              }
            },
          ),
          const SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'New here? ',
                style: GoogleFonts.poppins(
                  fontSize: 15,
                  color: Colors.grey,
                ),
              ),
              TextButton(
                onPressed: () async {
                  await Navigator.pushNamedAndRemoveUntil(
                    context,
                    SignUpScreen.routeName,
                    (route) => false,
                  );
                },
                child: Text(
                  'Sign Up instead',
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: Colors.grey,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
