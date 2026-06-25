import 'controller/app_navigation_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_elearning_app/core/app_export.dart';

// ignore_for_file: must_be_immutable
class AppNavigationScreen extends GetWidget<AppNavigationController> {
  const AppNavigationScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0XFFFFFFFF),
        body: SizedBox(
          width: 375.h,
          child: Column(
            children: [
              _buildAppNavigation(),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0XFFFFFFFF),
                    ),
                    child: Column(
                      children: [
                        _buildScreenTitle(
                          onboardingText: "Splash Screen".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.splashScreen),
                        ),
                        _buildScreenTitle(
                          onboardingText: "01 Onboarding Screen".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.onboardingScreen),
                        ),
                        _buildScreenTitle(
                          onboardingText: "01 Onboarding Screen One".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              AppRoutes.onboardingScreenOneScreen),
                        ),
                        _buildScreenTitle(
                          onboardingText: "03 Onboarding Screen".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.onboarding1Screen),
                        ),
                        _buildScreenTitle(
                          onboardingText: "01 Log In Screen".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.logInScreen),
                        ),
                        _buildScreenTitle(
                          onboardingText: "02 Log In Screen wirh error".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              AppRoutes.logInScreenWirhErrorScreen),
                        ),
                        _buildScreenTitle(
                          onboardingText: "03 Log In Screen With Active".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              AppRoutes.logInScreenWithActiveScreen),
                        ),
                        _buildScreenTitle(
                          onboardingText: "04 Sign up".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.signUpScreen),
                        ),
                        _buildScreenTitle(
                          onboardingText: "05 Forgot password".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.forgotPasswordScreen),
                        ),
                        _buildScreenTitle(
                          onboardingText: "06 Verification".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.verificationScreen),
                        ),
                        _buildScreenTitle(
                          onboardingText: "07 Reset password".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.resetPasswordScreen),
                        ),
                        _buildScreenTitle(
                          onboardingText: "08 Reset password success".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              AppRoutes.resetPasswordSuccessScreen),
                        ),
                        _buildScreenTitle(
                          onboardingText: "01 Home Screen - Container".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              AppRoutes.homeScreenContainerScreen),
                        ),
                        _buildScreenTitle(
                          onboardingText: "02 Categories".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.categoriesScreen),
                        ),
                        _buildScreenTitle(
                          onboardingText: "03 Featured course".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.featuredCourseScreen),
                        ),
                        _buildScreenTitle(
                          onboardingText: "04 Popular Courses".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.popularCoursesScreen),
                        ),
                        _buildScreenTitle(
                          onboardingText: "05 Course Details About ".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              AppRoutes.courseDetailsAboutScreen),
                        ),
                        _buildScreenTitle(
                          onboardingText: "06 Lessons".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.lessonsScreen),
                        ),
                        _buildScreenTitle(
                          onboardingText: "07 Customer reviews".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.customerReviewsScreen),
                        ),
                        _buildScreenTitle(
                          onboardingText: "08 Cart".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.cartScreen),
                        ),
                        _buildScreenTitle(
                          onboardingText: "09 PRomo code".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.promoCodeScreen),
                        ),
                        _buildScreenTitle(
                          onboardingText: "10 Payment method".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.paymentMethodScreen),
                        ),
                        _buildScreenTitle(
                          onboardingText: "11 Book Success".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.bookSuccessScreen),
                        ),
                        _buildScreenTitle(
                          onboardingText: "12 Search".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.searchScreen),
                        ),
                        _buildScreenTitle(
                          onboardingText: "13 Result found".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.resultFoundScreen),
                        ),
                        _buildScreenTitle(
                          onboardingText: "14 Result not found".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.resultNotFoundScreen),
                        ),
                        _buildScreenTitle(
                          onboardingText: "15 Popular instructor".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              AppRoutes.popularInstructorScreen),
                        ),
                        _buildScreenTitle(
                          onboardingText: "16 Instructor details".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              AppRoutes.instructorDetailsScreen),
                        ),
                        _buildScreenTitle(
                          onboardingText: "01 My courses".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.myCoursesScreen),
                        ),
                        _buildScreenTitle(
                          onboardingText: "03 Course details".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.courseDetailsScreen),
                        ),
                        _buildScreenTitle(
                          onboardingText: "01 Favorite".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.favoriteScreen),
                        ),
                        _buildScreenTitle(
                          onboardingText: "02 Chat List - Tab Container".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              AppRoutes.chatListTabContainerScreen),
                        ),
                        _buildScreenTitle(
                          onboardingText: "04 Chat details".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.chatDetailsScreen),
                        ),
                        _buildScreenTitle(
                          onboardingText: "05 Call Details".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.callDetailsScreen),
                        ),
                        _buildScreenTitle(
                          onboardingText: "06 Videocall details".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              AppRoutes.videocallDetailsScreen),
                        ),
                        _buildScreenTitle(
                          onboardingText: "01 Profile One".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.profileOneScreen),
                        ),
                        _buildScreenTitle(
                          onboardingText: "02 My profile".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.myProfileScreen),
                        ),
                        _buildScreenTitle(
                          onboardingText: "03 Edit profile".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.editProfileScreen),
                        ),
                        _buildScreenTitle(
                          onboardingText: "04 My cards".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.myCardsScreen),
                        ),
                        _buildScreenTitle(
                          onboardingText: "05 Add new cards".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.addNewCardsScreen),
                        ),
                        _buildScreenTitle(
                          onboardingText: "06 Add new cards".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.addNewCards1Screen),
                        ),
                        _buildScreenTitle(
                          onboardingText: "07 Notifications".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.notificationsScreen),
                        ),
                        _buildScreenTitle(
                          onboardingText: "08 Privacy policy".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.privacyPolicyScreen),
                        ),
                        _buildScreenTitle(
                          onboardingText: "09 Log out".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.logOutScreen),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildAppNavigation() {
    return Container(
      decoration: BoxDecoration(
        color: Color(0XFFFFFFFF),
      ),
      child: Column(
        children: [
          SizedBox(height: 10.v),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.h),
              child: Text(
                "App Navigation".tr,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0XFF000000),
                  fontSize: 20.fSize,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          SizedBox(height: 10.v),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 20.h),
              child: Text(
                "Check your app's UI from the below demo screens of your app."
                    .tr,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0XFF888888),
                  fontSize: 16.fSize,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          SizedBox(height: 5.v),
          Divider(
            height: 1.v,
            thickness: 1.v,
            color: Color(0XFF000000),
          ),
        ],
      ),
    );
  }

  /// Common widget
  Widget _buildScreenTitle({
    required String onboardingText,
    Function? onTapScreenTitle,
  }) {
    return GestureDetector(
      onTap: () {
        onTapScreenTitle!.call();
      },
      child: Container(
        decoration: BoxDecoration(
          color: Color(0XFFFFFFFF),
        ),
        child: Column(
          children: [
            SizedBox(height: 10.v),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.h),
                child: Text(
                  onboardingText,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0XFF000000),
                    fontSize: 20.fSize,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10.v),
            SizedBox(height: 5.v),
            Divider(
              height: 1.v,
              thickness: 1.v,
              color: Color(0XFF888888),
            ),
          ],
        ),
      ),
    );
  }

  /// Common click event
  void onTapScreenTitle(String routeName) {
    Get.toNamed(routeName);
  }
}
