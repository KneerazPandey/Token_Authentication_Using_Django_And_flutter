import 'package:flutter/material.dart';
import 'package:frontend/core/constants/global_url.dart';
import 'package:frontend/core/errors/http_error_handling.dart';
import 'package:frontend/core/models/user.dart';
import 'package:frontend/core/widgets/custom_snack_bar.dart';
import 'package:frontend/features/signin/screen/sign_in_screen.dart';
import 'package:http/http.dart';

class SignUpService {
  Future<void> signUpUser({
    required BuildContext context,
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      Uri uri = Uri.parse('${GlobalUrl.url}/api/accounts/register/');
      User user = User(
        id: '',
        name: name,
        email: email,
        password: password,
      );
      Response response = await post(
        uri,
        body: user.toJson(),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      HttpErrorHandling.handleHttpError(
        context: context,
        response: response,
        onSuccess: () async {
          CustomSnackBar.showSnackBar(
            context: context,
            text: 'User Register sucessfully. Login with the same credential',
          );
          await Navigator.pushNamedAndRemoveUntil(
            context,
            SignInScreen.routeName,
            (route) => false,
          );
        },
      );
    } catch (error) {
      CustomSnackBar.showSnackBar(
        context: context,
        text: error.toString(),
      );
    }
  }
}
