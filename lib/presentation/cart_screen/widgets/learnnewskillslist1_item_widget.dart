import '../controller/cart_controller.dart';
import '../models/learnnewskillslist1_item_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_elearning_app/core/app_export.dart';
import 'package:flutter_elearning_app/widgets/custom_icon_button.dart';

// ignore: must_be_immutable
class Learnnewskillslist1ItemWidget extends StatelessWidget {
  Learnnewskillslist1ItemWidget(
    this.learnnewskillslist1ItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  Learnnewskillslist1ItemModel learnnewskillslist1ItemModelObj;

  var controller = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8.v),
      decoration: AppDecoration.fillGray.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder12,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Obx(
            () => CustomImageView(
              imagePath: learnnewskillslist1ItemModelObj.image!.value,
              height: 114.adaptSize,
              width: 114.adaptSize,
              radius: BorderRadius.circular(
                12.h,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 14.v,
              bottom: 8.v,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Obx(
                  () => Text(
                    learnnewskillslist1ItemModelObj.learnNewSkills!.value,
                    style: theme.textTheme.titleSmall!.copyWith(
                        color:appTheme.black900
                    ),
                  ),
                ),
                SizedBox(height: 11.v),
                Obx(
                  () => Text(
                    learnnewskillslist1ItemModelObj.price!.value,
                    style: theme.textTheme.titleSmall!.copyWith(
                        color:appTheme.black900
                    ),
                  ),
                ),
                SizedBox(height: 11.v),
                SizedBox(
                  width: 250.h,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Obx(
                        () => CustomImageView(
                          imagePath: learnnewskillslist1ItemModelObj
                              .circleImage!.value,
                          height: 30.adaptSize,
                          width: 30.adaptSize,
                          radius: BorderRadius.circular(
                            15.h,
                          ),
                          margin: EdgeInsets.only(bottom: 2.v),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 8.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Obx(
                              () => Text(
                                learnnewskillslist1ItemModelObj
                                    .alreadyHaveAn!.value,
                                style: theme.textTheme.labelLarge!.copyWith(
                                    color:appTheme.black900
                                ),
                              ),
                            ),
                            SizedBox(height: 2.v),
                            Obx(
                              () => Text(
                                learnnewskillslist1ItemModelObj
                                    .alreadyHaveAn1!.value,
                                style: theme.textTheme.bodySmall!.copyWith(
                                    color:appTheme.black900
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Spacer(),
                      Padding(
                        padding: EdgeInsets.only(bottom: 3.v),
                        child: CustomIconButton(
                          height: 28.adaptSize,
                          width: 28.adaptSize,
                          padding: EdgeInsets.all(5.h),
                          decoration: IconButtonStyleHelper.fillWhiteATL14.copyWith(
                            color: appTheme.iconButtonbgColor
                          ),
                          child: CustomImageView(
                            color: appTheme.black900,
                            imagePath: ImageConstant.imgMenu,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 8.h,
                          top: 8.v,
                          bottom: 7.v,
                        ),
                        child: Obx(
                          () => Text(
                            learnnewskillslist1ItemModelObj.one!.value,
                            style: CustomTextStyles.bodyMediumOnPrimary,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 8.h,
                          bottom: 3.v,
                        ),
                        child: CustomIconButton(
                          height: 28.adaptSize,
                          width: 28.adaptSize,
                          padding: EdgeInsets.all(5.h),
                          decoration: IconButtonStyleHelper.fillWhiteATL14.copyWith(
                            color: appTheme.iconButtonbgColor
                          ),
                          child: CustomImageView(
                            color: appTheme.black900,
                            imagePath: ImageConstant.imgPlus,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
