import 'package:get/get.dart';

class PaymentsController extends GetxController {
  void onBackTap() {
    Get.back();
  }

  void onAddNewTap() {
    Get.snackbar('Info', 'Add new payment method');
  }

  void onSetAsDefaultTap(String cardName) {
    Get.snackbar('Success', '$cardName set as default');
  }

  void onDeleteTap(String cardName) {
   
    Get.snackbar('Info', 'Delete $cardName');
  }

  void onDownloadStatement(String transactionName) {
    
    Get.snackbar('Info', 'Downloading statement for $transactionName');
  }
}
