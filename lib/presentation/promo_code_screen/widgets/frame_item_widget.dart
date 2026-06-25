import '../controller/promo_code_controller.dart';
import '../models/frame_item_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_elearning_app/core/app_export.dart';

// ignore: must_be_immutable
class FrameItemWidget extends StatelessWidget {
  FrameItemWidget(
    this.frameItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  FrameItemModel frameItemModelObj;

  var controller = Get.find<PromoCodeController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        controller.enterhereController.text =  frameItemModelObj.holidayDealText!.value;
        controller.update();
      },
      child: Container(
        padding: EdgeInsets.all(19.h),
        decoration: AppDecoration.fillGray.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder12,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: 2.v,
                bottom: 1.v,
              ),
              child: Obx(
                () => Text(
                  frameItemModelObj.holidayDealText!.value,
                  style: CustomTextStyles.titleMediumMedium,
                ),
              ),
            ),
            CustomImageView(
              color: appTheme.black900,
              imagePath: ImageConstant.imgIcCopy,
              height: 24.adaptSize,
              width: 24.adaptSize,
            ),
          ],
        ),
      ),
    );
  }
}
