// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_elearning_app/core/app_export.dart';
import 'package:flutter_elearning_app/core/utils/validation_functions.dart';
import 'package:flutter_elearning_app/widgets/app_bar/appbar_leading_image.dart';
import 'package:flutter_elearning_app/widgets/app_bar/appbar_subtitle.dart';
import 'package:flutter_elearning_app/widgets/app_bar/custom_app_bar.dart';
import 'package:flutter_elearning_app/widgets/custom_elevated_button.dart';
import 'package:flutter_elearning_app/widgets/custom_text_form_field.dart';
import 'controller/forgot_password_controller.dart';




class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
 ForgotPasswordController controller = Get.put(ForgotPasswordController());
 GlobalKey<FormState> _formKey = GlobalKey<FormState>();

 @override
 Widget build(BuildContext context) {
  mediaQueryData = MediaQuery.of(context);
  return WillPopScope(
   onWillPop: () async{
    Get.back();
     return true;
   },
    child: Scaffold(
     backgroundColor: appTheme.bgColor,
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Form(
              key: _formKey,
              child: SizedBox(
                  width: double.maxFinite,
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
                        SizedBox(height: 23.v),
                        _buildMasterUsername(),
                        SizedBox(height: 30.v),
                        CustomElevatedButton(
                            text: "lbl_send".tr,
                            onPressed: () {
                             onTapSend();
                            }),
                        SizedBox(height: 5.v)
                       ]))
                  ]))),
        )),
  );
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
          title: AppbarSubtitle(text: "lbl_forgot_password".tr)));
 }

 /// Section Widget
 Widget _buildMasterUsername() {
  return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
   Text("lbl_email_address".tr, style: theme.textTheme.bodyLarge),
   SizedBox(height: 6.v),
   CustomTextFormField(
       controller: controller.emailController,
       hintText: "lbl_email_address".tr,
       textInputAction: TextInputAction.done,
       textInputType: TextInputType.emailAddress,
       validator: (value) {
        if (value == null || (!isValidEmail(value, isRequired: true))) {
         return "err_msg_please_enter_valid_email".tr;
        }
        return null;
       })
  ]);
 }

 /// Navigates to the previous screen.
 onTapArrowLeft() {
  Get.back();
 }

 /// Navigates to the verificationScreen when the action is triggered.
 onTapSend() {
  if(_formKey.currentState!.validate()){
   Get.toNamed(
    AppRoutes.verificationScreen,
   );

  }


 }
}








