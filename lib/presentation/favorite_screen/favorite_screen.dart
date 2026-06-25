import 'controller/favorite_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_elearning_app/core/app_export.dart';
import 'package:flutter_elearning_app/presentation/chats_page/chats_page.dart';
import 'package:flutter_elearning_app/presentation/favorite1_page/favorite1_page.dart';
import 'package:flutter_elearning_app/presentation/home_screen_page/home_screen_page.dart';
import 'package:flutter_elearning_app/presentation/my_courses1_page/my_courses1_page.dart';
import 'package:flutter_elearning_app/presentation/profile_tab_container_page/profile_tab_container_page.dart';
import 'package:flutter_elearning_app/widgets/app_bar/appbar_subtitle.dart';
import 'package:flutter_elearning_app/widgets/app_bar/custom_app_bar.dart';
import 'package:flutter_elearning_app/widgets/custom_bottom_bar.dart';
import 'package:flutter_elearning_app/widgets/custom_elevated_button.dart';

// ignore_for_file: must_be_immutable
class FavoriteScreen extends GetWidget<FavoriteController> {
  const FavoriteScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: double.maxFinite,
          child: Column(
            children: [
              _buildHeader(),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomImageView(
                    imagePath: ImageConstant.imgGroup34160154x154,
                    height: 154.adaptSize,
                    width: 154.adaptSize,
                  ),
                  SizedBox(height: 26.v),
                  Text(
                    "lbl_no_favorite_yet".tr,
                    style: theme.textTheme.titleLarge,
                  ),
                  SizedBox(height: 12.v),
                  SizedBox(
                    width: 287.h,
                    child: Text(
                      "msg_no_favorite_the".tr,
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
                    width: 250.h,
                    text: "lbl_go_to_home".tr,
                  ),
                  SizedBox(height: 5.v),
                ],
              ),
            ],
          ),
        ),
        bottomNavigationBar: _buildBottomBar(),
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
          text: "lbl_favorite".tr,
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildBottomBar() {
    return CustomBottomBar(
      onChanged: (BottomBarEnum type) {
        Get.toNamed(getCurrentRoute(type), id: 1);
      },
    );
  }

  ///Handling route based on bottom click actions
  String getCurrentRoute(BottomBarEnum type) {
    switch (type) {
      case BottomBarEnum.Home:
        return AppRoutes.homeScreenPage;
      case BottomBarEnum.Mycourses:
        return AppRoutes.myCourses1Page;
      case BottomBarEnum.Favorite:
        return AppRoutes.favorite1Page;
      case BottomBarEnum.Chat:
        return AppRoutes.chatsPage;
      case BottomBarEnum.Profile:
        return AppRoutes.profileTabContainerPage;
      default:
        return "/";
    }
  }

  ///Handling page based on route
  Widget getCurrentPage(String currentRoute) {
    switch (currentRoute) {
      case AppRoutes.homeScreenPage:
        return HomeScreenPage();
      case AppRoutes.myCourses1Page:
        return MyCourses1Page();
      case AppRoutes.favorite1Page:
        return Favorite1Page();
      case AppRoutes.chatsPage:
        return ChatsPage();
      case AppRoutes.profileTabContainerPage:
        return ProfileTabContainerPage();
      default:
        return DefaultWidget();
    }
  }
}
