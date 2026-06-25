import '../controller/onboarding_screen_one_controller.dart';
import '../models/learningframe_item_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_elearning_app/core/app_export.dart';

// ignore: must_be_immutable
class LearningframeItemWidget extends StatelessWidget {
  LearningframeItemWidget(
    this.learningframeItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  LearningframeItemModel learningframeItemModelObj;

  var controller = Get.find<OnboardingScreenOneController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 321.h,
          margin: EdgeInsets.only(
            left: 34.h,
            right: 31.h,
          ),
          child: Text(
            "msg_the_most_convenient".tr,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: theme.textTheme.headlineMedium!.copyWith(
              height: 1.36,
            ),
          ),
        ),
        SizedBox(height: 15.v),
        SizedBox(
          width: 388.h,
          child: Text(
            "msg_elearning_or_electronic".tr,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: theme.textTheme.bodyLarge!.copyWith(
              height: 1.50,
            ),
          ),
        ),
      ],
    );
  }
}
