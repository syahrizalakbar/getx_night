import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:getx_night/repository/auth_repository.dart';
import 'package:getx_night/ui/login/login_page.dart';

class RegisterController extends GetxController {
  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool isLoading = false;

  void register() async {
    isLoading = true;
    update();

    AuthRepository repo = AuthRepository();

    bool success = await repo.register(username.text, email.text, password.text);

    isLoading = false;
    update();

    if (success) {
      Get.off(() => LoginPage());
      Get.snackbar(
        "Info",
        "Register ${username.text} success",
        snackPosition: SnackPosition.BOTTOM,
        snackStyle: SnackStyle.GROUNDED,
      );
    } else {
      Get.snackbar("Info", "Register failed");
    }
  }
}
