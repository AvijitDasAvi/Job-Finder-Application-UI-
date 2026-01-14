import 'package:get/get.dart';

class ReviewsController extends GetxController {
  void onBackTap() {
    Get.back();
  }

  void onViewAllTap() {
    Get.snackbar('Info', 'View all reviews');
  }

  void onFilterChanged(String filter) {
    Get.snackbar('Info', 'Filter changed to: $filter');
  }
}
