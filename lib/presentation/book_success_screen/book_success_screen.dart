// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_elearning_app/core/app_export.dart';
import 'package:flutter_elearning_app/services/ad_service.dart';
import 'package:flutter_elearning_app/widgets/custom_elevated_button.dart';

import 'controller/book_success_controller.dart';


class BookSuccessScreen extends StatefulWidget {
  const BookSuccessScreen({super.key});

  @override
  State<BookSuccessScreen> createState() => _BookSuccessScreenState();
}

class _BookSuccessScreenState extends State<BookSuccessScreen> {
 BookSuccessController bookSuccessController = Get.put(BookSuccessController());
 @override
 Widget build(BuildContext context) {
  mediaQueryData = MediaQuery.of(context);
  return PopScope(
   canPop: false,
   onPopInvokedWithResult: (didPop, result) {
    if (didPop) return;
    Get.toNamed(AppRoutes.homeScreenContainerScreen);
   },
   child: Scaffold(
      backgroundColor: appTheme.bgColor,
        body: Container(
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(horizontal: 50.h),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                 CustomImageView(
                     imagePath: PrefUtils().getThemeData() == "primary"?ImageConstant.imgGroup34160Indigo5002:ImageConstant.imgGroup34160Indigo5002Dark,
                     height: 154.adaptSize,
                     width: 154.adaptSize),
                 SizedBox(height: 26.v),
                 Text("msg_class_seat_booked".tr,
                     style: theme.textTheme.titleLarge),
                 SizedBox(height: 11.v),
                 SizedBox(
                     width: 326.h,
                     child: Text("msg_you_have_successfully2".tr,
                         maxLines: 2,
                         overflow: TextOverflow.ellipsis,
                         textAlign: TextAlign.center,
                         style: theme.textTheme.bodyLarge!
                             .copyWith(height: 1.50))),
                 SizedBox(height: 28.v),
                 CustomElevatedButton(
                     text: "lbl_go_to_home".tr,
                     margin: EdgeInsets.only(left: 39.h, right: 37.h),
                     onPressed: () {
                      Get.find<AdService>().showInterstitialAd(onAdDismissed: () {
                        onTapGoToHome();
                      });
                     }),
                 SizedBox(height: 5.v)
                ]))),
  );
 }

 /// Navigates to the searchScreen when the action is triggered.
 onTapGoToHome() {
  Get.toNamed(
   AppRoutes.homeScreenContainerScreen,
  );
 }
}


