import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class SignUpController extends GetxController {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  RxBool obscurePassword = true.obs;
  RxBool obscureConfirmPassword = true.obs;

  RxString selectedAccountType = 'General'.obs;
  List<String> accountTypes = ['General', 'Business', 'Premium'];

  RxBool agreeToTerms = false.obs;

  void toggleObscure() {
    obscurePassword.value = !obscurePassword.value;
  }

  void toggleConfirmObscure() {
    obscureConfirmPassword.value = !obscureConfirmPassword.value;
  }

  @override
  void onClose() {
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }
}
