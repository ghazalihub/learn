import '../controller/notifications_controller.dart';
import '../models/notificationrow_item_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_elearning_app/core/app_export.dart';
import 'package:flutter_elearning_app/widgets/custom_icon_button.dart';

// ignore: must_be_immutable
class NotificationrowItemWidget extends StatelessWidget {
  NotificationrowItemWidget(
    this.notificationrowItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  NotificationrowItemModel notificationrowItemModelObj;

  var controller = Get.find<NotificationsController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.h),
      decoration: AppDecoration.fillGray.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder12,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 80.v),
            child: CustomIconButton(
              height: 40.adaptSize,
              width: 40.adaptSize,
              padding: EdgeInsets.all(6.h),
              decoration: IconButtonStyleHelper.fillWhiteATL20,
              child: CustomImageView(
                imagePath: ImageConstant.imgNotification,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(
                left: 14.h,
                top: 7.v,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    notificationrowItemModelObj.title!,
                    style: CustomTextStyles.titleLarge20,
                  ),
                  SizedBox(height: 13.v),
                  SizedBox(
                    width: 310.h,
                    child: Text(
                      notificationrowItemModelObj.messege!,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: CustomTextStyles.bodyLargeGray700.copyWith(
                        height: 1.50,
                      ),
                    ),
                  ),
                  SizedBox(height: 8.v),
                  Text(
                    notificationrowItemModelObj.time!,
                    style: CustomTextStyles.bodyMediumOnPrimary,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
