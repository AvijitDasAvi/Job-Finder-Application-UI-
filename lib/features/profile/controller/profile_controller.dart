import 'package:get/get.dart';

class ProfileController extends GetxController {
  void onBackTap() {
    Get.back();
  }

  void onOverviewTap() {
    Get.toNamed('/overview');
  }

  void onMessagesTap() {
    Get.toNamed('/messages');
  }

  void onMyJobsTap() {
    Get.toNamed('/myjobs');
  }

  void onSettingsTap() {
    Get.toNamed('/settings');
  }

  void onProposalTap() {
    Get.toNamed('/proposal');
  }

  void onLogoutTap() {
    // Handle logout
    Get.offAllNamed('/loginScreen');
  }

  void onPostJobTap() {
    Get.toNamed('/postJob');
  }
}
