import 'dart:async';

import 'package:flutter_elearning_app/core/app_export.dart';
import 'package:flutter_elearning_app/presentation/splash_screen/models/splash_model.dart';

class SplashController extends GetxController {
 Rx<SplashModel> splashModelObj = SplashModel().obs;

 @override
 void onReady() {
  Future.delayed(const Duration(milliseconds: 3000), () {
   print("themedata is ======== ${PrefUtils().getThemeData()}");
   _getIsFirst();
  });
 }

 _getIsFirst() async {
  bool isSignIn = await PrefUtils.getIsSignIn();
  bool isIntro = await PrefUtils.getIsIntro();
  Timer(const Duration(seconds: 3), () {
   print("is intro ====== $isIntro");
   print("isSignIn ====== $isSignIn");
   if (isIntro) {
    Get.toNamed(AppRoutes.onboarding1Screen);
   } else if (isSignIn) {
    Get.toNamed(AppRoutes.logInScreen);
   } else {
    Get.toNamed(AppRoutes.homeScreenContainerScreen);
   }
  });
 }
}
