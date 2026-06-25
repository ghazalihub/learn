import 'package:flutter/material.dart';
import 'package:flutter_elearning_app/core/app_export.dart';
import 'package:flutter_elearning_app/widgets/app_bar/appbar_leading_image.dart';
import 'package:flutter_elearning_app/widgets/app_bar/appbar_subtitle.dart';
import 'package:flutter_elearning_app/widgets/app_bar/appbar_trailing_image.dart';
import 'package:flutter_elearning_app/widgets/app_bar/custom_app_bar.dart';
import 'package:flutter_elearning_app/widgets/custom_elevated_button.dart';

import '../instructor_details_screen/widgets/userprofile1_item_widget.dart';
import 'controller/instructor_details_controller.dart';
import 'models/userprofile1_item_model.dart';



class InstructorDetailsScreen extends StatefulWidget {
  const InstructorDetailsScreen({super.key});

  @override
  State<InstructorDetailsScreen> createState() => _InstructorDetailsScreenState();
}

class _InstructorDetailsScreenState extends State<InstructorDetailsScreen> {
 InstructorDetailsController controller = Get.put(InstructorDetailsController());
 @override
 Widget build(BuildContext context) {
  mediaQueryData = MediaQuery.of(context);
  return Scaffold(
      backgroundColor: appTheme.bgColor,
      body: SafeArea(
  child: SizedBox(
  width: double.maxFinite,
      child: Column(children: [
       _buildHeader(),
       SizedBox(height: 24.v),
       Expanded(
           child: SingleChildScrollView(
               child: Padding(
                   padding: EdgeInsets.only(
                       left: 16.h, right: 16.h, bottom: 5.v),
                   child: Column(children: [
                    CustomImageView(
                        imagePath: ImageConstant.imgEllipse225,
                        height: 100.adaptSize,
                        width: 100.adaptSize,
                        radius: BorderRadius.circular(50.h)),
                    SizedBox(height: 18.v),
                    Text("lbl_ronald_richards".tr,
                        style: theme.textTheme.titleMedium),
                    SizedBox(height: 10.v),
                    Text("msg_manager_at_solution2".tr,
                        style: CustomTextStyles.bodyLargeGray700),
                    SizedBox(height: 24.v),
                    _buildDoctorReviews(),
                    SizedBox(height: 18.v),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Text("lbl_about_me".tr,
                            style: CustomTextStyles
                                .titleMediumBlack900_1)),
                    SizedBox(height: 12.v),
                    SizedBox(
                        width: 392.h,
                        child: Text("msg_lorem_ipsum_dolor".tr,
                            maxLines: 4,
                            overflow: TextOverflow.ellipsis,
                            style: CustomTextStyles
                                .bodyLargeBlack900_1
                                .copyWith(height: 1.50))),
                    SizedBox(height: 17.v),
                    _buildRecentOrders(),
                    SizedBox(height: 16.v),
                    _buildUserProfile()
                   ]))))
      ])),
  ),
  bottomNavigationBar: _buildMessage());
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
          title: AppbarSubtitle(text: "msg_instructor_details".tr),
          actions: [
           AppbarTrailingImage(
               imagePath: ImageConstant.imgComputer,
               margin: EdgeInsets.only(left: 16.h, right: 16.h, bottom: 2.v))
          ]));
 }

 /// Section Widget
 Widget _buildDoctorReviews() {
  return Container(
      padding: EdgeInsets.symmetric(vertical: 16.v),
      decoration: AppDecoration.fillGray
          .copyWith(borderRadius: BorderRadiusStyle.roundedBorder12),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
       Padding(
           padding: EdgeInsets.symmetric(vertical: 2.v),
           child: _buildFiveHundred(
               userName: "lbl_25".tr, userReviews: "lbl_courses".tr)),
       SizedBox(
           height: 58.v, child: VerticalDivider(width: 1.h, thickness: 1.v)),
       Padding(
           padding: EdgeInsets.symmetric(vertical: 2.v),
           child: Column(children: [
            Text("lbl_999".tr,
                style: CustomTextStyles.titleMediumBlack900_1),
            SizedBox(height: 9.v),
            Text("lbl_students".tr,
                style: CustomTextStyles.titleMediumBlack900_1)
           ])),
       SizedBox(
           height: 58.v, child: VerticalDivider(width: 1.h, thickness: 1.v)),
       Padding(
           padding: EdgeInsets.symmetric(vertical: 2.v),
           child: _buildFiveHundred(
               userName: "lbl_500".tr, userReviews: "lbl_reviews".tr))
      ]));
 }

 /// Section Widget
 Widget _buildRecentOrders() {
  return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
   Text("lbl_my_courses".tr, style: CustomTextStyles.titleMediumBlack900_1),
   Padding(
       padding: EdgeInsets.only(bottom: 4.v),
       child: GestureDetector(
        onTap: (){
         Get.toNamed(AppRoutes.popularCoursesScreen);
        },
         child: Text("lbl_view_all".tr,
             style: CustomTextStyles.bodyMediumBlack900),
       ))
  ]);
 }

 /// Section Widget
 Widget _buildUserProfile() {
  return Obx(() => ListView.separated(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      separatorBuilder: (context, index) {
       return SizedBox(height: 16.v);
      },
      itemCount: controller
          .instructorDetailsModelObj.value.userprofile1ItemList.value.length,
      itemBuilder: (context, index) {
       Userprofile1ItemModel model = controller.instructorDetailsModelObj
           .value.userprofile1ItemList.value[index];
       return Userprofile1ItemWidget(model);
      }));
 }

 /// Section Widget
 Widget _buildMessage() {
  return CustomElevatedButton(
    onPressed: () {
      Get.back();
    },
      text: "lbl_message".tr,
      margin: EdgeInsets.only(left: 16.h, right: 16.h, bottom: 40.v));
 }

 /// Common widget
 Widget _buildFiveHundred({
  required String userName,
  required String userReviews,
 }) {
  return Column(children: [
   Text(userName,
       style: CustomTextStyles.titleMediumBlack900_1
           .copyWith(color: appTheme.black900)),
   SizedBox(height: 8.v),
   Text(userReviews,
       style: CustomTextStyles.titleMediumBlack900_1
           .copyWith(color: appTheme.black900))
  ]);
 }

 /// Navigates to the previous screen.
 onTapArrowLeft() {
  Get.back();
 }
}


