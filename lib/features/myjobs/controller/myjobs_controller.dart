import 'package:get/get.dart';

class MyJobsController extends GetxController {
  void onBackTap() {
    Get.back();
  }

  void onPostJobTap() {
    Get.toNamed('/postJob');
  }

  void onViewJobTap() {
    // Handle view job navigation
  }

  void onDeleteJobTap() {
    // Handle delete job action
  }

  void onCategoryChangeTap(String category) {
    // Handle category change
  }

  void onSearchChanged(String value) {
    // Handle search functionality
  }
}
