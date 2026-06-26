import 'package:flutter_elearning_app/core/app_export.dart';

void showSnackbar(String title, String message) {
  Get.snackbar(title, message, snackPosition: SnackPosition.BOTTOM);
}
