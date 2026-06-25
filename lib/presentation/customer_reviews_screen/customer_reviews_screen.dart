import 'package:flutter/material.dart';
import 'package:flutter_elearning_app/core/app_export.dart';
import 'package:flutter_elearning_app/widgets/app_bar/appbar_leading_image.dart';
import 'package:flutter_elearning_app/widgets/app_bar/appbar_subtitle.dart';
import 'package:flutter_elearning_app/widgets/app_bar/custom_app_bar.dart';
import '../customer_reviews_screen/widgets/userprofile_item_widget.dart';
import 'controller/customer_reviews_controller.dart';
import 'models/userprofile_item_model.dart';





class CustomerReviewsScreen extends StatefulWidget {
  const CustomerReviewsScreen({super.key});

  @override
  State<CustomerReviewsScreen> createState() => _CustomerReviewsScreenState();
}

class _CustomerReviewsScreenState extends State<CustomerReviewsScreen> {
  CustomerReviewsController controller  = Get.put(CustomerReviewsController());
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
                _buildUserProfile()
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
            title: AppbarSubtitle(text: "msg_customer_reviews".tr)));
  }

  /// Section Widget
  Widget _buildUserProfile() {
    return Expanded(
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 23.h),
            child: ListView.separated(
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                separatorBuilder: (context, index) {
                  return SizedBox(height: 16.v);
                },
                itemCount: controller.customerReviewList.length,
                itemBuilder: (context, index) {
                  UserprofileItemModel model = controller.customerReviewList[index];
                  return UserprofileItemWidget(model);
                })));
  }

  /// Navigates to the previous screen.
  onTapArrowLeft() {
    Get.back();
  }
}





