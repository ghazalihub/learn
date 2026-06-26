import 'dart:async';
import 'package:flutter_elearning_app/core/app_export.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SplashController extends GetxController {
  @override
  void onReady() {
    super.onReady();
    Future.delayed(const Duration(milliseconds: 3000), () {
      _checkState();
    });
  }

  _checkState() async {
    bool isIntro = await PrefUtils.getIsIntro();
    if (isIntro) {
      Get.offNamed(AppRoutes.onboarding1Screen);
    } else {
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        Get.offNamed(AppRoutes.homeScreenContainerScreen);
      } else {
        Get.offNamed(AppRoutes.logInScreen);
      }
    }
  }
}
