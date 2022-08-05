import 'package:flutter/material.dart';
import 'package:frontend/features/signin/widgets/sign_in_form.dart';
import 'package:google_fonts/google_fonts.dart';

class SignInBody extends StatelessWidget {
  const SignInBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 140),
          Text(
            'Hello there, \nWelcome back',
            style: GoogleFonts.sansita(
              color: Colors.white,
              fontSize: 36,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 20),
          const SignInForm(),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
