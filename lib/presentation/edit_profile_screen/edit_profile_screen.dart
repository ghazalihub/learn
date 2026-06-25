import 'package:flutter/material.dart';
import 'package:flutter_elearning_app/core/app_export.dart';
import 'package:flutter_elearning_app/core/utils/validation_functions.dart';
import 'package:flutter_elearning_app/widgets/app_bar/appbar_leading_image.dart';
import 'package:flutter_elearning_app/widgets/app_bar/appbar_subtitle.dart';
import 'package:flutter_elearning_app/widgets/app_bar/custom_app_bar.dart';
import 'package:flutter_elearning_app/widgets/custom_elevated_button.dart';
import 'package:flutter_elearning_app/widgets/custom_icon_button.dart';
import 'package:flutter_elearning_app/widgets/custom_text_form_field.dart';
import 'controller/edit_profile_controller.dart';


class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
 EditProfileController controller = Get.put(EditProfileController());
 GlobalKey<FormState> _formKey = GlobalKey<FormState>();


 @override
  void initState() {
   controller.fullNameController.text = "Ronald Richards";
    controller.emailController.text = "msg_ronaldrichards_gmail_com".tr;
    controller.phoneNumberController.text = "405-555-0128";
    // TODO: implement initState
    super.initState();
  }

 @override
 Widget build(BuildContext context) {
  mediaQueryData = MediaQuery.of(context);
  return Scaffold(
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
                         horizontal: 16.h, vertical: 40.v),
                     child: Column(children: [
                      SizedBox(
                          height: 100.adaptSize,
                          width: 100.adaptSize,
                          child: Stack(
                              alignment: Alignment.bottomRight,
                              children: [
                               CustomImageView(
                                   imagePath: ImageConstant
                                       .imgEllipse225100x100,
                                   height: 100.adaptSize,
                                   width: 100.adaptSize,
                                   radius: BorderRadius.circular(50.h),
                                   alignment: Alignment.center),
                               Padding(
                                   padding: EdgeInsets.only(bottom: 4.v),
                                   child: CustomIconButton(
                                       height: 28.adaptSize,
                                       width: 28.adaptSize,
                                       padding: EdgeInsets.all(5.h),
                                       decoration: IconButtonStyleHelper
                                           .outlineBlackTL141,
                                       alignment: Alignment.bottomRight,
                                       child: CustomImageView(
                                           imagePath: ImageConstant
                                               .imgCameraOnprimary)))
                              ])),
                      SizedBox(height: 42.v),
                      _buildMasterUsername(),
                      SizedBox(height: 18.v),
                      _buildEmailAddress(),
                      SizedBox(height: 18.v),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Text("lbl_phone_number".tr,
                              style: theme.textTheme.bodyLarge)),
                       SizedBox(height: 6.v),
                     phone_number_field(controller.phoneNumberController,
                             (p0) {
                           if (p0 == null || p0.isEmpty) {
                             return "Please enter valid number";
                           }
                           return null;
                         }),
                      SizedBox(height: 5.v)
                     ]))
                ]))),
      ),
      bottomNavigationBar: _buildSave());
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
          title: AppbarSubtitle(text: "lbl_edit_profile".tr)));
 }

 /// Section Widget
 Widget _buildMasterUsername() {
  return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
   Text("lbl_full_name2".tr, style: theme.textTheme.bodyLarge),
   SizedBox(height: 6.v),
   CustomTextFormField(
       controller: controller.fullNameController,
       hintText: "lbl_full_name2".tr)
  ]);
 }

 /// Section Widget
 Widget _buildEmailAddress() {
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



 /// Section Widget
 Widget _buildSave() {
  return CustomElevatedButton(
    onPressed: (){
      Get.back();
    },
      text: "lbl_save".tr,
      margin: EdgeInsets.only(left: 16.h, right: 16.h, bottom: 40.v));
 }

 /// Navigates to the previous screen.
 onTapArrowLeft() {
  Get.back();
 }
}







