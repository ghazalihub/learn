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
import 'package:flutter_elearning_app/services/chat_service.dart';
import 'package:flutter_elearning_app/services/auth_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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
  return PopScope(
   canPop: true,
   onPopInvokedWithResult: (didPop, result) {
    if (didPop) return;
    // Get.back();
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
                 child: StreamBuilder<QuerySnapshot>(
                   stream: Get.find<ChatService>().getMessages("default_chat"),
                   builder: (context, snapshot) {
                     if (!snapshot.hasData) return Center(child: CircularProgressIndicator());
                     final messages = snapshot.data!.docs;
                     final currentUserId = Get.find<AuthService>().currentUser.value?.userId;
                     return ListView.builder(
                       reverse: true,
                       padding: EdgeInsets.symmetric(horizontal: 16.h),
                       itemCount: messages.length,
                       itemBuilder: (context, index) {
                         final msg = messages[index].data() as Map<String, dynamic>;
                         final isMe = msg['senderId'] == currentUserId;
                         return Align(
                           alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
                           child: Container(
                             margin: EdgeInsets.symmetric(vertical: 4.v),
                             padding: EdgeInsets.all(12.h),
                             decoration: BoxDecoration(
                               color: isMe ? appTheme.buttonColor : appTheme.gray,
                               borderRadius: BorderRadius.circular(12.h),
                             ),
                             child: Text(msg['text'] ?? "", style: TextStyle(color: isMe ? Colors.white : appTheme.black900)),
                           ),
                         );
                       },
                     );
                   }
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
       GestureDetector(
         onTap: () {
           final text = controller.massageController.text;
           if (text.isNotEmpty) {
             final currentUserId = Get.find<AuthService>().currentUser.value?.userId;
             Get.find<ChatService>().sendMessage("default_chat", currentUserId ?? "guest", text);
             controller.massageController.clear();
           }
         },
         child: Container(
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





