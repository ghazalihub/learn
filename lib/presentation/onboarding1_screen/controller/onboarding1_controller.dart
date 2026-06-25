import 'package:flutter/cupertino.dart';
import 'package:flutter_elearning_app/core/app_export.dart';
import 'package:flutter_elearning_app/presentation/onboarding1_screen/models/onboarding1_model.dart';

import '../models/learningframe1_item_model.dart';

/// A controller class for the Onboarding1Screen.
///
/// This class manages the state of the Onboarding1Screen, including the
/// current onboarding1ModelObj
class Onboarding1Controller extends GetxController {
 List<Learningframe1ItemModel> onboardingData = Onboarding1Model.getOnboardingData();
 PageController pageController = PageController();
 Rx<int> sliderIndex = 0.obs;
 int currentPage = 0;

 void setCurrentPage(int value) {
  currentPage = value;
  update();
 }
}
