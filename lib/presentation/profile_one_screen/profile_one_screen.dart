import 'package:flutter/material.dart';
import 'package:flutter_elearning_app/core/app_export.dart';
import 'package:flutter_elearning_app/services/auth_service.dart';
import 'package:flutter_elearning_app/widgets/app_bar/custom_app_bar.dart';
import 'package:flutter_elearning_app/widgets/app_bar/appbar_subtitle.dart';

class ProfileOneScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final auth = Get.find<AuthService>();
    return Scaffold(
      backgroundColor: appTheme.bgColor,
      body: SafeArea(
        child: Column(children: [
          _buildHeader(),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(16.h),
              child: Column(children: [
                SizedBox(height: 20.v),
                Obx(() => CustomImageView(
                  imagePath: auth.currentUser.value?.profileImageUrl ?? ImageConstant.imgAvtar1,
                  height: 100.adaptSize, width: 100.adaptSize,
                  radius: BorderRadius.circular(50.h),
                )),
                SizedBox(height: 12.v),
                Obx(() => Text(auth.currentUser.value?.name ?? "Guest User", style: theme.textTheme.titleLarge)),
                Obx(() => Text(auth.currentUser.value?.email ?? "", style: theme.textTheme.bodyMedium)),
                SizedBox(height: 32.v),
                _buildOption(context, ImageConstant.imgUserPrimary, "lbl_my_profile".tr, () => Get.toNamed(AppRoutes.myProfileScreen)),
                _buildOption(context, ImageConstant.imgFavoritePrimary, "lbl_favorite".tr, () => Get.toNamed(AppRoutes.favorite1Page)),
                _buildOption(context, ImageConstant.imgSettingsPrimary, "lbl_settings".tr, () => {}),
                _buildOption(context, ImageConstant.imgQuestionPrimary, "lbl_privacy_policy".tr, () => Get.toNamed(AppRoutes.privacyPolicyScreen)),
                SizedBox(height: 20.v),
                _buildOption(context, ImageConstant.imgLogOut, "lbl_log_out".tr, () {
                  Get.bottomSheet(
                    Container(
                      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.vertical(top: Radius.circular(20.h))),
                      padding: EdgeInsets.all(20.h),
                      child: Column(mainAxisSize: MainAxisSize.min, children: [
                        Text("msg_are_you_sure_you".tr, style: theme.textTheme.titleMedium),
                        SizedBox(height: 20.v),
                        Row(children: [
                          Expanded(child: OutlinedButton(onPressed: () => Get.back(), child: Text("lbl_cancel".tr))),
                          SizedBox(width: 12.h),
                          Expanded(child: ElevatedButton(onPressed: () {
                            PrefUtils.setIsSignIn(false);
                            auth.signOut();
                          }, child: Text("lbl_log_out".tr))),
                        ])
                      ]),
                    )
                  );
                }, color: Colors.red),
              ]),
            ),
          )
        ]),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20.v),
      decoration: AppDecoration.white,
      child: CustomAppBar(centerTitle: true, title: AppbarSubtitle(text: "lbl_profile".tr)),
    );
  }

  Widget _buildOption(BuildContext context, String icon, String title, VoidCallback onTap, {Color? color}) {
    return ListTile(
      leading: CustomImageView(imagePath: icon, height: 24.adaptSize, width: 24.adaptSize, color: color),
      title: Text(title, style: TextStyle(color: color ?? appTheme.black900, fontSize: 16.fSize, fontWeight: FontWeight.w500)),
      trailing: Icon(Icons.arrow_forward_ios, size: 16.h, color: Colors.grey),
      onTap: onTap,
    );
  }
}
