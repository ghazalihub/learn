import 'package:flutter/material.dart';
import 'package:flutter_elearning_app/core/app_export.dart';
import 'package:flutter_elearning_app/core/utils/validation_functions.dart';
import 'package:flutter_elearning_app/widgets/app_bar/appbar_leading_image.dart';
import 'package:flutter_elearning_app/widgets/app_bar/appbar_subtitle.dart';
import 'package:flutter_elearning_app/widgets/app_bar/custom_app_bar.dart';
import 'package:flutter_elearning_app/widgets/custom_elevated_button.dart';
import 'package:flutter_elearning_app/widgets/custom_text_form_field.dart';
import 'controller/add_new_cards_controller.dart';




class AddNewCardsScreen extends StatefulWidget {
  const AddNewCardsScreen({super.key});

  @override
  State<AddNewCardsScreen> createState() => _AddNewCardsScreenState();
}

class _AddNewCardsScreenState extends State<AddNewCardsScreen> {
 AddNewCardsController controller = Get.put(AddNewCardsController());
 GlobalKey<FormState> _formKey = GlobalKey<FormState>();

 @override
 Widget build(BuildContext context) {
  mediaQueryData = MediaQuery.of(context);
  return Scaffold(
   backgroundColor: appTheme.bgColor,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Form(
            key: _formKey,
            child: Column(children: [
             _buildHeader(),
             Container(
                 padding: EdgeInsets.symmetric(
                     horizontal: 16.h, vertical: 12.v),
                 child: Column(children: [
                  Container(
                      width: 364.h,
                      margin: EdgeInsets.symmetric(horizontal: 15.h),
                      child: RichText(
                          text: TextSpan(children: [
                           TextSpan(
                               text: "msg_enter_your_card2".tr,
                               style: theme.textTheme.bodyLarge),
                           TextSpan(
                               text: "lbl_learn_more".tr,
                               style:
                               CustomTextStyles.bodyLargePrimary)
                          ]),
                          textAlign: TextAlign.center)),
                  SizedBox(height: 23.v),
                  _buildMasterUsernameColumn(),
                  SizedBox(height: 18.v),
                  _buildExpirydate(),
                  SizedBox(height: 30.v),
                  _buildAddNewCardButton(),
                  SizedBox(height: 5.v)
                 ]))
            ])),
      ));
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
          title: AppbarSubtitle(text: "lbl_add_new_card".tr)));
 }

 /// Section Widget
 Widget _buildCardNumberEditText() {
  return CustomTextFormField(
      controller: controller.cardNumberEditTextController,
      hintText: "msg_enter_your_card3".tr,
      textInputType: TextInputType.number,
      validator: (value) {
       if (!isNumeric(value)) {
        return "err_msg_please_enter_valid_number".tr;
       }
       return null;
      });
 }

 /// Section Widget
 Widget _buildMasterUsernameColumn() {
  return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
   Text("lbl_card_number".tr, style: theme.textTheme.bodyLarge),
   SizedBox(height: 6.v),
   _buildCardNumberEditText()
  ]);
 }

 /// Section Widget
 Widget _buildExpiryDateEditText() {
  return CustomTextFormField(
      textInputType: TextInputType.datetime,
      width: 190.h,
      controller: controller.expiryDateEditTextController,
      hintText: "lbl_mm_yy".tr,
      contentPadding: EdgeInsets.symmetric(horizontal: 7.h, vertical: 17.v));
 }

 /// Section Widget
 Widget _buildCvvEditText() {
  return CustomTextFormField(
      textInputType: TextInputType.number,
      width: 190.h,
      controller: controller.cvvEditTextController,
      hintText: "lbl_123".tr,
      textInputAction: TextInputAction.done,
      contentPadding: EdgeInsets.symmetric(horizontal: 7.h, vertical: 17.v));
 }

 /// Section Widget
 Widget _buildExpirydate() {
  return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
   Expanded(
       child: Padding(
           padding: EdgeInsets.only(top: 1.v, right: 8.h),
           child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                Text("lbl_expiry_date".tr,
                    style: theme.textTheme.bodyLarge),
                SizedBox(height: 5.v),
                _buildExpiryDateEditText()
               ]))),
   Expanded(
       child: Padding(
           padding: EdgeInsets.only(left: 8.h),
           child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                Text("lbl_cvv".tr, style: theme.textTheme.bodyLarge),
                SizedBox(height: 6.v),
                _buildCvvEditText()
               ])))
  ]);
 }

 /// Section Widget
 Widget _buildAddNewCardButton() {
  return CustomElevatedButton(
      text: "lbl_add_new_card".tr,
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          Get.snackbar("Success", "Card added successfully!");
          Get.back();
        }
      });
 }

 /// Navigates to the previous screen.
 onTapArrowLeft() {
  Get.back();
 }

 /// Navigates to the myCardsScreen when the action is triggered.
 onTapAddNewCardButton() {
  Get.toNamed(
   AppRoutes.myCardsScreen,
  );
 }
}






