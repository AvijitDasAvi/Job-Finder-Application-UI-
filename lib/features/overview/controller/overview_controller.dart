import 'package:get/get.dart';

class OverviewController extends GetxController {
  void onBackTap() {
    Get.back();
  }

  void onPostJobTap() {
    Get.toNamed('/postJob');
  }

  void onFindTradespeopleTap() {
    // Handle navigation to find tradespeople
  }

  void onViewAllTap() {
    // Handle view all navigation
  }

  void onViewJobTap() {
    // Handle view job navigation
  }

  void onDeleteJobTap() {
    // Handle delete job action
  }
}
