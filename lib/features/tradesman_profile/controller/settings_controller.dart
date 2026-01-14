import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsController extends GetxController {
  late TextEditingController fullNameController;
  late TextEditingController emailController;
  late TextEditingController phoneController;
  late TextEditingController professionController;
  late TextEditingController bioController;
  late TextEditingController streetAddressController;
  late TextEditingController cityController;
  late TextEditingController zipCodeController;

  var selectedState = 'State'.obs;

  @override
  void onInit() {
    super.onInit();
    fullNameController = TextEditingController();
    emailController = TextEditingController();
    phoneController = TextEditingController();
    professionController = TextEditingController();
    bioController = TextEditingController();
    streetAddressController = TextEditingController();
    cityController = TextEditingController();
    zipCodeController = TextEditingController();
  }

  @override
  void onClose() {
    fullNameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    professionController.dispose();
    bioController.dispose();
    streetAddressController.dispose();
    cityController.dispose();
    zipCodeController.dispose();
    super.onClose();
  }

  void onBackTap() {
    Get.back();
  }

  void onSaveChanges() {
    // Handle save changes logic
    Get.snackbar('Success', 'Changes saved successfully');
  }
}
