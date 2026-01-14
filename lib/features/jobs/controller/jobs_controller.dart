import 'package:get/get.dart';
import 'package:flutter/material.dart';

class JobsController extends GetxController {
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

  void onSendProposalTap(String jobTitle) {
    // Handle send proposal logic
    Get.snackbar('Proposal', 'Proposal sent for $jobTitle');
  }

  void updateBottomNavIndex(int index) {
    currentIndex.value = index;
  }

  void onBackTap() {
    Get.back();
  }
}
