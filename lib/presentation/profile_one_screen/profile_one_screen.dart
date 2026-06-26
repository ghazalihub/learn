import 'package:flutter/material.dart';
import 'package:flutter_elearning_app/core/app_export.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProfileOneScreen extends StatelessWidget {
  const ProfileOneScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;
    return Scaffold(
      backgroundColor: appTheme.bgColor,
      appBar: AppBar(
        title: Text("lbl_profile".tr),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.h),
        child: Column(
          children: [
            CircleAvatar(
              radius: 50.h,
              backgroundColor: theme.colorScheme.primary,
              child: Icon(Icons.person, size: 50.h, color: Colors.white),
            ),
            SizedBox(height: 16.v),
            Text(user?.displayName ?? "Guest User", style: theme.textTheme.titleLarge),
            Text(user?.email ?? "", style: theme.textTheme.bodyMedium),
            SizedBox(height: 32.v),
            _buildOption(Icons.book_online, "lbl_my_courses".tr, () => Get.toNamed(AppRoutes.myCoursesScreen)),
            _buildOption(Icons.favorite_border, "lbl_favorite".tr, () => Get.toNamed(AppRoutes.favoriteScreen)),
            _buildOption(Icons.payment, "lbl_my_cards".tr, () => Get.toNamed(AppRoutes.myCardsScreen)),
            _buildOption(Icons.notifications_none, "lbl_notifications".tr, () => Get.toNamed(AppRoutes.notificationsScreen)),
            _buildOption(Icons.privacy_tip_outlined, "lbl_privacy_policy".tr, () => Get.toNamed(AppRoutes.privacyPolicyScreen)),
            SizedBox(height: 32.v),
            _buildOption(Icons.logout, "lbl_log_out".tr, () => Get.toNamed(AppRoutes.logOutScreen), isDestructive: true),
          ],
        ),
      ),
    );
  }

  Widget _buildOption(IconData icon, String title, VoidCallback onTap, {bool isDestructive = false}) {
    return ListTile(
      leading: Icon(icon, color: isDestructive ? Colors.red : appTheme.black900),
      title: Text(title, style: TextStyle(color: isDestructive ? Colors.red : appTheme.black900)),
      trailing: Icon(Icons.arrow_forward_ios, size: 16, color: appTheme.black900),
      onTap: onTap,
    );
  }
}
