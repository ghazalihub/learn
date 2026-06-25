import 'package:flutter/material.dart';
import 'package:flutter_elearning_app/core/app_export.dart';
import 'package:flutter_elearning_app/widgets/app_bar/appbar_leading_image.dart';
import 'package:flutter_elearning_app/widgets/app_bar/appbar_title.dart';
import 'package:flutter_elearning_app/widgets/app_bar/custom_app_bar.dart';
import 'package:flutter_elearning_app/widgets/custom_text_form_field.dart';

import '../../widgets/custom_search_view.dart';
import '../promo_code_screen/widgets/frame_item_widget.dart';
import 'controller/promo_code_controller.dart';
import 'models/frame_item_model.dart';



class PromoCodeScreen extends StatefulWidget {
  const PromoCodeScreen({super.key});

  @override
  State<PromoCodeScreen> createState() => _PromoCodeScreenState();
}

class _PromoCodeScreenState extends State<PromoCodeScreen> {
 PromoCodeController controller = Get.put(PromoCodeController());

 @override
 Widget build(BuildContext context) {
  mediaQueryData = MediaQuery.of(context);
  return Scaffold(
    backgroundColor: appTheme.bgColor,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SizedBox(
            width: double.maxFinite,
            child: Column(children: [
             _buildHeader(),
             Expanded(
                 child: SizedBox(
                     width: double.maxFinite,
                     child: Container(
                         padding: EdgeInsets.symmetric(
                             horizontal: 16.h, vertical: 27.v),
                         child: Column(
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: [
                              Text("msg_have_a_coupon_code".tr,
                                  style: theme.textTheme.bodyLarge),
                              SizedBox(height: 8.v),
                              CustomSearchView(
                                filled: true,
                                  controller: controller.enterhereController,
                                  hintText: "msg_enter_coupon_code".tr,
                                  suffix: GestureDetector(
                                   onTap: () {

                                   },
                                   child: Padding(
                                    padding:  EdgeInsets.only(right: 16.h ),
                                    child: Container(
                                     decoration: BoxDecoration(borderRadius: BorderRadius.circular(29.h),
                                         color: appTheme.buttonColor),
                                     child: Center(
                                         child: Text("Apply",style: theme.textTheme.bodyMedium!.copyWith(color: appTheme.whiteA700))
                                     ),
                                    ),
                                   ),
                                  ),
                                  prefix: SizedBox(width: 16.h),
                                  suffixConstraints: BoxConstraints(maxWidth: 76.h,maxHeight: 32.v,minWidth: 76.h,minHeight: 32.v),
                                  contentPadding:
                                  EdgeInsets.symmetric(horizontal: 16.h, vertical: 14.v),
                                  borderDecoration: TextFormFieldStyleHelper.fillGray,
                                  fillColor: appTheme.gray10002
                              ),

                              SizedBox(height: 18.v),
                              Text("lbl_promo_code".tr,
                                  style: theme.textTheme.titleMedium),
                              SizedBox(height: 14.v),
                              _buildFrame()
                             ]))))
            ])),
      ));
 }

 /// Section Widget
 Widget _buildHeader() {
  return Container(
      padding: EdgeInsets.only(top: 19.v, bottom: 18.v),

      child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           SizedBox(height: 2.v),
           CustomAppBar(
               height: 29.v,
               leadingWidth: 44.h,
               leading: AppbarLeadingImage(
                   imagePath: ImageConstant.imgArrowLeft,
                   margin: EdgeInsets.only(left: 20.h, bottom: 4.v),
                   onTap: () {
                    onTapArrowLeft();
                   }),
               centerTitle: true,
               title: AppbarTitle(text: "lbl_coupon_code".tr))
          ]));
 }

 /// Section Widget
 Widget _buildFrame() {
  return Expanded(
      child: Obx(() => ListView.separated(
          physics: BouncingScrollPhysics(),
          shrinkWrap: true,
          separatorBuilder: (context, index) {
           return SizedBox(height: 16.v);
          },
          itemCount:
          controller.promoCodeModelObj.value.frameItemList.value.length,
          itemBuilder: (context, index) {
           FrameItemModel model =
           controller.promoCodeModelObj.value.frameItemList.value[index];
           return FrameItemWidget(model);
          })));
 }

 /// Navigates to the previous screen.
 onTapArrowLeft() {
  Get.back();
 }
}




