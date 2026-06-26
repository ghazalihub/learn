import 'package:flutter/material.dart';
import 'package:flutter_elearning_app/core/app_export.dart';
import 'package:flutter_elearning_app/widgets/app_bar/appbar_leading_image.dart';
import 'package:flutter_elearning_app/widgets/app_bar/appbar_subtitle.dart';
import 'package:flutter_elearning_app/widgets/app_bar/custom_app_bar.dart';
import 'package:flutter_elearning_app/widgets/banner_ad_widget.dart';

import '../categories_screen/widgets/categoriesgrid_item_widget.dart';
import 'controller/categories_controller.dart';
import 'models/categoriesgrid_item_model.dart';



class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
 CategoriesController controller = Get.put(CategoriesController());
 @override
 Widget build(BuildContext context) {
  mediaQueryData = MediaQuery.of(context);
  return Scaffold(
      backgroundColor: appTheme.bgColor,
      body: SafeArea(
        child: SizedBox(
            width: double.maxFinite,
            child: Column(children: [
             _buildHeader(),
             SizedBox(height: 10.v),
             BannerAdWidget(),
             SizedBox(height: 14.v),
             _buildCategoriesGrid()
            ])),
      ));
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
              margin: EdgeInsets.only(left: 20.h, bottom: 3.v),
              onTap: () {
               onTapArrowLeft();
              }),
          centerTitle: true,
          title: AppbarSubtitle(text: "lbl_categories".tr)));
 }

 /// Section Widget
 Widget _buildCategoriesGrid() {
  return Expanded(
      child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.h),
          child: Obx(() {
            if (controller.isLoading.value) {
              return Center(child: CircularProgressIndicator());
            }
            return GridView.builder(
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisExtent: 130.v,
                  crossAxisCount: 3,
                  mainAxisSpacing: 18.h,
                  crossAxisSpacing: 18.h),
              physics: BouncingScrollPhysics(),
              itemCount: controller.categories.length,
              itemBuilder: (context, index) {
               var model = controller.categories[index];
               return animationfunction(index, CategoriesgridItemWidget(
                 CategoriesgridItemModel(model.icon, model.title, Color(int.parse(model.colorHex!.replaceFirst('#', '0xff'))), index)
               ));
              });
          })));
 }

 /// Navigates to the previous screen.
 onTapArrowLeft() {
  Get.back();
 }
}




