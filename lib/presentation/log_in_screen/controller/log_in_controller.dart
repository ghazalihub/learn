import 'package:flutter/material.dart';
import 'package:flutter_elearning_app/core/app_export.dart';
import 'package:flutter_elearning_app/presentation/log_in_screen/models/log_in_model.dart';
import 'package:flutter_elearning_app/services/auth_service.dart';

class LogInController extends GetxController {
  TextEditingController emailFieldController = TextEditingController();
  TextEditingController passwordFieldController = TextEditingController();

  final AuthService _authService = Get.find<AuthService>();

  Rx<LogInModel> logInModelObj = LogInModel().obs;
  Rx<bool> isShowPassword = true.obs;

  Future<void> login() async {
    final user = await _authService.signIn(
      emailFieldController.text.trim(),
      passwordFieldController.text.trim(),
    );
    if (user != null) {
      Get.offAllNamed(AppRoutes.homeScreenContainerScreen);
    }
  }

  @override
  void onClose() {
    super.onClose();
    emailFieldController.clear();
    passwordFieldController.clear();
  }
}
