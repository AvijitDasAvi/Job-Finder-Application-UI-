import 'package:get/get.dart';

class TradesmanProfileController extends GetxController {
  void onBackTap() {
    Get.back();
  }

  void onSendInvitation() {
    Get.snackbar('Success', 'Invitation sent successfully');
  }

  void onOverviewTap() {
    // Navigate to overview screen
    Get.toNamed('/overview');
  }

  void onReviewsTap() {
    Get.toNamed('/reviews');
  }

  void onPaymentsTap() {
    Get.toNamed('/payments');
  }

  void onMessagesTap() {
    Get.toNamed('/messages');
  }

  void onSettingsTap() {
    Get.toNamed('/tradesmanSettings');
  }

  void onLogOutTap() {
    Get.offAllNamed('/loginScreen');
  }
}
