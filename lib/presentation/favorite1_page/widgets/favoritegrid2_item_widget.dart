import '../controller/favorite1_controller.dart';
import '../models/favoritegrid2_item_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_elearning_app/core/app_export.dart';
import 'package:flutter_elearning_app/widgets/custom_icon_button.dart';

// ignore: must_be_immutable
class Favoritegrid2ItemWidget extends StatelessWidget {
  Favoritegrid2ItemWidget(
    this.favoritegrid2ItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  Favoritegrid2ItemModel favoritegrid2ItemModelObj;

  var controller = Get.find<Favorite1Controller>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.h),
      decoration: AppDecoration.fillGray.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder12,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 115.v,
            width: 174.h,
            child: Stack(
              alignment: Alignment.topRight,
              children: [
                Obx(
                  () => CustomImageView(
                    imagePath: favoritegrid2ItemModelObj.image!.value,
                    height: 115.v,
                    width: 174.h,
                    radius: BorderRadius.circular(
                      12.h,
                    ),
                    alignment: Alignment.center,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 8.v,
                    right: 8.h,
                  ),
                  child: Obx(
                    () => CustomIconButton(
                      height: 28.adaptSize,
                      width: 28.adaptSize,
                      padding: EdgeInsets.all(6.h),
                      alignment: Alignment.topRight,
                      child: CustomImageView(
                        imagePath: favoritegrid2ItemModelObj.favorite!.value,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 9.v),
          Align(
            alignment: Alignment.centerLeft,
            child: SizedBox(
              width: 155.h,
              child: Obx(
                () => Text(
                  favoritegrid2ItemModelObj.learnNewSkills!.value,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.titleSmall!.copyWith(
                    height: 1.50,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 17.v),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Obx(
                () => CustomImageView(
                  imagePath: favoritegrid2ItemModelObj.circleImage!.value,
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
                        favoritegrid2ItemModelObj.alreadyHaveAn!.value,
                        style: theme.textTheme.labelLarge,
                      ),
                    ),
                    SizedBox(height: 2.v),
                    Obx(
                      () => Text(
                        favoritegrid2ItemModelObj.alreadyHaveAn1!.value,
                        style: theme.textTheme.bodySmall,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 12.h,
                  top: 7.v,
                  bottom: 10.v,
                ),
                child: Obx(
                  () => Text(
                    favoritegrid2ItemModelObj.price!.value,
                    style: theme.textTheme.labelLarge,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 3.v),
        ],
      ),
    );
  }
}
