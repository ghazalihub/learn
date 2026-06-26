import 'package:flutter_elearning_app/services/auth_service.dart';
// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_elearning_app/core/app_export.dart';
import 'package:flutter_elearning_app/widgets/app_bar/appbar_leading_image.dart';
import 'package:flutter_elearning_app/widgets/app_bar/appbar_subtitle.dart';
import 'package:flutter_elearning_app/widgets/app_bar/custom_app_bar.dart';
import 'package:flutter_elearning_app/widgets/custom_elevated_button.dart';
import 'package:flutter_elearning_app/widgets/custom_text_form_field.dart';
import 'controller/reset_password_controller.dart';



class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
 ResetPasswordController controller = Get.put(ResetPasswordController());
 GlobalKey<FormState> _formKey = GlobalKey<FormState>();
 @override
 Widget build(BuildContext context) {
  mediaQueryData = MediaQuery.of(context);
  return PopScope(
   canPop: true,
   onPopInvokedWithResult: (didPop, result) {
    if (didPop) return;
    // Get.back();
   },
   child: Scaffold(
          backgroundColor: appTheme.bgColor,
          resizeToAvoidBottomInset: false,
          body: SizedBox(
              width: double.maxFinite,
              child: Form(
               key: _formKey,
               child: Column(children: [
                _buildHeader(),
                Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: 16.h, vertical: 12.v),
                    child: Column(children: [
                     Container(
                         width: 375.h,
                         margin: EdgeInsets.only(left: 9.h, right: 11.h),
                         child: Text("msg_forgot_your_password".tr,
                             maxLines: 2,
                             overflow: TextOverflow.ellipsis,
                             textAlign: TextAlign.center,
                             style: theme.textTheme.bodyLarge!
                                 .copyWith(height: 1.50))),
                     SizedBox(height: 25.v),
                     _buildMasterUsername(),
                     SizedBox(height: 19.v),
                     _buildMasterUsername1(),
                     SizedBox(height: 30.v),
                     CustomElevatedButton(
                         text: "lbl_reset_password".tr,
                         onPressed: () {
                          if(_formKey.currentState!.validate()){
                           onTapResetPassword();
                          }


                         }),
                     SizedBox(height: 5.v)
                    ]))
               ]),
              ))));
 }

 /// Section Widget
 Widget _buildHeader() {
  return Container(
      padding: EdgeInsets.symmetric(vertical: 20.v),
      decoration: AppDecoration.white,
      child: CustomAppBar(
          leadingWidth: 44.h,
          leading: AppbarLeadingImage(
              imagePath: ImageConstant.imgArrowLeft,
              margin: EdgeInsets.only(left: 20.h, bottom: 3.v),
              onTap: () {
               onTapArrowLeft();
              }),
          centerTitle: true,
          title: AppbarSubtitle(text: "lbl_reset_password".tr)));
 }

 /// Section Widget
 Widget _buildMasterUsername() {
  return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
   Text("lbl_new_password".tr, style: theme.textTheme.bodyLarge),
   SizedBox(height: 5.v),
   Obx(() => CustomTextFormField(
    validator: (value) {
      if (value == null ||value.isEmpty) {
       return "Please enter password";
      }
      return null;
    },
    hintText: "lbl_new_password".tr,
       controller: controller.newpasswordController,
       suffix: InkWell(
           onTap: () {
            controller.isShowPassword.value =
            !controller.isShowPassword.value;
           },
           child: Container(
               margin: EdgeInsets.fromLTRB(30.h, 15.v, 16.h, 15.v),
               child: CustomImageView(
                 color: appTheme.black900,
                   imagePath:   controller.isShowPassword.value?ImageConstant.imgCheckmark:ImageConstant.imgEyeOpen,
                   height: 24.adaptSize,
                   width: 24.adaptSize))),
       suffixConstraints: BoxConstraints(maxHeight: 54.v),
       obscureText: controller.isShowPassword.value))
  ]);
 }

 /// Section Widget
 Widget _buildMasterUsername1() {
  return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
   Text("msg_confirm_password".tr, style: theme.textTheme.bodyLarge),
   SizedBox(height: 5.v),
   Obx(() => CustomTextFormField(
       validator: (value) {
        if (value == null ||value.isEmpty) {
         return "Please enter password";
        }
        return null;
       },
    hintText: "msg_confirm_password".tr,
       controller: controller.confirmpasswordController,
       textInputAction: TextInputAction.done,
       suffix: InkWell(
           onTap: () {
            controller.isShowPassword1.value =
            !controller.isShowPassword1.value;
           },
           child: Container(
               margin: EdgeInsets.fromLTRB(30.h, 15.v, 16.h, 15.v),
               child: CustomImageView(
                   color: appTheme.black900,
                   imagePath:  controller.isShowPassword1.value?ImageConstant.imgCheckmark:ImageConstant.imgEyeOpen,
                   height: 24.adaptSize,
                   width: 24.adaptSize))),
       suffixConstraints: BoxConstraints(maxHeight: 54.v),
       obscureText: controller.isShowPassword1.value))
  ]);
 }

 /// Navigates to the previous screen.
 onTapArrowLeft() {
  Get.back();
 }

 /// Navigates to the resetPasswordSuccessScreen when the action is triggered.
 onTapResetPassword() {
  // In a real app, you would use a code from verification screen
  Get.find<AuthService>().resetPassword(Get.arguments ?? "user@example.com").then((_) {
    Get.toNamed(
     AppRoutes.resetPasswordSuccessScreen,
    );
  });
 }
}




