import 'package:flutter/material.dart';
import 'package:flutter_elearning_app/core/app_export.dart';

import 'app_bar/custum_bottom_bar_controller.dart';

// ignore: must_be_immutable
class CustomBottomBar extends StatelessWidget {
  CustomBottomBar({
    Key? key,
    this.onChanged,
  }) : super(
          key: key,
        );

  RxInt selectedIndex = 0.obs;

  List<BottomMenuModel> bottomMenuList = [
    BottomMenuModel(
      icon: ImageConstant.imgNavHomeInactive,
      activeIcon: ImageConstant.imgNavHomeActive,
      title: "lbl_home".tr,
      type: BottomBarEnum.Home,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgNavMyCoursesInactive,
      activeIcon: PrefUtils().getThemeData() == "primary"?ImageConstant.imgNavMyCoursesActive:
      ImageConstant.imgNavMyCoursesActiveDark,
      title: "lbl_my_courses".tr,
      type: BottomBarEnum.Mycourses,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgNavFavoriteInactive,
      activeIcon: ImageConstant.imgNavFavoriteActive,
      title: "lbl_favorite".tr,
      type: BottomBarEnum.Favorite,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgNavChatInactive,
      activeIcon: PrefUtils().getThemeData() == "primary"?ImageConstant.imgNavChatActive:ImageConstant.imgNavChatActiveDark,
      title: "lbl_chat".tr,
      type: BottomBarEnum.Chat,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgNavProfileInactive,
      activeIcon: ImageConstant.imgNavProfileActive,
      title: "lbl_profile".tr,
      type: BottomBarEnum.Profile,
    )
  ];

  Function(BottomBarEnum)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: PrefUtils().getThemeData() == "primary"?BoxDecoration(
        color: appTheme.bgColor,
        boxShadow: [
          BoxShadow(
            color:appTheme.black900.withValues(alpha: 0.03),
            spreadRadius: 2.h,
            blurRadius: 16,
            offset: Offset(
              0,
              -6,
            ),
          ),
        ],
      ):BoxDecoration(
        color: appTheme.darkInput,
      ),
      child: GetBuilder<CustomBottomBarController>(
        init: CustomBottomBarController(),
        builder:(controller) =>  BottomNavigationBar(
          backgroundColor: Colors.transparent,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          elevation: 0,
          currentIndex: controller.selectedIndex,
          type: BottomNavigationBarType.fixed,
          items: List.generate(bottomMenuList.length, (index) {
            return
              BottomNavigationBarItem(
                icon: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CustomImageView(
                      imagePath: bottomMenuList[index].icon,
                      height: 24.v,
                      width: 24.v,
                      // color: ColorConstant.indigo800,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: 8.v,
                      ),
                      child: Text(
                        bottomMenuList[index].title ?? "",
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: CustomTextStyles.bodyMediumPrimary.copyWith(
                          color: PrefUtils().getThemeData() == "primary"?appTheme.black900:appTheme.gray700,
                        ),
                      ),
                    ),
                  ],
                ),
                activeIcon: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CustomImageView(
                      imagePath: bottomMenuList[index].activeIcon,
                      height: 24.v,
                      width: 24.v,
                      // color: ColorConstant.indigo800,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: 8.v,
                      ),
                      child: Text(
                        bottomMenuList[index].title ?? "",
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: CustomTextStyles.bodyMediumPrimary.copyWith(
                          color: theme.colorScheme.primary,
                        ),
                      ),
                    ),
                  ],
                ),
                label: '',
              );
          }),
          onTap:  (index) {
            controller.getIndex(index);
          },
        ),
      ),
    );
  }
}

enum BottomBarEnum {
  Home,
  Mycourses,
  Favorite,
  Chat,
  Profile,
}

class BottomMenuModel {
  BottomMenuModel({
    required this.icon,
    required this.activeIcon,
    this.title,
    required this.type,
  });

  String icon;

  String activeIcon;

  String? title;

  BottomBarEnum type;
}

class DefaultWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(10),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Please replace the respective Widget here',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
