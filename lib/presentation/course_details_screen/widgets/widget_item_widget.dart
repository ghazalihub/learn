import 'package:flutter/services.dart';

import '../../video_screen/video_screen/controller/video_controller.dart';
import '../controller/course_details_controller.dart';
import '../models/widget_item_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_elearning_app/core/app_export.dart';

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

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        vidioController.youtubeUrl = widget.widgetItemModelObj.videoUrl ?? "https://www.youtube.com/watch?v=0Sg6QHmlFJE";
        Get.toNamed(
          AppRoutes.videoScreen,
        )!
            .then((value) {
          Future.delayed(Duration(milliseconds: 100), () {
            SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
                overlays: [SystemUiOverlay.bottom, SystemUiOverlay.top]);
          });
        });
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
            CustomImageView(
              imagePath: widget.widgetItemModelObj.isComplete!?ImageConstant.imgLessonTickIcon:ImageConstant.imgPlayIcon,
              height: 32.adaptSize,
              width: 32.adaptSize,
              margin: EdgeInsets.symmetric(vertical: 7.v),
            ),
          ],
        ),
      ),
    );
  }
}
