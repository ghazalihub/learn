// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_elearning_app/core/app_export.dart';
import 'package:flutter_elearning_app/widgets/custom_elevated_button.dart';
import 'controller/onboarding1_controller.dart';
import 'models/learningframe1_item_model.dart';



class Onboarding1Screen extends StatefulWidget {
  const Onboarding1Screen({super.key});

  @override
  State<Onboarding1Screen> createState() => _Onboarding1ScreenState();
}

class _Onboarding1ScreenState extends State<Onboarding1Screen> {
 Onboarding1Controller onboarding1Controller = Get.put(Onboarding1Controller());
 @override
 Widget build(BuildContext context) {
  mediaQueryData = MediaQuery.of(context);
  return PopScope(
   canPop: true,
   onPopInvokedWithResult: (didPop, result) {
    if (didPop) return;
    closeApp();
   },
   child: Scaffold(
        body: SafeArea(
          child: GetBuilder<Onboarding1Controller>(
            init: Onboarding1Controller(),
            builder:(controller) =>  Stack(
              children: [
                PageView.builder(
                  controller: controller.pageController,
                  onPageChanged: (value) {
                    controller.setCurrentPage(value);
                  },
                  itemCount: controller.onboardingData.length,
                  itemBuilder:(context, index) {
                    Learningframe1ItemModel data = controller.onboardingData[index];
                  return Container(
                    height: double.infinity,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage(data.image!),fit: BoxFit.fill)
                    ),
                    child: Padding(
                      padding:  EdgeInsets.only(bottom: 207.v),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            width: 355.h,
                            margin: EdgeInsets.only(
                              left: 18.h,
                              right: 14.h,
                            ),
                            child: Text(
                             data.title!,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                              style: theme.textTheme.headlineMedium!.copyWith(
                                height: 1.36,
                              ),
                            ),
                          ),
                          SizedBox(height: 15.v),
                          Padding(
                            padding:  EdgeInsets.symmetric(horizontal: 18.5.h),
                            child: SizedBox(
                              width:double.infinity,
                              child: Text(
                                data.subtitle!,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.center,
                                style: theme.textTheme.bodyLarge!.copyWith(
                                  height: 1.50,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },),
                Padding(
                  padding:  EdgeInsets.only(bottom: 40.v),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                              controller.onboardingData.length, (index) {
                            return AnimatedContainer(
                              margin: EdgeInsets.only(left: 3.h, right: 3.h),
                              duration:
                              const Duration(milliseconds: 300),
                              height: 7.v,
                              width: index == controller.currentPage?16.h:7.v,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(24.h),
                                  color:
                                  (index == controller.currentPage)
                                      ? appTheme.buttonColor
                                      : appTheme.buttonColor.withOpacity(0.14)),
                            );
                          })),
                      CustomElevatedButton(
                        height: 56.v,
                        text: controller.currentPage ==
                            controller.onboardingData.length - 1
                            ? "Get started"
                            : "lbl_next".tr,
                        onPressed: controller.currentPage ==
                            controller.onboardingData.length - 1
                            ? () {
                          PrefUtils.setIsIntro(false);
                          Get.toNamed(
                            AppRoutes.logInScreen,
                          );
                        }
                            : () {
                          controller.pageController.nextPage(
                              duration: const Duration(
                                  milliseconds: 100),
                              curve: Curves.bounceIn);
                        },
                        margin:
                        EdgeInsets.only(left: 16.h, top: 32.v, right: 16.h),
                      ),
                      SizedBox(height: 20.v),
                      GestureDetector(
                          onTap: () {
                            PrefUtils.setIsIntro(false);
                            Get.toNamed(
                              AppRoutes.logInScreen,
                            );
                          },
                          child: Text(controller.currentPage ==
                              controller.onboardingData.length - 1
                              ? "":"lbl_skip".tr,
                              style: theme.textTheme.bodyLarge))
                    ],
                  ),
                )
              ],
            ),
          )






          // Container(
          //     width: double.maxFinite,
          //     padding: EdgeInsets.symmetric(vertical: 24.v),
          //     child: Column(children: [
          //      SizedBox(
          //          height: 476.v,
          //          width: double.maxFinite,
          //          child: Stack(alignment: Alignment.center, children: [
          //           CustomImageView(
          //               imagePath: ImageConstant.imgObjectBlack900412x428,
          //               height: 412.v,
          //               width: 428.h,
          //               alignment: Alignment.topCenter,
          //               margin: EdgeInsets.only(top: 23.v)),
          //           CustomImageView(
          //               imagePath: ImageConstant.imgRectangle44871,
          //               height: 476.v,
          //               width: 396.h,
          //               alignment: Alignment.center)
          //          ])),
          //      SizedBox(height: 33.v),
          //      _buildLearningFrame(),
          //      SizedBox(height: 29.v),
          //      Obx(() => SizedBox(
          //          height: 7.v,
          //          child: AnimatedSmoothIndicator(
          //              activeIndex: controller.sliderIndex.value,
          //              count: controller.onboarding1ModelObj.value
          //                  .learningframe1ItemList.value.length,
          //              axisDirection: Axis.horizontal,
          //              effect: ScrollingDotsEffect(
          //                  spacing: 6,
          //                  activeDotColor: theme.colorScheme.primary,
          //                  dotColor:
          //                  theme.colorScheme.primary.withOpacity(0.46),
          //                  dotHeight: 7.v,
          //                  dotWidth: 7.h)))),
          //      SizedBox(height: 32.v),
          //      CustomElevatedButton(
          //          text: "lbl_get_started".tr,
          //          margin: EdgeInsets.symmetric(horizontal: 16.h),
          //          onPressed: () {
          //           onTapGetStarted();
          //          }),
          //      SizedBox(height: 5.v)
          //     ])),
        )),
  );
 }

 /// Section Widget
 // Widget _buildLearningFrame() {
 //  return Padding(
 //      padding: EdgeInsets.only(left: 17.h, right: 22.h),
 //      child: Obx(() => CarouselSlider.builder(
 //          options: CarouselOptions(
 //              height: 140.v,
 //              initialPage: 0,
 //              autoPlay: true,
 //              viewportFraction: 1.0,
 //              enableInfiniteScroll: false,
 //              scrollDirection: Axis.horizontal,
 //              onPageChanged: (index, reason) {
 //               controller.sliderIndex.value = index;
 //              }),
 //          itemCount: controller
 //              .onboarding1ModelObj.value.learningframe1ItemList.value.length,
 //          itemBuilder: (context, index, realIndex) {
 //           Learningframe1ItemModel model = controller.onboarding1ModelObj
 //               .value.learningframe1ItemList.value[index];
 //           return Learningframe1ItemWidget(model);
 //          })));
 // }

 /// Navigates to the homeScreenContainerScreen when the action is triggered.
 onTapGetStarted() {
  Get.toNamed(
   AppRoutes.homeScreenContainerScreen,
  );
 }
}


