// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_elearning_app/core/app_export.dart';
import 'package:flutter_elearning_app/widgets/custom_elevated_button.dart';
import 'controller/reset_password_success_controller.dart';



class ResetPasswordSuccessScreen extends StatefulWidget {
  const ResetPasswordSuccessScreen({super.key});

  @override
  State<ResetPasswordSuccessScreen> createState() => _ResetPasswordSuccessScreenState();
}

class _ResetPasswordSuccessScreenState extends State<ResetPasswordSuccessScreen> {
 ResetPasswordSuccessController controller = Get.put(ResetPasswordSuccessController());
 @override
 Widget build(BuildContext context) {
  mediaQueryData = MediaQuery.of(context);
  return WillPopScope(
   onWillPop: () async{
     return false;
   },
    child: Scaffold(
     backgroundColor: appTheme.bgColor,
        body: SafeArea(
          child: Container(
              width: double.maxFinite,
              padding: EdgeInsets.symmetric(horizontal: 56.h),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                   CustomImageView(
                       imagePath: ImageConstant.imgGroup34160,
                       height: 154.adaptSize,
                       width: 154.adaptSize),
                   SizedBox(height: 26.v),
                   Text("msg_password_reset_successfully".tr,
                       style: theme.textTheme.titleLarge),
                   SizedBox(height: 11.v),
                   SizedBox(
                       width: 312.h,
                       child: Text("msg_you_have_successfully".tr,
                           maxLines: 2,
                           overflow: TextOverflow.ellipsis,
                           textAlign: TextAlign.center,
                           style: theme.textTheme.bodyLarge!
                               .copyWith(height: 1.50))),
                   SizedBox(height: 28.v),
                   CustomElevatedButton(
                       text: "lbl_go_to_login".tr,
                       margin: EdgeInsets.only(left: 33.h, right: 31.h),
                       onPressed: () {
                        onTapGoToLogin();
                       }),
                   SizedBox(height: 5.v)
                  ])),
        )),
  );
 }

 /// Navigates to the logInScreenWithActiveScreen when the action is triggered.
 onTapGoToLogin() {
  Get.offAllNamed(AppRoutes.logInScreen);
 }
}





