import 'package:flutter_elearning_app/core/app_export.dart';
import 'package:flutter_elearning_app/presentation/forgot_password_screen/models/forgot_password_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_elearning_app/services/auth_service.dart';

/// A controller class for the ForgotPasswordScreen.
///
/// This class manages the state of the ForgotPasswordScreen, including the
/// current forgotPasswordModelObj
class ForgotPasswordController extends GetxController {
  final AuthService _authService = Get.find<AuthService>();
  TextEditingController emailController = TextEditingController();

  Rx<ForgotPasswordModel> forgotPasswordModelObj = ForgotPasswordModel().obs;
  Rx<bool> isLoading = false.obs;

  Future<void> sendResetLink() async {
    isLoading.value = true;
    try {
      await _authService.resetPassword(emailController.text);
      Get.snackbar("Success", "Password reset link sent to your email", snackPosition: SnackPosition.BOTTOM);
      Get.back();
    } catch (e) {
      Get.snackbar("Error", e.toString(), snackPosition: SnackPosition.BOTTOM);
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onClose() {
    super.onClose();
    emailController.dispose();
  }
}
