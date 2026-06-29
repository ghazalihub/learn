// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_elearning_app/core/app_export.dart';
import 'package:flutter_elearning_app/widgets/app_bar/appbar_leading_image.dart';
import 'package:flutter_elearning_app/widgets/app_bar/appbar_subtitle.dart';
import 'package:flutter_elearning_app/widgets/app_bar/custom_app_bar.dart';
import '../featured_course_screen/widgets/favoritegrid_item_widget.dart';
import 'controller/featured_course_controller.dart';
import 'models/favoritegrid_item_model.dart';



class FeaturedCourseScreen extends StatefulWidget {
  const FeaturedCourseScreen({super.key});

  @override
  State<FeaturedCourseScreen> createState() => _FeaturedCourseScreenState();
}

class _FeaturedCourseScreenState extends State<FeaturedCourseScreen> {
 FeaturedCourseController controller = Get.put(FeaturedCourseController());
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
        body: SafeArea(
          child: SizedBox(
              width: double.maxFinite,
              child: Obx(() => controller.isLoading.value ? Center(child: CircularProgressIndicator()) : Column(children: [
                 _buildHeader(),
                 SizedBox(height: 24.v),
                  Expanded(
                      child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.h),
                          child: GridView.builder(
                              shrinkWrap: true,
                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                  mainAxisExtent: 238.v,
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 16.h,
                                  crossAxisSpacing: 16.h),
                              physics: BouncingScrollPhysics(),
                              itemCount: controller.courses.length,
                              itemBuilder: (context, index) {
                                var model = controller.courses[index];
                                return animationfunction(index, FavoritegridItemWidget(
                                  FavoritegridItemModel(model.thumbnailUrl, model.title, model.instructorImage, model.instructorName, model.category, "${model.currency} ${model.price}", false),
                                  onTapFund: () {
                                    Get.toNamed(AppRoutes.courseDetailsAboutScreen, arguments: model);
                                  }
                                ));
                              }))),
                  SizedBox(height: 24.v),
                ]),
              )),
        )),
  );
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
          title: AppbarSubtitle(text: "lbl_featured_course".tr)));
 }

 /// Section Widget
 // Widget _buildFavoriteGrid() {
 //  return Expanded(
 //      child: Padding(
 //          padding: EdgeInsets.symmetric(horizontal: 16.h),
 //          child: Obx(() => GridView.builder(
 //              shrinkWrap: true,
 //              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
 //                  mainAxisExtent: 238.v,
 //                  crossAxisCount: 2,
 //                  mainAxisSpacing: 16.h,
 //                  crossAxisSpacing: 16.h),
 //              physics: BouncingScrollPhysics(),
 //              itemCount: controller.featuredCourseModelObj.value
 //                  .favoritegridItemList.value.length,
 //              itemBuilder: (context, index) {
 //               FavoritegridItemModel model = controller
 //                   .featuredCourseModelObj
 //                   .value
 //                   .favoritegridItemList
 //                   .value[index];
 //               return FavoritegridItemWidget(model, onTapFund: () {
 //                onTapFund();
 //               });
 //              }))));
 // }


 /// Navigates to the previous screen.
 onTapArrowLeft() {
  Get.back();
 }
}
