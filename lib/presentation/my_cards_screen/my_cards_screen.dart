import 'package:flutter/material.dart';
import 'package:flutter_elearning_app/core/app_export.dart';
import 'package:flutter_elearning_app/widgets/app_bar/appbar_leading_image.dart';
import 'package:flutter_elearning_app/widgets/app_bar/appbar_subtitle.dart';
import 'package:flutter_elearning_app/widgets/app_bar/appbar_trailing_image.dart';
import 'package:flutter_elearning_app/widgets/app_bar/custom_app_bar.dart';

import 'controller/my_cards_controller.dart';
import 'models/my_cards_model.dart';

class MyCardsScreen extends StatefulWidget {
  const MyCardsScreen({super.key});

  @override
  State<MyCardsScreen> createState() => _MyCardsScreenState();
}

class _MyCardsScreenState extends State<MyCardsScreen> {
  MyCardsController controller = Get.put(MyCardsController());

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return Scaffold(
        backgroundColor: appTheme.bgColor,
        resizeToAvoidBottomInset: false,
        body: Column(children: [
          _buildHeader(),
         SizedBox(height: 18.v),
         ListView.builder(
           padding: EdgeInsets.symmetric(horizontal: 16.h),
           primary: false,
           shrinkWrap: true,
           itemCount: controller.cardData.length,
           itemBuilder: (context, index) {
           MyCardsModel model = controller.cardData[index];
           return animationfunction(index, buildPaymentDetails(model));
         },)
        ]));
  }

  /// Section Widget
  Widget _buildHeader() {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 20.v),
        decoration: AppDecoration.white,
        child: CustomAppBar(
            height: 28.v,
            leadingWidth: 44.h,
            leading: AppbarLeadingImage(
                imagePath: ImageConstant.imgArrowLeft,
                margin: EdgeInsets.only(left: 20.h, top: 1.v, bottom: 3.v),
                onTap: () {
                  onTapArrowLeft();
                }),
            centerTitle: true,
            title: AppbarSubtitle(text: "lbl_my_cards".tr),
            actions: [
              AppbarTrailingImage(
                  imagePath: ImageConstant.imgPlus,
                  margin: EdgeInsets.only(left: 16.h, right: 16.h, bottom: 4.v),
                  onTap: () {
                    onTapPlus();
                  })
            ]));
  }

  /// Common widget
  Widget buildPaymentDetails(MyCardsModel model) {
    return Padding(
      padding:  EdgeInsets.symmetric(vertical: 8.v),
      child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 20.v),
          decoration: AppDecoration.fillGray
              .copyWith(borderRadius: BorderRadiusStyle.circleBorder15),
          child: Row(children: [
            CustomImageView(
                imagePath: model.icon,
                height: 34.adaptSize,
                width: 34.adaptSize),
            Padding(
                padding: EdgeInsets.only(left: 16.h, top: 9.v, bottom: 2.v),
                child:
                    Text(model.title!, style: theme.textTheme.titleMedium))
          ])),
    );
  }

  /// Navigates to the previous screen.
  onTapArrowLeft() {
    Get.back();
  }

  /// Navigates to the addNewCardsScreen when the action is triggered.
  onTapPlus() {
    Get.toNamed(
      AppRoutes.addNewCardsScreen,
    );
  }
}
