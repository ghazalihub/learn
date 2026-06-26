import 'package:flutter_elearning_app/core/app_export.dart';
import 'package:flutter_elearning_app/presentation/forgot_password_screen/models/forgot_password_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_elearning_app/services/auth_service.dart';

class ForgotPasswordController extends GetxController {
  TextEditingController emailController = TextEditingController();
  final AuthService _authService = Get.find<AuthService>();

  Rx<ForgotPasswordModel> forgotPasswordModelObj = ForgotPasswordModel().obs;

  Future<void> sendResetEmail() async {
    await _authService.resetPassword(emailController.text.trim());
  }

  @override
  void onClose() {
    super.onClose();
    emailController.dispose();
  }
}
