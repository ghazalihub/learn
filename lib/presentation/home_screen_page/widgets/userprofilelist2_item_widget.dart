import '../controller/home_screen_controller.dart';
import '../models/userprofilelist2_item_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_elearning_app/core/app_export.dart';
import 'package:flutter_elearning_app/widgets/custom_icon_button.dart';

// ignore: must_be_immutable
class Userprofilelist2ItemWidget extends StatelessWidget {
  Userprofilelist2ItemWidget(
    this.userprofilelist2ItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  Userprofilelist2ItemModel userprofilelist2ItemModelObj;

  var controller = Get.find<HomeScreenController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8.v),
      decoration: AppDecoration.fillGray.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder12,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Obx(
            () => CustomImageView(
              imagePath: userprofilelist2ItemModelObj.userImage!.value,
              height: 114.adaptSize,
              width: 114.adaptSize,
              radius: BorderRadius.circular(
                12.h,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 9.v),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 187.h,
                      margin: EdgeInsets.only(top: 13.v),
                      child: Obx(
                        () => Text(
                          userprofilelist2ItemModelObj
                              .learnNewSkillsText!.value,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: theme.textTheme.titleSmall!.copyWith(
                            height: 1.71,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 38.h,
                        bottom: 33.v,
                      ),
                      child: CustomIconButton(
                        height: 28.adaptSize,
                        width: 28.adaptSize,
                        padding: EdgeInsets.all(6.h),
                        decoration: IconButtonStyleHelper.outlineBlackTL14,
                        child: CustomImageView(
                          imagePath: ImageConstant.imgFavorite,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 9.v),
                SizedBox(
                  width: 254.h,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Obx(
                        () => CustomImageView(
                          imagePath: userprofilelist2ItemModelObj
                              .priceCircleImage!.value,
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
                                userprofilelist2ItemModelObj
                                    .instructorNameText!.value,
                                style: theme.textTheme.labelLarge,
                              ),
                            ),
                            SizedBox(height: 2.v),
                            Obx(
                              () => Text(
                                userprofilelist2ItemModelObj
                                    .instructorTitleText!.value,
                                style: theme.textTheme.bodySmall,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Spacer(),
                      Padding(
                        padding: EdgeInsets.only(
                          top: 6.v,
                          bottom: 9.v,
                        ),
                        child: Obx(
                          () => Text(
                            userprofilelist2ItemModelObj.priceText!.value,
                            style: theme.textTheme.titleSmall,
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
