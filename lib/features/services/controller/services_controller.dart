import 'package:get/get.dart';
import 'package:flutter/material.dart';

class ServicesController extends GetxController {
  late TextEditingController searchController;
  RxString selectedFilter = ''.obs;
  RxInt currentIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
    searchController = TextEditingController();
  }

  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
  }

  void onSearchChanged(String query) {
    // Handle search logic
  }

  void onFilterTap(String filter) {
    selectedFilter.value = filter;
  }

  void onSendInvitationTap(String serviceName) {
    // Handle send invitation logic
    Get.snackbar('Invitation', 'Invitation sent to $serviceName');
  }

  void updateBottomNavIndex(int index) {
    currentIndex.value = index;
  }

  void onBackTap() {
    Get.back();
  }
}
