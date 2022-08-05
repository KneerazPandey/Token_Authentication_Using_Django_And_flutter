import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:frontend/core/widgets/custom_snack_bar.dart';
import 'package:http/http.dart';

class HttpErrorHandling {
  static void handleHttpError({
    required BuildContext context,
    required Response response,
    required VoidCallback onSuccess,
  }) {
    switch (response.statusCode) {
      case 200:
        onSuccess();
        break;
      case 201:
        onSuccess();
        break;
      case 400:
        String error = json.decode(response.body)['error'];
        CustomSnackBar.showSnackBar(context: context, text: error);
        break;
      default:
        String error = json.decode(response.body);
        CustomSnackBar.showSnackBar(context: context, text: error);
        break;
    }
  }
}
