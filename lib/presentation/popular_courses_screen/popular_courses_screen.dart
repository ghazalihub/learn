import 'package:flutter/material.dart';
import 'package:flutter_elearning_app/core/app_export.dart';
import 'package:flutter_elearning_app/data/models/course_model.dart';
import 'controller/popular_courses_controller.dart';

class PopularCoursesScreen extends GetWidget<PopularCoursesController> {
  const PopularCoursesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appTheme.bgColor,
      appBar: AppBar(
        title: Text("lbl_popular_course".tr),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: appTheme.black900),
          onPressed: () => Get.back(),
        ),
      ),
      body: Obx(() => controller.isLoading.value
          ? Center(child: CircularProgressIndicator())
          : ListView.separated(
              padding: EdgeInsets.all(16.h),
              itemCount: controller.getPopulerCource.length,
              separatorBuilder: (context, index) => SizedBox(height: 16.v),
              itemBuilder: (context, index) {
                CourseModel model = controller.getPopulerCource[index];
                return GestureDetector(
                  onTap: () => Get.toNamed(AppRoutes.courseDetailsAboutScreen, arguments: model),
                  child: Container(
                    padding: EdgeInsets.all(12.h),
                    decoration: AppDecoration.fillGray.copyWith(
                      borderRadius: BorderRadiusStyle.roundedBorder12,
                    ),
                    child: Row(
                      children: [
                        CustomImageView(
                          imagePath: model.thumbnailUrl,
                          height: 80.adaptSize,
                          width: 80.adaptSize,
                          radius: BorderRadius.circular(8.h),
                        ),
                        SizedBox(width: 12.h),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(model.title ?? "", style: theme.textTheme.titleSmall),
                              SizedBox(height: 8.v),
                              Text(model.instructorName ?? "", style: theme.textTheme.bodySmall),
                              SizedBox(height: 8.v),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("${model.currency ?? ""}${model.price ?? ""}", style: theme.textTheme.labelLarge),
                                  Row(
                                    children: [
                                      Icon(Icons.star, color: Colors.amber, size: 14.adaptSize),
                                      Text(model.rating?.toString() ?? "0.0", style: theme.textTheme.labelMedium),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            )),
    );
  }
}
