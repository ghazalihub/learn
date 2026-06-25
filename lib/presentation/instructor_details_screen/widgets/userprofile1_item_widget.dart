import '../controller/instructor_details_controller.dart';
import '../models/userprofile1_item_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_elearning_app/core/app_export.dart';
import 'package:flutter_elearning_app/widgets/custom_icon_button.dart';

// ignore: must_be_immutable
class Userprofile1ItemWidget extends StatelessWidget {
  Userprofile1ItemWidget(
    this.userprofile1ItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  Userprofile1ItemModel userprofile1ItemModelObj;

  var controller = Get.find<InstructorDetailsController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Get.toNamed(AppRoutes.courseDetailsAboutScreen);
      },
      child: Container(
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
                imagePath: userprofile1ItemModelObj.image!.value,
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
                            userprofile1ItemModelObj.learnNewSkills!.value,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: theme.textTheme.titleSmall!.copyWith(
                              color: appTheme.black900,
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
                        child: Obx(
                          () => CustomIconButton(
                            height: 28.adaptSize,
                            width: 28.adaptSize,
                            padding: EdgeInsets.all(6.h),
                            decoration: IconButtonStyleHelper.outlineBlackTL14,
                            child: CustomImageView(
                              color: appTheme.black900,
                              imagePath: userprofile1ItemModelObj.favorite!.value,
                            ),
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
                        CustomImageView(
                          imagePath: ImageConstant.imgEllipse20499,
                          height: 30.adaptSize,
                          width: 30.adaptSize,
                          radius: BorderRadius.circular(
                            15.h,
                          ),
                          margin: EdgeInsets.only(bottom: 2.v),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 8.h),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Obx(
                                () => Text(
                                  userprofile1ItemModelObj.alreadyHaveAn!.value,
                                  style: theme.textTheme.labelLarge!.copyWith(
                                    color: appTheme.black900,
                                  ),
                                ),
                              ),
                              SizedBox(height: 3.v),
                              Obx(
                                () => Text(
                                  userprofile1ItemModelObj.alreadyHaveAn1!.value,
                                  style: theme.textTheme.bodySmall!.copyWith(
                                    color: appTheme.black900,
                                  ),
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
                             "\$${userprofile1ItemModelObj.price!.value}",
                              style: theme.textTheme.titleSmall!.copyWith(
                                color: appTheme.black900,
                              ),
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
      ),
    );
  }
}
