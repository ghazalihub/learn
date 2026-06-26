import 'package:flutter/material.dart';
import 'package:flutter_elearning_app/core/app_export.dart';
import 'package:flutter_elearning_app/widgets/app_bar/appbar_leading_image.dart';
import 'package:flutter_elearning_app/widgets/app_bar/appbar_subtitle.dart';
import 'package:flutter_elearning_app/widgets/app_bar/custom_app_bar.dart';
import 'controller/popular_instructor_controller.dart';

class PopularInstructorScreen extends GetWidget<PopularInstructorController> {
  const PopularInstructorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appTheme.bgColor,
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(),
            Expanded(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.people_outline, size: 80.h, color: theme.colorScheme.primary),
                    SizedBox(height: 16.v),
                    Text("Popular Instructors", style: theme.textTheme.titleMedium),
                    SizedBox(height: 8.v),
                    Text("Stay tuned for our expert mentors!", style: theme.textTheme.bodyMedium),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

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
            Get.back();
          }),
        centerTitle: true,
        title: AppbarSubtitle(text: "msg_popular_instructor".tr)));
  }
}
