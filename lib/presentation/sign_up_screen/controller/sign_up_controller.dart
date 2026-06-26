import 'package:flutter/material.dart';

/// A controller class for the SignUpScreen.
import 'package:flutter_elearning_app/core/app_export.dart';
import 'package:flutter_elearning_app/presentation/sign_up_screen/models/sign_up_model.dart';
import 'package:flutter_elearning_app/services/auth_service.dart';

///
/// This class manages the state of the SignUpScreen, including the
/// current signUpModelObj
class SignUpController extends GetxController {
  final AuthService _authService = Get.find<AuthService>();

  TextEditingController fullNameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();

  Rx<SignUpModel> signUpModelObj = SignUpModel().obs;

  Rx<bool> isShowPassword = true.obs;
  Rx<bool> isLoading = false.obs;

  Future<void> signUp() async {
    isLoading.value = true;
    try {
      await _authService.signUp(fullNameController.text, emailController.text, passwordController.text);
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
    fullNameController.clear();
    emailController.clear();
    passwordController.clear();
  }
}
