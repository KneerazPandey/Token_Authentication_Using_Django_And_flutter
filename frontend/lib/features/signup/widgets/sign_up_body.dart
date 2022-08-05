import 'package:flutter/material.dart';
import 'package:frontend/features/signup/widgets/sign_up_form.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpBody extends StatelessWidget {
  const SignUpBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 130),
          Text(
            'Get on Board',
            style: GoogleFonts.sansita(
              color: Colors.white,
              fontSize: 36,
            ),
          ),
          const SizedBox(height: 30),
          const SignUpForm(),
        ],
      ),
    );
  }
}
