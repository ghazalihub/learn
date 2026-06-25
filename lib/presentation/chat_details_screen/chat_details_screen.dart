// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_elearning_app/core/app_export.dart';
import 'package:flutter_elearning_app/widgets/app_bar/appbar_leading_image.dart';
import 'package:flutter_elearning_app/widgets/app_bar/appbar_subtitle_one.dart';
import 'package:flutter_elearning_app/widgets/app_bar/appbar_subtitle_three.dart';
import 'package:flutter_elearning_app/widgets/app_bar/appbar_title_circleimage.dart';
import 'package:flutter_elearning_app/widgets/app_bar/appbar_trailing_image.dart';
import 'package:flutter_elearning_app/widgets/app_bar/custom_app_bar.dart';
import 'package:flutter_elearning_app/widgets/custom_search_view.dart';
import 'controller/chat_details_controller.dart';


class ChatDetailsScreen extends StatefulWidget {
  const ChatDetailsScreen({super.key});

  @override
  State<ChatDetailsScreen> createState() => _ChatDetailsScreenState();
}

class _ChatDetailsScreenState extends State<ChatDetailsScreen> {
 ChatDetailsController controller = Get.put(ChatDetailsController());
 @override
 Widget build(BuildContext context) {
  mediaQueryData = MediaQuery.of(context);
  return WillPopScope(
   onWillPop: () async{
    Get.back();
     return true;
   },
    child: Scaffold(
     backgroundColor: appTheme.bgColor,
        resizeToAvoidBottomInset: true,
        body: SafeArea(
          child: Container(
              width: double.maxFinite,
              padding: EdgeInsets.symmetric(vertical: 22.v),
              child: Column(mainAxisSize: MainAxisSize.min, children: [
               _buildAppBar(),
               SizedBox(height: 24.v),
               Expanded(
                 child: ListView(
                   children: [
                             Container(
                       padding: EdgeInsets.symmetric(horizontal: 16.h),
                       child: Column(
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: [
                              Align(
                                  alignment: Alignment.centerRight,
                                  child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                       Column(
                                           crossAxisAlignment:
                                           CrossAxisAlignment.end,
                                           children: [
                                            Text("lbl_you".tr,
                                                style: CustomTextStyles
                                                    .bodySmallGray700),
                                            SizedBox(height: 7.v),
                                            Container(
                                                width: 176.h,
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 16.h,
                                                    vertical: 5.v),
                                                decoration: PrefUtils().getThemeData() == "primary"?AppDecoration
                                                    .fillIndigo5002
                                                    .copyWith(
                                                    borderRadius:
                                                    BorderRadiusStyle
                                                        .customBorderTL12):AppDecoration
                                                .fillGray
                                                .copyWith(
                                            borderRadius:
                                            BorderRadiusStyle
                                                .customBorderTL12),
                                                child: Column(
                                                    mainAxisSize:
                                                    MainAxisSize.min,
                                                    crossAxisAlignment:
                                                    CrossAxisAlignment
                                                        .start,
                                                    mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                    children: [
                                                     SizedBox(height: 5.v),
                                                     SizedBox(
                                                         width: 126.h,
                                                         child: Text(
                                                             "msg_hi_good_afternoon"
                                                                 .tr,
                                                             maxLines: 2,
                                                             overflow:
                                                             TextOverflow
                                                                 .ellipsis,
                                                             style: theme
                                                                 .textTheme
                                                                 .bodyLarge!
                                                                 .copyWith(
                                                                 height:
                                                                 1.50)))
                                                    ])),
                                            SizedBox(height: 7.v),
                                            Text("lbl_12_00_pm".tr,
                                                style: CustomTextStyles
                                                    .bodySmallGray700)
                                           ]),
                                       CustomImageView(
                                           imagePath: ImageConstant.imgEllipse24,
                                           height: 50.adaptSize,
                                           width: 50.adaptSize,
                                           radius: BorderRadius.circular(25.h),
                                           margin: EdgeInsets.only(
                                               left: 8.h, bottom: 58.v))
                                      ])),
                              SizedBox(height: 15.v),
                              Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                   CustomImageView(
                                       imagePath: ImageConstant.imgEllipse23,
                                       height: 50.adaptSize,
                                       width: 50.adaptSize,
                                       radius: BorderRadius.circular(25.h),
                                       margin: EdgeInsets.only(bottom: 58.v)),
                                   Padding(
                                       padding: EdgeInsets.only(left: 8.h),
                                       child: Column(
                                           crossAxisAlignment:
                                           CrossAxisAlignment.start,
                                           children: [
                                            Text("lbl_esther_howard".tr,
                                                style: CustomTextStyles
                                                    .bodySmallGray700),
                                            SizedBox(height: 7.v),
                                            Container(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 16.h,
                                                    vertical: 5.v),
                                                decoration: AppDecoration
                                                    .fillGray
                                                    .copyWith(
                                                    borderRadius:
                                                    BorderRadiusStyle
                                                        .customBorderTL12),
                                                child: Column(
                                                    mainAxisSize:
                                                    MainAxisSize.min,
                                                    mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                    children: [
                                                     SizedBox(height: 5.v),
                                                     SizedBox(
                                                         width: 126.h,
                                                         child: Text(
                                                             "msg_hi_good_afternoon2"
                                                                 .tr,
                                                             maxLines: 2,
                                                             overflow:
                                                             TextOverflow
                                                                 .ellipsis,
                                                             style: theme
                                                                 .textTheme
                                                                 .bodyLarge!
                                                                 .copyWith(
                                                                 height:
                                                                 1.50)))
                                                    ])),
                                            SizedBox(height: 7.v),
                                            Text("lbl_13_00_pm".tr,
                                                style: CustomTextStyles
                                                    .bodySmallGray700)
                                           ]))
                                  ]),
                              SizedBox(height: 15.v),
                              Align(
                                  alignment: Alignment.centerRight,
                                  child: Padding(
                                      padding: EdgeInsets.only(left: 85.h),
                                      child: Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.end,
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                           Expanded(
                                               child: Column(
                                                   crossAxisAlignment:
                                                   CrossAxisAlignment.end,
                                                   children: [
                                                    Text("lbl_you".tr,
                                                        style: CustomTextStyles
                                                            .bodySmallGray700),
                                                    SizedBox(height: 7.v),
                                                    Container(
                                                        padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 15.h,
                                                            vertical: 5.v),
                                                        decoration: PrefUtils().getThemeData() == "primary"?AppDecoration
                                                            .fillIndigo5002
                                                            .copyWith(
                                                            borderRadius:
                                                            BorderRadiusStyle
                                                                .customBorderTL12):AppDecoration
                                                            .fillGray
                                                            .copyWith(
                                                            borderRadius:
                                                            BorderRadiusStyle
                                                                .customBorderTL12),
                                                        child: Column(
                                                            mainAxisSize:
                                                            MainAxisSize.min,
                                                            mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .end,
                                                            children: [
                                                             SizedBox(height: 5.v),
                                                             SizedBox(
                                                                 width: 221.h,
                                                                 child: Text(
                                                                     "msg_i_m_ronald_i_have"
                                                                         .tr,
                                                                     maxLines: 2,
                                                                     overflow:
                                                                     TextOverflow
                                                                         .ellipsis,
                                                                     style: theme
                                                                         .textTheme
                                                                         .bodyLarge!
                                                                         .copyWith(
                                                                         height:
                                                                         1.50)))
                                                            ])),
                                                    SizedBox(height: 7.v),
                                                    Text("lbl_13_30_pm".tr,
                                                        style: CustomTextStyles
                                                            .bodySmallGray700)
                                                   ])),
                                           CustomImageView(
                                               imagePath:
                                               ImageConstant.imgEllipse24,
                                               height: 50.adaptSize,
                                               width: 50.adaptSize,
                                               radius:
                                               BorderRadius.circular(25.h),
                                               margin: EdgeInsets.only(
                                                   left: 8.h, bottom: 58.v))
                                          ]))),
                              SizedBox(height: 15.v),
                              Padding(
                                  padding: EdgeInsets.only(right: 112.h),
                                  child: Row(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                       CustomImageView(
                                           imagePath: ImageConstant.imgEllipse23,
                                           height: 50.adaptSize,
                                           width: 50.adaptSize,
                                           radius: BorderRadius.circular(25.h),
                                           margin:
                                           EdgeInsets.only(bottom: 58.v)),
                                       Expanded(
                                           child: Padding(
                                               padding:
                                               EdgeInsets.only(left: 8.h),
                                               child: Column(
                                                   crossAxisAlignment:
                                                   CrossAxisAlignment.start,
                                                   children: [
                                                    Text("lbl_esther_howard".tr,
                                                        style: CustomTextStyles
                                                            .bodySmallGray700),
                                                    SizedBox(height: 7.v),
                                                    Container(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                            horizontal:
                                                            16.h,
                                                            vertical: 5.v),
                                                        decoration: AppDecoration
                                                            .fillGray
                                                            .copyWith(
                                                            borderRadius:
                                                            BorderRadiusStyle
                                                                .customBorderTL12),
                                                        child: Column(
                                                            mainAxisSize:
                                                            MainAxisSize
                                                                .min,
                                                            mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .end,
                                                            children: [
                                                             SizedBox(
                                                                 height: 5.v),
                                                             Container(
                                                                 width: 189.h,
                                                                 margin: EdgeInsets
                                                                     .only(
                                                                     right: 4
                                                                         .h),
                                                                 child: Text(
                                                                     "msg_can_you_tell_me"
                                                                         .tr,
                                                                     maxLines:
                                                                     2,
                                                                     overflow:
                                                                     TextOverflow
                                                                         .ellipsis,
                                                                     style: theme
                                                                         .textTheme
                                                                         .bodyLarge!
                                                                         .copyWith(
                                                                         height: 1.50)))
                                                            ])),
                                                    SizedBox(height: 7.v),
                                                    Text("lbl_13_00_pm".tr,
                                                        style: CustomTextStyles
                                                            .bodySmallGray700)
                                                   ])))
                                      ]))
                             ])),
                           ],
                 ),
               ),
               _buildBoxAndMic(),
              ])),
        ),


  ));
 }

 /// Section Widget
 PreferredSizeWidget _buildAppBar() {
  return CustomAppBar(
      height: 56.v,
      leadingWidth: 40.h,
      leading: AppbarLeadingImage(
          imagePath: ImageConstant.imgArrowLeft,
          margin: EdgeInsets.only(left: 16.h, top: 16.v, bottom: 16.v),
          onTap: () {
           onTapArrowLeft();
          }),
      title: Padding(
          padding: EdgeInsets.only(left: 16.h),
          child: Row(children: [
           AppbarTitleCircleimage(imagePath: ImageConstant.imgEllipse23),
           Padding(
               padding: EdgeInsets.only(left: 16.h, top: 2.v),
               child: Column(children: [
                AppbarSubtitleOne(text: "lbl_esther_howard".tr),
                SizedBox(height: 7.v),
                AppbarSubtitleThree(
                    text: "msg_active_6_hour_ago".tr,
                    margin: EdgeInsets.only(right: 34.h))
               ]))
          ])),
      actions: [
       AppbarTrailingImage(
           imagePath: ImageConstant.imgVideoCameraOnprimary,
           margin: EdgeInsets.only(left: 16.h, top: 16.v, right: 16.h),
           onTap: () {
            onTapVideoCamera();
           }),
       AppbarTrailingImage(
           imagePath: ImageConstant.imgCallOnprimary,
           margin: EdgeInsets.only(left: 24.h, top: 16.v, right: 32.h),
           onTap: () {
            onTapCall();
           })
      ]);
 }

 /// Section Widget
 Widget _buildBoxAndMic() {
  return Padding(
      padding: EdgeInsets.only(left: 16.h, right: 16.h, bottom: 0.v),
      child: Row(children: [
       Expanded(
           child: CustomSearchView(
            prefix: SizedBox(),
      prefixConstraints: BoxConstraints(minWidth: 16.h),
      hintText: "lbl_massage".tr,
          controller:  controller.massageController,
      )
  ),
       SizedBox(width: 16.h),
       Container(
        height: 58.v,
        width: 58.v,
        decoration: BoxDecoration(color: appTheme.buttonColor,
        shape: BoxShape.circle,),
        child: Padding(
          padding:  EdgeInsets.all(11.28.h),
          child: CustomImageView(
           imagePath:ImageConstant.imgGroup29,
          ),
        ),
       )
      ]));
 }



 /// Navigates to the previous screen.
 onTapArrowLeft() {
  Get.back();
 }

 /// Navigates to the videocallDetailsScreen when the action is triggered.
 onTapVideoCamera() {
  Get.toNamed(
   AppRoutes.videocallDetailsScreen,
  );
 }

 /// Navigates to the callDetailsScreen when the action is triggered.
 onTapCall() {
  Get.toNamed(
   AppRoutes.callDetailsScreen,
  );
 }
}





