import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final searchController = TextEditingController();
  final currentIndex = 0.obs;

  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
  }

  void updateBottomNavIndex(int index) {
    currentIndex.value = index;
    // Navigation is now handled within the home screen itself
  }

  void onSearchChanged(String value) {
    // Handle search functionality
  }

  void onPostJobTap() {
    Get.toNamed('/postJob');
  }

  void onSeeAllTap(String section) {
    // Handle see all action for different sections
  }

  void onSendInvitation() {
    // Handle send invitation action
  }
}
