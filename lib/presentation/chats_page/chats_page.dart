import 'controller/chats_controller.dart';
import 'models/chats_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_elearning_app/core/app_export.dart';
import 'package:flutter_elearning_app/widgets/app_bar/appbar_subtitle.dart';
import 'package:flutter_elearning_app/widgets/app_bar/custom_app_bar.dart';
import 'package:flutter_elearning_app/widgets/custom_elevated_button.dart';
import 'package:flutter_elearning_app/services/chat_service.dart';
import 'package:flutter_elearning_app/services/ad_service.dart';

class ChatsPage extends StatefulWidget {
  ChatsPage({Key? key})
      : super(
          key: key,
        );

  @override
  State<ChatsPage> createState() => _ChatsPageState();
}

class _ChatsPageState extends State<ChatsPage> {
  ChatsController controller = Get.put(ChatsController(ChatsModel().obs));

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        backgroundColor: appTheme.bgColor,
        body: Container(
          width: double.maxFinite,
          decoration: AppDecoration.white,
          child: Column(
            children: [
              _buildHeader(),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 40.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomImageView(
                      imagePath: ImageConstant.imgGroup341601,
                      height: 154.adaptSize,
                      width: 154.adaptSize,
                    ),
                    SizedBox(height: 26.v),
                    Text(
                      "lbl_no_chats_yet".tr,
                      style: theme.textTheme.titleLarge,
                    ),
                    SizedBox(height: 11.v),
                    SizedBox(
                      width: 347.h,
                      child: Text(
                        "msg_massage_can_improve".tr,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        style: theme.textTheme.bodyLarge!.copyWith(
                          height: 1.50,
                        ),
                      ),
                    ),
                    SizedBox(height: 28.v),
                    CustomElevatedButton(
                      text: "Unlock Chat (Watch Ad)",
                      onPressed: () {
                        Get.find<AdService>().showRewardedAd(onUserEarnedReward: (ad, reward) {
                          Get.find<ChatService>().unlockChat().then((_) {
                            Get.snackbar("Success", "Chat unlocked for 4 hours!");
                            setState(() {});
                          });
                        });
                      },
                      margin: EdgeInsets.only(
                        left: 50.h,
                        right: 48.h,
                      ),
                    ),
                    SizedBox(height: 5.v),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildHeader() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20.v),
      decoration: AppDecoration.white,
      child: CustomAppBar(
        centerTitle: true,
        title: AppbarSubtitle(
          text: "lbl_chat".tr,
        ),
      ),
    );
  }
}
