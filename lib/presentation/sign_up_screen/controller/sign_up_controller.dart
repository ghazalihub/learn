import 'package:flutter/material.dart';
import 'package:flutter_elearning_app/core/app_export.dart';
import 'package:flutter_elearning_app/presentation/sign_up_screen/models/sign_up_model.dart';
import 'package:flutter_elearning_app/services/auth_service.dart';

class SignUpController extends GetxController {
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();

  final AuthService _authService = Get.find<AuthService>();

  Rx<SignUpModel> signUpModelObj = SignUpModel().obs;
  Rx<bool> isShowPassword = true.obs;

  Future<void> signUp() async {
    final user = await _authService.signUp(
      fullNameController.text.trim(),
      emailController.text.trim(),
      passwordController.text.trim(),
    );
    if (user != null) {
      Get.offAllNamed(AppRoutes.homeScreenContainerScreen);
    }
  }

  @override
  void onClose() {
    super.onClose();
    fullNameController.clear();
    emailController.clear();
    passwordController.clear();
    phoneNumberController.clear();
  }
}
