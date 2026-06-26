// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_elearning_app/core/app_export.dart';
import 'package:flutter_elearning_app/widgets/app_bar/appbar_leading_image.dart';
import 'package:flutter_elearning_app/widgets/app_bar/appbar_subtitle.dart';
import 'package:flutter_elearning_app/widgets/app_bar/custom_app_bar.dart';

import '../course_details_screen/widgets/widget_item_widget.dart';
import 'controller/course_details_controller.dart';
import 'models/widget_item_model.dart';

class CourseDetailsScreen extends GetWidget<CourseDetailsController> {
  const CourseDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return PopScope(
   canPop: false,
   onPopInvokedWithResult: (didPop, result) {
    if (didPop) return;
    Get.back();
   },
   child: Scaffold(
          backgroundColor: appTheme.bgColor,
          body: SizedBox(
              width: double.maxFinite,
              child: Column(children: [
                _buildHeader(),
                SizedBox(height: 16.v),
                Expanded(
                    child: SingleChildScrollView(
                        child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16.h),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomImageView(
                                      imagePath:
                                          ImageConstant.imgGroupIndianCh2,
                                      height: 178.v,
                                      width: 396.h,
                                      radius: BorderRadius.circular(12.h)),
                                  SizedBox(height: 20.v),
                                  Text("msg_how_to_become_an".tr,
                                      style: CustomTextStyles.titleLarge20),
                                  SizedBox(height: 11.v),
                                  Text("lbl_45_00".tr,
                                      style: CustomTextStyles.titleMedium16),
                                  SizedBox(height: 11.v),
                                  Row(children: [
                                    CustomImageView(
                                        imagePath: ImageConstant.imgStar,
                                        height: 14.adaptSize,
                                        width: 14.adaptSize,
                                        margin: EdgeInsets.only(bottom: 2.v)),
                                    Padding(
                                        padding: EdgeInsets.only(left: 4.h),
                                        child: Text("lbl_4_0".tr,
                                            style: CustomTextStyles
                                                .bodyMediumOnPrimary)),
                                    Padding(
                                        padding: EdgeInsets.only(left: 4.h),
                                        child: Text("lbl_4_2k_reviews".tr,
                                            style: CustomTextStyles
                                                .bodyMediumOnPrimary))
                                  ]),
                                  SizedBox(height: 16.v),
                                  _buildTitleAndViewAll(),
                                  _buildWidget(),
                                  SizedBox(height: 16.v),
                                ]))))
              ]))),
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
            title: AppbarSubtitle(text: "lbl_course_details".tr)));
  }

  /// Section Widget
  Widget _buildTitleAndViewAll() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("lbl_154_lessons".tr, style: theme.textTheme.titleMedium),
        Text("lbl_view_all".tr, style: CustomTextStyles.bodyMediumOnPrimary)
      ],
    );
  }

  /// Section Widget
  Widget _buildWidget() {
    return ListView.separated(
      shrinkWrap: true,
      primary: false,
      separatorBuilder: (context, index) {
        return SizedBox(height: 16.v);
      },
      itemCount: controller.lessonList.length,
      itemBuilder: (context, index) {
        WidgetItemModel model = controller.lessonList[index];
        return WidgetItemWidget(model);
      },
    );
  }


  /// Navigates to the previous screen.
  onTapArrowLeft() {
    Get.back();
  }
}
