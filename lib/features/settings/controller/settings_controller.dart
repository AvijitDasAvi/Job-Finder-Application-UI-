import 'package:get/get.dart';

class SettingsController extends GetxController {
  final fullName = 'Sarah Johnson'.obs;
  final email = 'sarah.johnson@gmail.com'.obs;
  final phoneNumber = '+1 (555) 123-4567'.obs;
  final profession = 'Profession'.obs;
  final bio =
      'I\'m a homeowner who loves working with skilled professionals to improve my property. I value quality work and clear communication.'
          .obs;
  final streetAddress = '123 Main Street'.obs;
  final city = 'City'.obs;
  final state = 'State'.obs;
  final zipCode = '123'.obs;

  void onBackTap() {
    Get.back();
  }

  void onChangePhotoTap() {
    // Handle change photo action
  }

  void onSaveChanges() {
    // Save all changes
    Get.snackbar('Success', 'Changes saved successfully');
  }

  void updateFullName(String value) {
    fullName.value = value;
  }

  void updateEmail(String value) {
    email.value = value;
  }

  void updatePhoneNumber(String value) {
    phoneNumber.value = value;
  }

  void updateProfession(String value) {
    profession.value = value;
  }

  void updateBio(String value) {
    bio.value = value;
  }

  void updateStreetAddress(String value) {
    streetAddress.value = value;
  }

  void updateCity(String value) {
    city.value = value;
  }

  void updateState(String value) {
    state.value = value;
  }

  void updateZipCode(String value) {
    zipCode.value = value;
  }
}
