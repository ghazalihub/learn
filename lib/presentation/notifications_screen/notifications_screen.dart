import 'package:flutter/material.dart';
import 'package:flutter_elearning_app/core/app_export.dart';
import 'package:flutter_elearning_app/widgets/app_bar/appbar_leading_image.dart';
import 'package:flutter_elearning_app/widgets/app_bar/appbar_subtitle.dart';
import 'package:flutter_elearning_app/widgets/app_bar/custom_app_bar.dart';
import '../notifications_screen/widgets/notificationrow_item_widget.dart';
import 'controller/notifications_controller.dart';
import 'models/notificationrow_item_model.dart';





class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
 NotificationsController controller = Get.put(NotificationsController());
 @override
 Widget build(BuildContext context) {
  mediaQueryData = MediaQuery.of(context);
  return Scaffold(
   backgroundColor: appTheme.bgColor,
      body: SafeArea(
        child: SizedBox(
            width: double.maxFinite,
            child: Column(children: [
             _buildHeader(),
             SizedBox(height: 24.v),
             _buildNotificationRow()
            ])),
      ));
 }

 /// Section Widget
 Widget _buildHeader() {
  return Container(
      padding: EdgeInsets.symmetric(vertical: 20.v),
      decoration: AppDecoration.white,
      child: CustomAppBar(
          leadingWidth: 44.h,
          leading: AppbarLeadingImage(
              imagePath: ImageConstant.imgArrowLeft,
              margin: EdgeInsets.only(left: 20.h, top: 1.v, bottom: 1.v),
              onTap: () {
               onTapArrowLeft();
              }),
          centerTitle: true,
          title: AppbarSubtitle(text: "lbl_notifications".tr)));
 }

 /// Section Widget
 Widget _buildNotificationRow() {
  return Expanded(
      child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.h),
          child: ListView.separated(
              physics: BouncingScrollPhysics(),
              shrinkWrap: true,
              separatorBuilder: (context, index) {
                return SizedBox(height: 16.v);
              },
              itemCount: controller.getNotificationList.length,
              itemBuilder: (context, index) {
                NotificationrowItemModel model = controller
                    .getNotificationList[index];
                return animationfunction(index, NotificationrowItemWidget(model));
              })));
 }

 /// Navigates to the previous screen.
 onTapArrowLeft() {
  Get.back();
 }
}




