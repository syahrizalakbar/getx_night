import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_night/repository/auth_repository.dart';
import 'package:getx_night/ui/home/home_binding.dart';
import 'package:getx_night/ui/home/home_page.dart';

class LoginController extends GetxController {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  RxBool isLoading = false.obs;

  void login() async {
    isLoading.value = true;

    AuthRepository repo = AuthRepository();

    dynamic user;

    try {
      user = await repo.login(email.text, password.text);
    } catch (e) {
      Get.snackbar(
        "Error",
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
        snackStyle: SnackStyle.GROUNDED,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }

    isLoading.value = false;

    if (user != null) {
      Get.off(() => HomePage(), binding: HomeBinding());
      Get.snackbar(
        "Info",
        "Login ${email.text} success",
        snackPosition: SnackPosition.BOTTOM,
        snackStyle: SnackStyle.GROUNDED,
      );
    } else {
      Get.snackbar("Info", "Login failed");
    }
  }
}