import 'package:get/get.dart';
import 'package:flutter/material.dart';

class LoginController extends GetxController {
  final TextEditingController passwordController = TextEditingController();

  RxBool obscurePassword = true.obs;

  RxBool rememberMe = false.obs; // Checkbox state

  void toggleObscure() {
    obscurePassword.value = !obscurePassword.value;
  }

  @override
  void onClose() {
    passwordController.dispose();
    super.onClose();
  }
}
