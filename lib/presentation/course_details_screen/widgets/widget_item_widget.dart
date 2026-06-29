import 'package:flutter/services.dart';

import '../../video_screen/video_screen/controller/video_controller.dart';
import '../controller/course_details_controller.dart';
import '../models/widget_item_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_elearning_app/core/app_export.dart';
import 'package:flutter_elearning_app/data/repositories/course_repository.dart';
import 'package:flutter_elearning_app/services/ad_service.dart';
import 'package:flutter_elearning_app/services/auth_service.dart';

// ignore: must_be_immutable
class WidgetItemWidget extends StatefulWidget {
  WidgetItemWidget(
    this.widgetItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  WidgetItemModel widgetItemModelObj;

  @override
  State<WidgetItemWidget> createState() => _WidgetItemWidgetState();
}

class _WidgetItemWidgetState extends State<WidgetItemWidget> {
  VideoController vidioController = Get.put(VideoController());
  var controller = Get.find<CourseDetailsController>();

  void _playVideo() {
    final url = widget.widgetItemModelObj.videoUrl ?? "https://www.youtube.com/watch?v=0Sg6QHmlFJE";
    vidioController.youtubeUrl = url;
    Get.toNamed(AppRoutes.videoScreen, arguments: {'url': url})!.then((value) {
      Future.delayed(Duration(milliseconds: 100), () {
        SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [SystemUiOverlay.bottom, SystemUiOverlay.top]);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final repo = Get.find<CourseRepository>();
        final auth = Get.find<AuthService>();
        final lesson = widget.widgetItemModelObj;
        final courseId = controller.course.id ?? "course_001";

        bool isEnrolled = auth.currentUser.value?.enrolledCourses?.contains(courseId) ?? false;

        if (isEnrolled) {
          _playVideo();
          return;
        }

        bool isUnlocked = await repo.isLessonUnlocked(courseId, lesson.title!);

        if (!isUnlocked) {
          Get.defaultDialog(
            title: "Unlock Free Lesson",
            middleText: "Watch a short ad to watch this lecture for free!",
            actions: [
              TextButton(onPressed: () => Get.back(), child: Text("Cancel")),
              TextButton(onPressed: () {
                Get.back();
                Get.find<AdService>().showRewardedAd(onUserEarnedReward: (ad, reward) {
                  repo.unlockLesson(courseId, lesson.title!).then((_) {
                    setState(() {});
                    _playVideo();
                  });
                });
              }, child: Text("Watch Ad")),
            ]
          );
        } else {
          _playVideo();
        }
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 16.h,
          vertical: 15.v,
        ),
        decoration: AppDecoration.fillGray.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder12,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 44.adaptSize,
              margin: EdgeInsets.only(top: 1.v),
              padding: EdgeInsets.symmetric(
                horizontal: 0.h,
                vertical: 10.v,
              ),
              decoration: AppDecoration.fillIndigo5002.copyWith(
                borderRadius: BorderRadiusStyle.circleBorder24,
              ),
              child:Center(
                child: Text(
                  widget.widgetItemModelObj.lessonNo!.toString().padLeft(2, '0'),
                  style: CustomTextStyles.titleMediumPrimary_1,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 12.h,
                top: 4.v,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.widgetItemModelObj.title!,
                    style: CustomTextStyles.titleMediumBlack900,
                  ),
                  SizedBox(height: 7.v),
                  Text(
                    widget.widgetItemModelObj.min!,
                    style: CustomTextStyles.bodySmallBlack900,
                  ),
                ],
              ),
            ),
            Spacer(),
            FutureBuilder<bool>(
              future: Get.find<CourseRepository>().isLessonUnlocked(controller.course.id ?? "course_001", widget.widgetItemModelObj.title!),
              builder: (context, snapshot) {
                bool unlocked = snapshot.data ?? false;
                return CustomImageView(
                  imagePath: unlocked ? ImageConstant.imgLessonTickIcon : ImageConstant.imgPlayIcon,
                  height: 32.adaptSize,
                  width: 32.adaptSize,
                  margin: EdgeInsets.symmetric(vertical: 7.v),
                );
              }
            ),
          ],
        ),
      ),
    );
  }
}
