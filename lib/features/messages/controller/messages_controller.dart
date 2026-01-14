import 'package:get/get.dart';

class MessagesController extends GetxController {
  void onBackTap() {
    Get.back();
  }

  void onSearchChanged(String value) {
    // Handle search functionality
  }

  void onMessageTap(String userName) {
    Get.toNamed('/inbox', arguments: {'userName': userName});
  }

  void onMessageOptionsTap() {
    // Handle message options
  }
}
