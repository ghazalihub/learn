import 'package:flutter/material.dart';
import 'package:flutter_elearning_app/core/app_export.dart';
import 'package:flutter_elearning_app/widgets/app_bar/appbar_leading_image.dart';
import 'package:flutter_elearning_app/widgets/app_bar/appbar_subtitle.dart';
import 'package:flutter_elearning_app/widgets/app_bar/custom_app_bar.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appTheme.bgColor,
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.all(16.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("msg_1_types_of_data".tr, style: theme.textTheme.titleMedium),
                    SizedBox(height: 8.v),
                    Text("msg_duis_tristique_diam".tr, style: theme.textTheme.bodyLarge),
                    SizedBox(height: 24.v),
                    Text("msg_2_use_of_your_personal".tr, style: theme.textTheme.titleMedium),
                    SizedBox(height: 8.v),
                    Text("msg_sed_sollicitudin".tr, style: theme.textTheme.bodyLarge),
                    SizedBox(height: 24.v),
                    Text("msg_3_disclosure_of".tr, style: theme.textTheme.titleMedium),
                    SizedBox(height: 8.v),
                    Text("msg_sed_sollicitudin2".tr, style: theme.textTheme.bodyLarge),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

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
            Get.back();
          }),
        centerTitle: true,
        title: AppbarSubtitle(text: "lbl_privacy_policy".tr)));
  }
}
