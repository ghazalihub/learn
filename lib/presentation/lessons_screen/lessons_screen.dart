import 'package:flutter/material.dart';
import 'package:flutter_elearning_app/data/models/course_model.dart';
import 'package:flutter_elearning_app/widgets/custom_icon_button.dart';
import 'package:flutter_elearning_app/core/app_export.dart';
import 'package:flutter_elearning_app/widgets/app_bar/appbar_leading_image.dart';
import 'package:flutter_elearning_app/widgets/app_bar/appbar_subtitle.dart';
import 'package:flutter_elearning_app/widgets/app_bar/custom_app_bar.dart';
import '../course_details_screen/controller/course_details_controller.dart';
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
              child: Obx(() => ListView.separated(
               padding: EdgeInsets.symmetric(horizontal: 16.h),
                  shrinkWrap: true,
                  separatorBuilder: (context, index) {
                   return SizedBox(height: 16.v);
                  },
                  itemCount:
                  controller.courseModel.value?.lessons?.length ?? 0,
                  itemBuilder: (context, index) {
                   LessonModel lesson = controller.courseModel.value!.lessons![index];
                   return GestureDetector(
                     onTap: () {
                       Get.toNamed(AppRoutes.videoScreen, arguments: lesson);
                     },
                     child: Container(
                       padding: EdgeInsets.all(12.h),
                       decoration: AppDecoration.fillGray.copyWith(
                         borderRadius: BorderRadiusStyle.roundedBorder12,
                       ),
                       child: Row(
                         children: [
                           CustomIconButton(
                             height: 40.adaptSize,
                             width: 40.adaptSize,
                             padding: EdgeInsets.all(10.h),
                             decoration: IconButtonStyleHelper.fillWhiteATL20,
                             child: CustomImageView(
                               imagePath: ImageConstant.imgPlay,
                             ),
                           ),
                           SizedBox(width: 12.h),
                           Expanded(
                             child: Column(
                               crossAxisAlignment: CrossAxisAlignment.start,
                               children: [
                                 Text(
                                   lesson.title ?? "",
                                   style: theme.textTheme.titleSmall,
                                 ),
                                 SizedBox(height: 4.v),
                                 Text(
                                   lesson.duration ?? "",
                                   style: theme.textTheme.bodySmall,
                                 ),
                               ],
                             ),
                           ),
                           if (lesson.isPreview == true)
                             Container(
                               padding: EdgeInsets.symmetric(horizontal: 8.h, vertical: 4.v),
                               decoration: BoxDecoration(
                                 color: appTheme.indigo50,
                                 borderRadius: BorderRadius.circular(4.h),
                               ),
                               child: Text(
                                 "Preview",
                                 style: TextStyle(
                                   color: theme.colorScheme.primary,
                                   fontSize: 10.fSize,
                                 ),
                               ),
                             ),
                         ],
                       ),
                     ),
                   );
                  })),
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




