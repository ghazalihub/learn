import 'package:flutter/material.dart';
import 'package:flutter_elearning_app/core/app_export.dart';
import '../models/learnnewskillslist_item_model.dart';
import '../../../data/models/course_model.dart';

class LearnnewskillslistItemWidget extends StatelessWidget {
  LearnnewskillslistItemWidget(this.model, {this.course});
  final LearnnewskillslistItemModel model;
  final CourseModel? course;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (course != null) {
          Get.toNamed(AppRoutes.courseDetailsAboutScreen, arguments: course);
        }
      },
      child: Container(
        padding: EdgeInsets.all(16.h),
        decoration: AppDecoration.fillGray.copyWith(borderRadius: BorderRadiusStyle.roundedBorder12),
        child: Row(children: [
          CustomImageView(imagePath: model.image, height: 60.adaptSize, width: 60.adaptSize, radius: BorderRadius.circular(8.h)),
          SizedBox(width: 12.h),
          Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(model.title!, style: theme.textTheme.titleMedium, overflow: TextOverflow.ellipsis),
            Text(model.userName!, style: theme.textTheme.bodySmall)
          ])),
          Text(model.price!, style: theme.textTheme.titleSmall)
        ]),
      ),
    );
  }
}
