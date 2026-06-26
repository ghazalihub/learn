import 'package:flutter/material.dart';
import 'package:flutter_elearning_app/data/models/course_model.dart';
import 'package:flutter_elearning_app/core/app_export.dart';
import 'package:flutter_elearning_app/widgets/app_bar/appbar_leading_image.dart';
import 'package:flutter_elearning_app/widgets/app_bar/appbar_subtitle.dart';
import 'package:flutter_elearning_app/widgets/app_bar/custom_app_bar.dart';
import '../featured_course_screen/widgets/favoritegrid_item_widget.dart';
import 'controller/featured_course_controller.dart';

class FeaturedCourseScreen extends StatefulWidget {

  @override
  State<FeaturedCourseScreen> createState() => _FeaturedCourseScreenState();
}

class _FeaturedCourseScreenState extends State<FeaturedCourseScreen> {
  FeaturedCourseController featuredCourseController = Get.put(FeaturedCourseController());

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return PopScope(
      canPop: true,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) return;
        Get.back();
      },
      child: Scaffold(
        backgroundColor: appTheme.bgColor,
        body: SafeArea(
          child: SizedBox(
            width: double.maxFinite,
            child: GetBuilder<FeaturedCourseController>(
              init: FeaturedCourseController(),
              builder:(controller) => Column(children: [
                _buildHeader(),
                SizedBox(height: 24.v),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.h),
                    child: Obx(() => GridView.builder(
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        mainAxisExtent: 238.v,
                        crossAxisCount: 2,
                        mainAxisSpacing: 16.h,
                        crossAxisSpacing: 16.h),
                      physics: BouncingScrollPhysics(),
                      itemCount: controller.featuredCourceList.length,
                      itemBuilder: (context, index) {
                        CourseModel model = controller.featuredCourceList[index];
                        return animationfunction(index, FavoritegridItemWidget(model, onTapFund: () {
                          onTapFund(model);
                        }));
                      }))),
                ),
                SizedBox(height: 24.v),
              ]),
            ),
          ),
        ),
      ),
    );
  }

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

  onTapFund(CourseModel model) {
    Get.toNamed(AppRoutes.courseDetailsAboutScreen, arguments: model);
  }

  onTapArrowLeft() {
    Get.back();
  }
}
