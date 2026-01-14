import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PostJobController extends GetxController {
  final jobTitleController = TextEditingController();
  final descriptionController = TextEditingController();
  final selectedCategory = RxString('');
  final selectedSubCategories = RxList<String>();
  final selectedLocation = RxString('');
  final selectedTimeline = RxString('');
  final selectedPreferredDate = RxString('');
  final selectedPreferredTime = RxString('');
  final selectedContactPreference = RxString('');
  final currentStep = RxInt(1);

  @override
  void onClose() {
    jobTitleController.dispose();
    descriptionController.dispose();
    super.onClose();
  }

  void selectCategory(String category) {
    selectedCategory.value = category;
  }

  void toggleSubCategory(String subCategory) {
    if (selectedSubCategories.contains(subCategory)) {
      selectedSubCategories.remove(subCategory);
    } else {
      selectedSubCategories.add(subCategory);
    }
  }

  void onSelectLocation() {
    Get.defaultDialog(
      title: 'Select Location',
      content: const Text('Location selection coming soon'),
    );
  }

  void onSeeAllCategories() {
  }

  void onSeeAllSubCategories() {
  }

  void selectTimeline(String timeline) {
    selectedTimeline.value = timeline;
  }

  void onSelectPreferredDate() {
    Get.defaultDialog(
      title: 'Select Date',
      content: const Text('Date picker coming soon'),
    );
  }

  void onSelectPreferredTime() {
    Get.defaultDialog(
      title: 'Select Time',
      content: const Text('Time picker coming soon'),
    );
  }

  void onUploadPhotos() {
    Get.snackbar(
      'Photos',
      'Photo upload coming soon',
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  void selectContactPreference(String preference) {
    selectedContactPreference.value = preference;
  }

  void onEditJobSummary() {
    Get.back();
  }

  void onContinueTap() {
    Get.toNamed('/postJobPart2');
  }

  void onContinuePart2Tap() {
    Get.toNamed('/postJobPart3');
  }

  void onPostJobTap() {
    Get.snackbar(
      'Success',
      'Job posted successfully!',
      snackPosition: SnackPosition.BOTTOM,
    );
    Get.offAllNamed('/homeScreen');
  }
}
