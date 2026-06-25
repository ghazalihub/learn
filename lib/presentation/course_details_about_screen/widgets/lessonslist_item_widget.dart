import '../controller/course_details_about_controller.dart';
import '../models/lessonslist_item_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_elearning_app/core/app_export.dart';

// ignore: must_be_immutable
class LessonslistItemWidget extends StatelessWidget {
  LessonslistItemWidget(
    this.lessonslistItemModelObj, {
    Key? key,
    this.onTapTxtViewAllText,
  }) : super(
          key: key,
        );

  LessonslistItemModel lessonslistItemModelObj;

  var controller = Get.find<CourseDetailsAboutController>();

  VoidCallback? onTapTxtViewAllText;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Obx(
            () => Text(
              lessonslistItemModelObj.lessonCount!.value,
              style: theme.textTheme.titleMedium,
            ),
          ),
          GestureDetector(
            onTap: () {
              onTapTxtViewAllText!.call();
            },
            child: Padding(
              padding: EdgeInsets.only(bottom: 3.v),
              child: Obx(
                () => Text(
                  lessonslistItemModelObj.viewAllText!.value,
                  style: CustomTextStyles.bodyMediumOnPrimary,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
