import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_elearning_app/core/app_export.dart';
import 'package:flutter_elearning_app/widgets/custom_elevated_button.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../onboarding_screen/widgets/onboardingslider_item_widget.dart';
import 'controller/onboarding_controller.dart';
import 'models/onboardingslider_item_model.dart';

class OnboardingScreen extends GetWidget<OnboardingController> {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(vertical: 24.v),
                child: Column(children: [
                  SizedBox(
                      height: 476.v,
                      width: double.maxFinite,
                      child: Stack(alignment: Alignment.center, children: [
                        CustomImageView(
                            imagePath: ImageConstant.imgObject,
                            height: 431.v,
                            width: 428.h,
                            alignment: Alignment.center),
                        CustomImageView(
                            imagePath: ImageConstant.imgRectangle4487,
                            height: 476.v,
                            width: 396.h,
                            alignment: Alignment.center)
                      ])),
                  SizedBox(height: 33.v),
                  _buildOnboardingSlider(),
                  SizedBox(height: 29.v),
                  Obx(() => SizedBox(
                      height: 7.v,
                      child: AnimatedSmoothIndicator(
                          activeIndex: controller.sliderIndex.value,
                          count: controller.onboardingModelObj.value
                              .onboardingsliderItemList.value.length,
                          axisDirection: Axis.horizontal,
                          effect: ScrollingDotsEffect(
                              spacing: 6,
                              activeDotColor: theme.colorScheme.primary,
                              dotColor:
                                  theme.colorScheme.primary.withOpacity(0.46),
                              dotHeight: 7.v,
                              dotWidth: 7.h)))),
                  SizedBox(height: 32.v),
                  CustomElevatedButton(
                      text: "lbl_next".tr,
                      margin: EdgeInsets.symmetric(horizontal: 16.h),
                      onPressed: () {
                        onTapNext();
                      }),
                  SizedBox(height: 19.v),
                  GestureDetector(
                      onTap: () {
                        onTapTxtSkip();
                      },
                      child: Text("lbl_skip".tr,
                          style: theme.textTheme.bodyLarge)),
                  SizedBox(height: 5.v)
                ]))));
  }

  /// Section Widget
  Widget _buildOnboardingSlider() {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 28.h),
        child: Obx(() => CarouselSlider.builder(
            options: CarouselOptions(
                height: 140.v,
                initialPage: 0,
                autoPlay: true,
                viewportFraction: 1.0,
                enableInfiniteScroll: false,
                scrollDirection: Axis.horizontal,
                onPageChanged: (index, reason) {
                  controller.sliderIndex.value = index;
                }),
            itemCount: controller
                .onboardingModelObj.value.onboardingsliderItemList.value.length,
            itemBuilder: (context, index, realIndex) {
              OnboardingsliderItemModel model = controller.onboardingModelObj
                  .value.onboardingsliderItemList.value[index];
              return OnboardingsliderItemWidget(model);
            })));
  }

  /// Navigates to the onboardingScreenOneScreen when the action is triggered.
  onTapNext() {
    Get.toNamed(
      AppRoutes.onboardingScreenOneScreen,
    );
  }

  /// Navigates to the onboarding1Screen when the action is triggered.
  onTapTxtSkip() {
    Get.toNamed(
      AppRoutes.onboarding1Screen,
    );
  }
}
