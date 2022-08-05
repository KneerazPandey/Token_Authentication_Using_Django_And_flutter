import 'package:get/get.dart';

class TokenController extends GetxController {
  final RxInt _accessTokenCounter = 0.obs;

  int get accessTokenCounter => _accessTokenCounter.value;

  void setAccessTokenCounter(int value) {
    _accessTokenCounter.value = value;
  }
}
