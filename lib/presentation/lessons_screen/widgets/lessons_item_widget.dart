import '../controller/lessons_controller.dart';
import '../models/lessons_item_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_elearning_app/core/app_export.dart';

// ignore: must_be_immutable
class LessonsItemWidget extends StatelessWidget {
  LessonsItemWidget(
    this.lessonsItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  LessonsItemModel lessonsItemModelObj;

  var controller = Get.find<LessonsController>();

  @override
  Widget build(BuildContext context) {
    return Container(
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
              horizontal: 12.h,
              vertical: 10.v,
            ),
            decoration: AppDecoration.fillIndigo5002.copyWith(
              borderRadius: BorderRadiusStyle.circleBorder24,
            ),
            child: Obx(
              () => Text(
                lessonsItemModelObj.widget!.value,
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
                Obx(
                  () => Text(
                    lessonsItemModelObj.whyUsingFigma!.value,
                    style: CustomTextStyles.titleMediumBlack900,
                  ),
                ),
                SizedBox(height: 7.v),
                Obx(
                  () => Text(
                    lessonsItemModelObj.minutes!.value,
                    style: CustomTextStyles.bodySmallBlack900,
                  ),
                ),
              ],
            ),
          ),
          Spacer(),
          CustomImageView(
            imagePath: ImageConstant.imgPlay,
            height: 32.adaptSize,
            width: 32.adaptSize,
            margin: EdgeInsets.symmetric(vertical: 7.v),
          ),
        ],
      ),
    );
  }
}
