// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_elearning_app/core/app_export.dart';
import 'package:flutter_elearning_app/core/utils/validation_functions.dart';
import 'package:flutter_elearning_app/widgets/custom_elevated_button.dart';
import 'package:flutter_elearning_app/widgets/custom_text_form_field.dart';
import 'controller/log_in_controller.dart';


class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
 GlobalKey<FormState> _formKey = GlobalKey<FormState>();
 LogInController controller = Get.put(LogInController());



 @override
 Widget build(BuildContext context) {
  mediaQueryData = MediaQuery.of(context);
  return PopScope(
   canPop: false,
   onPopInvokedWithResult: (didPop, result) {
    if (didPop) return;
    closeApp();
   },
   child: Scaffold(
     backgroundColor: appTheme.bgColor,
       resizeToAvoidBottomInset: false,
       body: SafeArea(
         child: Form(
             key: _formKey,
             child: Container(
                 width: double.maxFinite,
                 padding:
                 EdgeInsets.symmetric(horizontal: 16.h, vertical: 40.v),
                 child: Column(children: [
                  SizedBox(height: 4.v),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text("lbl_log_in".tr,
                          style: theme.textTheme.headlineMedium)),
                  SizedBox(height: 11.v),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text("msg_log_in_to_your_account".tr,
                          style: theme.textTheme.bodyLarge)),
                  SizedBox(height: 26.v),
                  _buildMasterUsername(),
                  SizedBox(height: 18.v),
                  _buildMasterUsername1(),
                  SizedBox(height: 19.v),
                  Align(
                      alignment: Alignment.centerRight,
                      child: GestureDetector(
                          onTap: () {
                           onTapTxtForgotPassword();
                          },
                          child: Text("msg_forgot_password".tr,
                              style:
                              CustomTextStyles.bodyLargeBlack900_1))),
                  SizedBox(height: 30.v),
                  _buildLoginButton(),
                  SizedBox(height: 26.v),
                  SizedBox(
                      height: 24.v,
                      width: 314.h,
                      child: Stack(alignment: Alignment.center, children: [
                       Align(
                           alignment: Alignment.topCenter,
                           child: Padding(
                               padding: EdgeInsets.only(top: 11.v),
                               child: SizedBox(
                                   width: 314.h, child: Divider()))),
                       _buildOrContinueWithButton()
                      ])),
                  SizedBox(height: 26.v),
                  _buildSocial(),
                  Spacer(),
                  GestureDetector(
                      onTap: () {
                       onTapTxtDonthaveanaccount();
                      },
                      child: RichText(
                          text: TextSpan(children: [
                           TextSpan(
                               text: "msg_don_t_have_an_account2".tr,
                               style: CustomTextStyles.bodyLargeBlack900),
                           TextSpan(
                               text: "lbl_sign_up".tr,
                               style:
                               CustomTextStyles.titleMediumBlack90016)
                          ]),
                          textAlign: TextAlign.left))
                 ]))),
       )),
  );
 }

 /// Section Widget
 Widget _buildEmailField() {
  return CustomTextFormField(
      controller: controller.emailFieldController,
      hintText: "msg_enter_your_email".tr,
      textInputType: TextInputType.emailAddress,
      validator: (value) {
       if (value == null || (!isValidEmail(value, isRequired: true)) || value.isEmpty) {
        return "err_msg_please_enter_valid_email".tr;
       }
       return null;
      });
 }

 /// Section Widget
 Widget _buildMasterUsername() {
  return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
   Text("lbl_email_address".tr, style: theme.textTheme.bodyLarge),
   SizedBox(height: 6.v),
   _buildEmailField()
  ]);
 }

 /// Section Widget
 Widget _buildPasswordField() {
  return Obx(() => CustomTextFormField(
      controller: controller.passwordFieldController,
      hintText: "msg_enter_your_password".tr,
      textInputAction: TextInputAction.done,
      textInputType: TextInputType.visiblePassword,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "err_msg_please_enter_valid_password".tr;
        }
        return null;
      },
      suffix: InkWell(
          onTap: () {
            controller.isShowPassword.value =
            !controller.isShowPassword.value;
          },
          child: Container(
              margin: EdgeInsets.fromLTRB(30.h, 15.v, 16.h, 15.v),
              child: CustomImageView(
                  color: appTheme.black900,
                  imagePath:controller.isShowPassword.value? ImageConstant.imgCheckmark:ImageConstant.imgEyeOpen,
                  height: 24.adaptSize,
                  width: 24.adaptSize))),
      obscureText: controller.isShowPassword.value));
 }

 /// Section Widget
 Widget _buildMasterUsername1() {
  return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
   Text("lbl_password".tr, style: theme.textTheme.bodyLarge),
   SizedBox(height: 6.v),
   _buildPasswordField()
  ]);
 }

 /// Section Widget
 Widget _buildLoginButton() {
  return Obx(() => CustomElevatedButton(
      text: controller.isLoading.value ? "Loading..." : "lbl_log_in".tr,
      onPressed: controller.isLoading.value ? null : () {
        if(_formKey.currentState!.validate()){
          controller.login();
        }
      }));
 }

 /// Section Widget
 Widget _buildOrContinueWithButton() {
  return Container(
    color: appTheme.bgColor,
    child: Padding(
      padding:  EdgeInsets.symmetric(horizontal: 8.h),
      child: Text("msg_or_continue_with".tr,style: theme.textTheme.bodyLarge!,),
    ),
  );

 }

 /// Section Widget
 Widget _buildGoogleButton() {
  return Expanded(
      child: CustomElevatedButton(
          height: 54.v,
          text: "lbl_google".tr,
          margin: EdgeInsets.only(right: 8.h),
          leftIcon: Container(
              margin: EdgeInsets.only(right: 12.h),
              child: CustomImageView(
                  imagePath: ImageConstant.imgGoogle,
                  height: 24.adaptSize,
                  width: 24.adaptSize)),
          buttonStyle: CustomButtonStyles.fillGray.copyWith(
            backgroundColor: MaterialStatePropertyAll(appTheme.containerbgColor),
          ),
          buttonTextStyle: CustomTextStyles.titleMedium16,
          onPressed: () {

          }));
 }

 /// Section Widget
 Widget _buildFacebookButton() {
  return Expanded(
      child: CustomElevatedButton(
          height: 54.v,
          text: "lbl_facebook".tr,
          margin: EdgeInsets.only(left: 8.h),
          leftIcon: Container(
              padding: EdgeInsets.symmetric(horizontal: 8.h, vertical: 5.v),
              margin: EdgeInsets.only(right: 12.h),
              decoration: BoxDecoration(
                  color: appTheme.blueA200,
                  borderRadius: BorderRadius.circular(12.h)),
              child: CustomImageView(
                  imagePath: ImageConstant.imgFacebook,
                  height: 13.v,
                  width: 7.h)),
          buttonStyle: CustomButtonStyles.fillGray.copyWith(
            backgroundColor: MaterialStatePropertyAll(appTheme.containerbgColor),
          ),
          buttonTextStyle: CustomTextStyles.titleMedium16,
          onPressed: () {

          }));
 }

 /// Section Widget
 Widget _buildSocial() {
  return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.h),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [_buildGoogleButton(), _buildFacebookButton()]));
 }

 /// Navigates to the forgotPasswordScreen when the action is triggered.
 onTapTxtForgotPassword() {
  Get.toNamed(
   AppRoutes.forgotPasswordScreen,
  );
 }

 /// Navigates to the homeScreenContainerScreen when the action is triggered.
 onTapLoginButton() {
  Get.toNamed(
   AppRoutes.homeScreenContainerScreen,
  );
 }

 /// Navigates to the homeScreenContainerScreen when the action is triggered.
 onTapGoogleButton() {
  Get.toNamed(
   AppRoutes.homeScreenContainerScreen,
  );
 }

 /// Navigates to the homeScreenContainerScreen when the action is triggered.
 onTapFacebookButton() {
  Get.toNamed(
   AppRoutes.homeScreenContainerScreen,
  );
 }

 /// Navigates to the signUpScreen when the action is triggered.
 onTapTxtDonthaveanaccount() {
  Get.toNamed(
   AppRoutes.signUpScreen,
  );
 }
}





