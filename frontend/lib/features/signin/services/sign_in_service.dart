import 'package:flutter/material.dart';
import 'package:frontend/core/constants/global_url.dart';
import 'package:frontend/core/controllers/controllers.dart';
import 'package:frontend/core/errors/http_error_handling.dart';
import 'package:frontend/core/models/user.dart';
import 'package:frontend/core/widgets/custom_snack_bar.dart';
import 'package:frontend/features/home/screen/home_screen.dart';
import 'package:http/http.dart';
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class SignInService {
  Future<void> signInUser({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
      Uri uri = Uri.parse('${GlobalUrl.url}/api/accounts/login/');
      Response response = await post(
        uri,
        body: json.encode({
          'email': email,
          'password': password,
        }),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
      );
      HttpErrorHandling.handleHttpError(
        context: context,
        response: response,
        onSuccess: () async {
          User user = User.fromMap(json.decode(response.body)['data']);
          userController.setUser(user: user);
          final String accessToken =
              json.decode(response.body)['tokens']['access'];
          final String refreshToken =
              json.decode(response.body)['tokens']['refresh'];

          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setString('x-auth-access-token', accessToken);
          prefs.setString('x-auth-refresh-token', refreshToken);

          await Navigator.pushNamedAndRemoveUntil(
            context,
            HomeScreen.routeName,
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

  Future<bool> isTokenValid({
    required BuildContext context,
  }) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? accessToken = prefs.getString('x-auth-access-token');

    if (accessToken == null) {
      prefs.setString('x-auth-access-token', '');
    }

    Uri uri = Uri.parse('${GlobalUrl.url}/api/accounts/verify-token/');
    Response tokenVerifiedResponse = await post(
      uri,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8'
      },
      body: json.encode({'token': accessToken}),
    );
    if (tokenVerifiedResponse.statusCode == 200) {
      return true;
    }
    return false;
  }

  Future<void> getUserData({
    required BuildContext context,
  }) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? accessToken = prefs.getString('x-auth-access-token');

    if (accessToken == null) {
      prefs.setString('x-auth-access-token', '');
    }

    if (await isTokenValid(context: context)) {
      Uri uri = Uri.parse("${GlobalUrl.url}/api/accounts/user-details/");
      Response response = await get(
        uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $accessToken',
        },
      );
      User user = User.fromJson(response.body);
      userController.setUser(user: user);
    } else {
      tokenController
          .setAccessTokenCounter(tokenController.accessTokenCounter + 1);
      await getNewTokensUsingRefreshToken(context: context);
    }
  }

  Future<void> getNewTokensUsingRefreshToken({
    required BuildContext context,
  }) async {
    {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      final String? refreshToken = prefs.getString('x-auth-refresh-token');
      Uri uri = Uri.parse("${GlobalUrl.url}/api/accounts/token/refresh/");
      Response response = await post(
        uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: json.encode({
          'refresh': refreshToken,
        }),
      );
      HttpErrorHandling.handleHttpError(
        context: context,
        response: response,
        onSuccess: () {
          final String accessToken = json.decode(response.body)['access'];
          prefs.setString('x-auth-access-token', accessToken);
        },
      );
    }
  }
}
