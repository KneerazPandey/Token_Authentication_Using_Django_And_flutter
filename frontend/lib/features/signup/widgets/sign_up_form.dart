import 'package:flutter/material.dart';
import 'package:frontend/core/widgets/custom_button.dart';
import 'package:frontend/core/widgets/custom_snack_bar.dart';
import 'package:frontend/core/widgets/custom_text_from_field.dart';
import 'package:frontend/features/signin/screen/sign_in_screen.dart';
import 'package:frontend/features/signup/services/sign_up_service.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _signUpFomKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final SignUpService _signUpService = SignUpService();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void signUp() async {
    await _signUpService.signUpUser(
      context: context,
      name: _nameController.text,
      email: _emailController.text,
      password: _passwordController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _signUpFomKey,
      child: Column(
        children: [
          CustomTextFormField(
            controller: _nameController,
            hintText: 'Name',
          ),
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
          CustomTextFormField(
            controller: _confirmPasswordController,
            hintText: 'Confirm Password',
            obscureText: true,
          ),
          const SizedBox(height: 26),
          Text(
            'By creating an account, you agree to the Terms and Use and Privicy Policy',
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              fontSize: 14,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 26),
          CustomButton(
            buttonName: 'SignUp',
            onPressed: () {
              if (_signUpFomKey.currentState!.validate()) {
                if (_passwordController.text ==
                    _confirmPasswordController.text) {
                  signUp();
                } else {
                  CustomSnackBar.showSnackBar(
                    context: context,
                    text: 'Password and Confirm Password does not match',
                  );
                }
              }
            },
          ),
          const SizedBox(height: 15),
          TextButton(
            onPressed: () async {
              await Navigator.pushNamedAndRemoveUntil(
                context,
                SignInScreen.routeName,
                (route) => false,
              );
            },
            child: Text(
              'I am already a member',
              style: GoogleFonts.poppins(
                fontSize: 14,
                color: Colors.grey,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
          const SizedBox(height: 26),
        ],
      ),
    );
  }
}
