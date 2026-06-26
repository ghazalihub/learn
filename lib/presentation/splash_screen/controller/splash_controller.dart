import 'dart:async';

import 'package:flutter_elearning_app/core/app_export.dart';
import 'package:flutter_elearning_app/presentation/splash_screen/models/splash_model.dart';
import 'package:flutter_elearning_app/services/auth_service.dart';

class SplashController extends GetxController {
 final AuthService _authService = Get.find<AuthService>();
 Rx<SplashModel> splashModelObj = SplashModel().obs;

 @override
 void onReady() {
  Future.delayed(const Duration(milliseconds: 3000), () {
   print("themedata is ======== ${PrefUtils().getThemeData()}");
   _getIsFirst();
  });
 }

 _getIsFirst() async {
  bool isIntro = await PrefUtils.getIsIntro();
  Timer(const Duration(seconds: 3), () {
   print("is intro ====== $isIntro");
   if (isIntro) {
    Get.offAllNamed(AppRoutes.onboarding1Screen);
   } else if (_authService.isLoggedIn) {
    Get.offAllNamed(AppRoutes.homeScreenContainerScreen);
   } else {
    Get.offAllNamed(AppRoutes.logInScreen);
   }
  });
 }
}
