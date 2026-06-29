import 'package:flutter/material.dart';
import 'package:flutter_elearning_app/core/app_export.dart';
import 'package:flutter_elearning_app/widgets/custom_elevated_button.dart';
import 'package:flutter_elearning_app/widgets/custom_outlined_button.dart';
import 'package:flutter_elearning_app/services/auth_service.dart';

import '../../widgets/app_bar/custum_bottom_bar_controller.dart';
import 'controller/log_out_controller.dart';

class LogOutScreen extends StatefulWidget {
  const LogOutScreen({super.key});

  @override
  State<LogOutScreen> createState() => _LogOutScreenState();
}

class _LogOutScreenState extends State<LogOutScreen> {
  LogOutController controller = Get.put(LogOutController());
  CustomBottomBarController customBottomBarController =
  Get.put(CustomBottomBarController());
  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return Container(
        width: double.maxFinite,
        padding: EdgeInsets.symmetric(horizontal: 0.h),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 1.v),
              _buildCancelFrame()
            ]));
  }

  /// Section Widget
  Widget _buildCancelFrame() {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 31.h, vertical: 24.v),
        decoration: AppDecoration.white
            .copyWith(

            borderRadius: BorderRadiusStyle.circleBorder15),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 4.v),
              Text("msg_are_you_sure_you".tr,
                  style: theme.textTheme.titleMedium),
              SizedBox(height: 24.v),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Expanded(
                    child: CustomOutlinedButton(
                        text: "lbl_cancel".tr,
                        margin: EdgeInsets.only(right: 10.h),
                        onPressed: () {
                          Get.back();
                        })),
                Expanded(
                    child: CustomElevatedButton(
                        text: "lbl_log_out".tr,
                        margin: EdgeInsets.only(left: 10.h),
                        onPressed: () {
                          onTapLogOut();
                        }))
              ])
            ]));
  }

  /// Navigates to the logInScreen when the action is triggered.
  onTapLogOut() {
    PrefUtils.setIsSignIn(false);
    customBottomBarController.getIndex(0);
    Get.find<AuthService>().signOut();
  }
}
