import 'package:flutter/material.dart';
import 'package:flutter_elearning_app/core/app_export.dart';
import 'package:flutter_elearning_app/widgets/custom_elevated_button.dart';
import 'package:flutter_elearning_app/data/models/course_model.dart';
import 'package:flutter_elearning_app/services/cart_service.dart';
import '../course_details_screen/widgets/widget_item_widget.dart';
import '../course_details_screen/models/widget_item_model.dart';

class CourseDetailsAboutScreen extends StatefulWidget {
  const CourseDetailsAboutScreen({super.key});
  @override
  State<CourseDetailsAboutScreen> createState() => _CourseDetailsAboutScreenState();
}

class _CourseDetailsAboutScreenState extends State<CourseDetailsAboutScreen> {
  late CourseModel course;
  @override
  void initState() {
    super.initState();
    course = Get.arguments as CourseModel;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: appTheme.bgColor,
        body: SafeArea(
          child: Column(children: [
            _buildHeader(),
            Expanded(child: ListView(padding: EdgeInsets.all(16.h), children: [
              CustomImageView(imagePath: course.thumbnailUrl, height: 200.v, width: double.infinity, radius: BorderRadius.circular(12.h)),
              SizedBox(height: 16.v),
              Text(course.title!, style: CustomTextStyles.titleLarge20),
              SizedBox(height: 8.v),
              Text("${course.currency} ${course.price}", style: theme.textTheme.titleMedium),
              SizedBox(height: 16.v),
              Text("lbl_about_course".tr, style: theme.textTheme.titleMedium),
              SizedBox(height: 8.v),
              Text(course.description!, style: theme.textTheme.bodyLarge),
              SizedBox(height: 24.v),
              _buildMentor(),
              SizedBox(height: 24.v),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Text("${course.lessons?.length ?? 0} lessons", style: theme.textTheme.titleMedium),
                GestureDetector(onTap: () => Get.toNamed(AppRoutes.lessonsScreen, arguments: course), child: Text("lbl_view_all".tr, style: CustomTextStyles.bodyMediumOnPrimary))
              ]),
              SizedBox(height: 16.v),
              _buildLessonsList()
            ]))
          ]),
        ),
        bottomNavigationBar: _buildEnrollNow());
  }

  Widget _buildHeader() {
    return Padding(
        padding: EdgeInsets.all(16.h),
        child: Row(children: [
          IconButton(icon: Icon(Icons.arrow_back), onPressed: () => Get.back()),
          Spacer(),
          Text("Course Details", style: theme.textTheme.titleLarge)
        ]));
  }

  Widget _buildMentor() {
    return Row(children: [
      CustomImageView(imagePath: course.instructorImage, height: 48.adaptSize, width: 48.adaptSize, radius: BorderRadius.circular(24.h)),
      SizedBox(width: 12.h),
      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(course.instructorName!, style: CustomTextStyles.titleMedium16),
        Text("Islamic Scholar", style: CustomTextStyles.bodyMedium14)
      ])
    ]);
  }

  Widget _buildLessonsList() {
    return ListView.separated(
        shrinkWrap: true, physics: NeverScrollableScrollPhysics(),
        separatorBuilder: (context, index) => SizedBox(height: 16.v),
        itemCount: (course.lessons?.length ?? 0) > 3 ? 3 : (course.lessons?.length ?? 0),
        itemBuilder: (context, index) {
          var lesson = course.lessons![index];
          return WidgetItemWidget(
            WidgetItemModel((index + 1).toString().padLeft(2, '0'), lesson.title, lesson.duration, false),
            onTap: () => Get.toNamed(AppRoutes.videoScreen, arguments: lesson),
          );
        });
  }

  Widget _buildEnrollNow() {
    return CustomElevatedButton(
        text: "lbl_enroll_now".tr,
        margin: EdgeInsets.fromLTRB(16.h, 0, 16.h, 40.v),
        onPressed: () {
          if (course.isFree ?? false) {
            Get.find<CartService>().enroll(course);
          } else {
            Get.toNamed(AppRoutes.cartScreen, arguments: course);
          }
        });
  }
}
