// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_elearning_app/core/app_export.dart';
import 'package:flutter_elearning_app/core/utils/validation_functions.dart';
import 'package:flutter_elearning_app/widgets/custom_elevated_button.dart';
import 'package:flutter_elearning_app/widgets/custom_text_form_field.dart';
import 'controller/sign_up_controller.dart';



class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
 SignUpController controller = Get.put(SignUpController());
 GlobalKey<FormState> _formKey = GlobalKey<FormState>();

 @override
 Widget build(BuildContext context) {
  mediaQueryData = MediaQuery.of(context);
  return WillPopScope(
    onWillPop: ()async {
      Get.back();
      return true;
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
                       child: Text("lbl_sign_up".tr,
                           style: theme.textTheme.headlineMedium)),
                   SizedBox(height: 11.v),
                   Align(
                       alignment: Alignment.centerLeft,
                       child: Text("msg_join_the_revolution".tr,
                           style: theme.textTheme.bodyLarge)),
                   SizedBox(height: 26.v),
                   _buildMasterUsername(),
                   SizedBox(height: 18.v),
                   _buildMasterUsername1(),
                   SizedBox(height: 18.v),
                   Align(
                       alignment: Alignment.centerLeft,
                       child: Text("lbl_phone_number".tr,
                           style: theme.textTheme.bodyLarge)),
                   SizedBox(height: 5.v),
                   _buildThirtyTwo(),
                   SizedBox(height: 18.v),
                   _buildMasterUsername2(),
                   SizedBox(height: 33.v),
                   _buildLogIn(),
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
                        _buildOrContinueWith()
                       ])),
                   SizedBox(height: 26.v),
                   _buildSocial(),
               Spacer(),
                   GestureDetector(
                       onTap: () {
                        onTapTxtAlreadyhavean();
                       },
                       child: RichText(
                           text: TextSpan(children: [
                            TextSpan(
                                text: "msg_already_have_an2".tr,
                                style: CustomTextStyles.bodyLargeBlack900),
                            TextSpan(
                                text: "lbl_sign_in".tr,
                                style:
                                CustomTextStyles.titleMediumBlack90016)
                           ]),
                           textAlign: TextAlign.left))
                  ]))),
        )),
  );
 }

 /// Section Widget
 Widget _buildFullName() {
  return CustomTextFormField(
    validator: (value) {
      if (value == null || value.isEmpty) {
        return "Please enter full name";
      }
      return null;
    },
      controller: controller.fullNameController,
      hintText: "lbl_full_name".tr);
 }

 /// Section Widget
 Widget _buildMasterUsername() {
  return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
   Text("lbl_full_name".tr, style: theme.textTheme.bodyLarge),
   SizedBox(height: 6.v),
   _buildFullName()
  ]);
 }

 /// Section Widget
 Widget _buildEmail() {
  return CustomTextFormField(
      controller: controller.emailController,
      hintText: "lbl_email_address".tr,
      textInputType: TextInputType.emailAddress,
      validator: (value) {
       if (value == null || (!isValidEmail(value, isRequired: true))) {
        return "err_msg_please_enter_valid_email".tr;
       }
       return null;
      });
 }

 /// Section Widget
 Widget _buildMasterUsername1() {
  return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
   Text("lbl_email_address".tr, style: theme.textTheme.bodyLarge),
   SizedBox(height: 6.v),
   _buildEmail()
  ]);
 }

 /// Section Widget
 Widget _buildThirtyTwo() {
  return  phone_number_field(controller.phoneNumberController,
          (p0) {
        if (p0 == null || p0.isEmpty) {
          return "Please enter valid number";
        }
        return null;
      });
 }

 /// Section Widget
 Widget _buildPassword() {
  return Obx(() => CustomTextFormField(
    validator: (value) {
      if (value == null || value.isEmpty) {
        return "Please enter password";
      }
      return null;
    },
      hintText: "lbl_password".tr,
      controller: controller.passwordController,
      textInputAction: TextInputAction.done,
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
      suffixConstraints: BoxConstraints(maxHeight: 54.v),
      obscureText: controller.isShowPassword.value));
 }

 /// Section Widget
 Widget _buildMasterUsername2() {
  return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
   Text("lbl_password".tr, style: theme.textTheme.bodyLarge),
   SizedBox(height: 6.v),
   _buildPassword()
  ]);
 }

 /// Section Widget
 Widget _buildLogIn() {
  return CustomElevatedButton(
      text: "lbl_sign_up".tr,
      onPressed: () {
        if(_formKey.currentState!.validate()){
          Get.back();
        }

      });
 }

 /// Section Widget
 Widget _buildOrContinueWith() {
  return Container(
    color: appTheme.bgColor,
    child: Padding(
      padding:  EdgeInsets.symmetric(horizontal: 8.h),
      child: Text("msg_or_continue_with".tr,style: theme.textTheme.bodyLarge!,),
    ),
  );
 }

 /// Section Widget
 Widget _buildGoogle() {
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
 Widget _buildFacebook() {
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
          children: [_buildGoogle(), _buildFacebook()]));
 }

 /// Navigates to the homeScreenContainerScreen when the action is triggered.
 onTapLogIn() {
  Get.toNamed(
   AppRoutes.homeScreenContainerScreen,
  );
 }

 /// Navigates to the homeScreenContainerScreen when the action is triggered.
 onTapGoogle() {
  Get.toNamed(
   AppRoutes.homeScreenContainerScreen,
  );
 }

 /// Navigates to the homeScreenContainerScreen when the action is triggered.
 onTapFacebook() {
  Get.toNamed(
   AppRoutes.homeScreenContainerScreen,
  );
 }

 /// Navigates to the logInScreen when the action is triggered.
 onTapTxtAlreadyhavean() {
  Get.back();
 }
}



