// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_elearning_app/core/app_export.dart';
import 'package:flutter_elearning_app/widgets/app_bar/appbar_leading_image.dart';
import 'package:flutter_elearning_app/widgets/app_bar/appbar_subtitle.dart';
import 'package:flutter_elearning_app/widgets/app_bar/custom_app_bar.dart';
import 'package:flutter_elearning_app/widgets/custom_elevated_button.dart';
import 'package:pinput/pinput.dart';
import 'controller/verification_controller.dart';


class VerificationScreen extends StatefulWidget {
  const VerificationScreen({super.key});

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  VerificationController controller= Get.put(VerificationController());
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
          body: SafeArea(
            child: SizedBox(
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
                          RichText(
                              text: TextSpan(children: [
                                TextSpan(
                                    text: "lbl_code_sent_to".tr,
                                    style: theme.textTheme.bodyLarge),
                                TextSpan(
                                    text: "msg_ronaldrichards_gmail_com".tr,
                                    style: CustomTextStyles.titleMedium16_1)
                              ]),
                              textAlign: TextAlign.left),
                          SizedBox(height: 16.v),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 3.h),
                            child: Obx(() =>
                                Pinput(
                                  errorTextStyle:  TextStyle(
                                    color:appTheme.red,
                                    fontSize: 14.fSize,
                                    fontFamily: 'SF Pro Display',
                                    fontWeight: FontWeight.w400,
                                  ),
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  disabledPinTheme: PinTheme(
                                      padding: EdgeInsets.only(left: 8.h,right: 8.h),
                                      decoration: BoxDecoration(color: Colors.red)
                                  ),
                                  controller: controller.otpController.value,
                                  length: 6,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Please enter valid OTP";
                                    }
                                    return null;
                                  },
                                  errorPinTheme: PinTheme(
                                    padding: EdgeInsets.only(left: 9.6.h,right: 9.6.h),
                                    decoration: BoxDecoration(
                                      border: Border.all(color:appTheme.red, ),
                                      borderRadius:  BorderRadius.circular(
                                        12.h,),
                                    ),
                                    textStyle: CustomTextStyles.bodyLargeGray700.copyWith(
                                      color: appTheme.red,
                                    ),
                                    width: 50.h,
                                    height: 50.h,
                                  ),
                                  defaultPinTheme: PinTheme(
                                    padding: EdgeInsets.only(left: 9.6.h,right: 9.6.h),
                                    width: 50.h,
                                    height: 50.h,
                                    textStyle:TextStyle(
                                      color: appTheme.black900,
                                      fontSize: 24.fSize,
                                      fontFamily: 'SF Pro Display',
                                      fontWeight: FontWeight.w400,
                                    ),
                                    decoration: BoxDecoration(
                                      color:appTheme.bgColor,
                                      border: Border.all(color:appTheme.borderColor ),
                                      borderRadius:  BorderRadius.circular(
                                        12.h,),

                                    ),
                                  ),
                                ),
                            ),












                            // Obx(() => CustomPinCodeTextField(
                            //     context: Get.context!,
                            //     controller: controller.otpController.value,
                            //     onChanged: (value) {})
                            // )
                          ),
                          SizedBox(height: 30.v),
                          CustomElevatedButton(
                              text: "lbl_verify".tr,
                              onPressed: () {
                                if(_formKey.currentState!.validate()){
                                  onTapVerify();
                                }
                              }),
                          SizedBox(height: 18.v),
                          RichText(
                              text: TextSpan(children: [
                                TextSpan(
                                    text: "msg_don_t_receive_an2".tr,
                                    style: CustomTextStyles.bodyLargeBlack900),
                                TextSpan(
                                    text: "lbl_resend_now".tr,
                                    style: CustomTextStyles.titleMediumBlack90016)
                              ]),
                              textAlign: TextAlign.left),
                          SizedBox(height: 5.v)
                        ]))
                  ]),
                )),
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
                margin: EdgeInsets.only(left: 20.h, top: 1.v, bottom: 1.v),
                onTap: () {
                  onTapArrowLeft();
                }),
            centerTitle: true,
            title: AppbarSubtitle(text: "lbl_verification".tr)));
  }

  /// Navigates to the previous screen.
  onTapArrowLeft() {
    Get.back();
  }

  /// Navigates to the resetPasswordScreen when the action is triggered.
  onTapVerify() {
    Get.toNamed(
      AppRoutes.resetPasswordScreen,
    );
  }
}





