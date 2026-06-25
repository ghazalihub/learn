import 'controller/log_in_screen_with_active_controller.dart';import 'package:flutter/material.dart';import 'package:flutter_elearning_app/core/app_export.dart';import 'package:flutter_elearning_app/core/utils/validation_functions.dart';import 'package:flutter_elearning_app/widgets/custom_elevated_button.dart';import 'package:flutter_elearning_app/widgets/custom_text_form_field.dart';
// ignore_for_file: must_be_immutable
class LogInScreenWithActiveScreen extends GetWidget<LogInScreenWithActiveController> {LogInScreenWithActiveScreen({Key? key}) : super(key: key);

GlobalKey<FormState> _formKey = GlobalKey<FormState>();

@override Widget build(BuildContext context) { mediaQueryData = MediaQuery.of(context); return SafeArea(child: Scaffold(resizeToAvoidBottomInset: false, body: Form(key: _formKey, child: Container(width: double.maxFinite, padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 40.v), child: Column(children: [SizedBox(height: 4.v), Align(alignment: Alignment.centerLeft, child: Text("lbl_log_in".tr, style: theme.textTheme.headlineMedium)), SizedBox(height: 11.v), Align(alignment: Alignment.centerLeft, child: Text("msg_log_in_to_your_account".tr, style: theme.textTheme.bodyLarge)), SizedBox(height: 26.v), _buildMasterUsername(), SizedBox(height: 18.v), _buildMasterUsername1(), SizedBox(height: 19.v), Align(alignment: Alignment.centerRight, child: GestureDetector(onTap: () {onTapTxtForgotPassword();}, child: Text("msg_forgot_password".tr, style: CustomTextStyles.bodyLargeBlack900_1))), SizedBox(height: 30.v), _buildLoginButton(), SizedBox(height: 26.v), SizedBox(height: 24.v, width: 314.h, child: Stack(alignment: Alignment.center, children: [Align(alignment: Alignment.topCenter, child: Padding(padding: EdgeInsets.only(top: 11.v), child: SizedBox(width: 314.h, child: Divider()))), _buildOrContinueWithButton()])), SizedBox(height: 26.v), _buildSocial(), Spacer(), GestureDetector(onTap: () {onTapTxtDonthaveanaccount();}, child: RichText(text: TextSpan(children: [TextSpan(text: "msg_don_t_have_an_account2".tr, style: CustomTextStyles.bodyLargeBlack900), TextSpan(text: "lbl_sign_up".tr, style: CustomTextStyles.titleMediumBlack90016)]), textAlign: TextAlign.left))]))))); } 
/// Section Widget
Widget _buildEmailField() { return CustomTextFormField(controller: controller.emailFieldController, hintText: "msg_ronaldrichard_gmail_com".tr, textInputType: TextInputType.emailAddress, validator: (value) {if (value == null || (!isValidEmail(value, isRequired: true))) {return "err_msg_please_enter_valid_email".tr;} return null;}); } 
/// Section Widget
Widget _buildMasterUsername() { return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text("lbl_email_address".tr, style: theme.textTheme.bodyLarge), SizedBox(height: 6.v), _buildEmailField()]); } 
/// Section Widget
Widget _buildPasswordField() { return CustomTextFormField(controller: controller.passwordFieldController, textInputAction: TextInputAction.done, obscureText: true); } 
/// Section Widget
Widget _buildMasterUsername1() { return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text("lbl_password".tr, style: theme.textTheme.bodyLarge), SizedBox(height: 6.v), _buildPasswordField()]); } 
/// Section Widget
Widget _buildLoginButton() { return CustomElevatedButton(text: "lbl_log_in".tr, onPressed: () {onTapLoginButton();}); } 
/// Section Widget
Widget _buildOrContinueWithButton() { return CustomElevatedButton(height: 24.v, width: 128.h, text: "msg_or_continue_with".tr, buttonStyle: CustomButtonStyles.fillWhiteA, buttonTextStyle: theme.textTheme.bodyLarge!, alignment: Alignment.center); } 
/// Section Widget
Widget _buildGoogleButton() { return Expanded(child: CustomElevatedButton(height: 54.v, text: "lbl_google".tr, margin: EdgeInsets.only(right: 8.h), leftIcon: Container(margin: EdgeInsets.only(right: 12.h), child: CustomImageView(imagePath: ImageConstant.imgGoogle, height: 24.adaptSize, width: 24.adaptSize)), buttonStyle: CustomButtonStyles.fillGray, buttonTextStyle: CustomTextStyles.titleMedium16, onPressed: () {onTapGoogleButton();})); } 
/// Section Widget
Widget _buildFacebookButton() { return Expanded(child: CustomElevatedButton(height: 54.v, text: "lbl_facebook".tr, margin: EdgeInsets.only(left: 8.h), leftIcon: Container(padding: EdgeInsets.symmetric(horizontal: 8.h, vertical: 5.v), margin: EdgeInsets.only(right: 12.h), decoration: BoxDecoration(color: appTheme.blueA200, borderRadius: BorderRadius.circular(12.h)), child: CustomImageView(imagePath: ImageConstant.imgFacebook, height: 13.v, width: 7.h)), buttonStyle: CustomButtonStyles.fillGray, buttonTextStyle: CustomTextStyles.titleMedium16, onPressed: () {onTapFacebookButton();})); } 
/// Section Widget
Widget _buildSocial() { return Padding(padding: EdgeInsets.symmetric(horizontal: 8.h), child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [_buildGoogleButton(), _buildFacebookButton()])); } 
/// Navigates to the forgotPasswordScreen when the action is triggered.
onTapTxtForgotPassword() { Get.toNamed(AppRoutes.forgotPasswordScreen, ); } 
/// Navigates to the homeScreenContainerScreen when the action is triggered.
onTapLoginButton() { Get.toNamed(AppRoutes.homeScreenContainerScreen, ); } 
/// Navigates to the homeScreenContainerScreen when the action is triggered.
onTapGoogleButton() { Get.toNamed(AppRoutes.homeScreenContainerScreen, ); } 
/// Navigates to the homeScreenContainerScreen when the action is triggered.
onTapFacebookButton() { Get.toNamed(AppRoutes.homeScreenContainerScreen, ); } 
/// Navigates to the signUpScreen when the action is triggered.
onTapTxtDonthaveanaccount() { Get.toNamed(AppRoutes.signUpScreen, ); } 
 }
