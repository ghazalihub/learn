import 'package:flutter/material.dart';
import 'package:flutter_elearning_app/core/app_export.dart';
import 'package:flutter_elearning_app/widgets/app_bar/appbar_leading_image.dart';
import 'package:flutter_elearning_app/widgets/app_bar/appbar_subtitle.dart';
import 'package:flutter_elearning_app/widgets/app_bar/custom_app_bar.dart';
import '../course_details_screen/controller/course_details_controller.dart';
import '../course_details_screen/models/widget_item_model.dart';
import '../course_details_screen/widgets/widget_item_widget.dart';
import 'controller/lessons_controller.dart';







class LessonsScreen extends StatefulWidget {
  const LessonsScreen({super.key});

  @override
  State<LessonsScreen> createState() => _LessonsScreenState();
}

class _LessonsScreenState extends State<LessonsScreen> {
 LessonsController controller = Get.put(LessonsController());
 CourseDetailsController courseDetailsController = Get.put(CourseDetailsController());

 @override
 Widget build(BuildContext context) {
  mediaQueryData = MediaQuery.of(context);
  return Scaffold(
   backgroundColor: appTheme.bgColor,
      body: SafeArea(
        child:Column(
          children: [
           _buildHeader(),
            SizedBox(height: 24.v),
            Expanded(
              child: ListView.separated(
               padding: EdgeInsets.symmetric(horizontal: 16.h),

                  shrinkWrap: true,
                  separatorBuilder: (context, index) {
                   return SizedBox(height: 16.v);
                  },
                  itemCount:
                  courseDetailsController.lessonList.length,
                  itemBuilder: (context, index) {
                   WidgetItemModel model = courseDetailsController.lessonList[index];
                   return WidgetItemWidget(model);
                  }),
            ),
          ],
        )
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
          title: AppbarSubtitle(text: "lbl_lessons".tr)));
 }


 /// Navigates to the previous screen.
 onTapArrowLeft() {
  Get.back();
 }
}




