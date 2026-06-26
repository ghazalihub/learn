import 'package:flutter/material.dart';

/// A controller class for the LogInScreen.
import 'package:flutter_elearning_app/core/app_export.dart';
import 'package:flutter_elearning_app/presentation/log_in_screen/models/log_in_model.dart';
import 'package:flutter_elearning_app/services/auth_service.dart';

///
/// This class manages the state of the LogInScreen, including the
/// current logInModelObj
class LogInController extends GetxController {
  final AuthService _authService = Get.find<AuthService>();

  TextEditingController emailFieldController = TextEditingController();

  TextEditingController passwordFieldController = TextEditingController();

  Rx<LogInModel> logInModelObj = LogInModel().obs;
  Rx<bool> isShowPassword = true.obs;
  Rx<bool> isLoading = false.obs;

  Future<void> login() async {
    isLoading.value = true;
    try {
      await _authService.signIn(emailFieldController.text, passwordFieldController.text);
      Get.offAllNamed(AppRoutes.homeScreenContainerScreen);
    } catch (e) {
      Get.snackbar("Error", e.toString(), snackPosition: SnackPosition.BOTTOM);
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onClose() {
    super.onClose();
    emailFieldController.clear();
    passwordFieldController.clear();
  }
}
