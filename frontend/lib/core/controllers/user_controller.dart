import 'package:frontend/core/models/user.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  final _user = const User(
    id: '',
    name: '',
    email: '',
    password: '',
  ).obs;

  User get user => _user.value;

  void setUser({required User user}) {
    _user.value = user;
  }
}
