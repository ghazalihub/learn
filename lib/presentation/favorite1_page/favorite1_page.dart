import 'package:flutter/material.dart';
import 'package:flutter_elearning_app/core/app_export.dart';

import '../../widgets/app_bar/appbar_subtitle.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/app_bar/custum_bottom_bar_controller.dart';
import '../../widgets/custom_elevated_button.dart';
import 'package:flutter_elearning_app/data/models/course_model.dart';
import '../featured_course_screen/widgets/favoritegrid_item_widget.dart';
import 'controller/favorite1_controller.dart';

class Favorite1Page extends StatefulWidget {
  Favorite1Page({Key? key})
      : super(
          key: key,
        );

  @override
  State<Favorite1Page> createState() => _Favorite1PageState();
}

class _Favorite1PageState extends State<Favorite1Page> {
  Favorite1Controller controller = Get.put(Favorite1Controller());
  CustomBottomBarController customBottomBarController = Get.put(CustomBottomBarController());

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return GetBuilder<Favorite1Controller>(
      init: Favorite1Controller(),
      builder:(controller) =>  controller.favouriteList.isEmpty?
      Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildAppBar(),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 56.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomImageView(
                  imagePath: PrefUtils().getThemeData() == "primary"?ImageConstant.imgGroup34160154x154:ImageConstant.imgNoFavouritIcon,
                  height: 154.adaptSize,
                  width: 154.adaptSize,
                ),
                SizedBox(height: 26.v),
                Text(
                  "lbl_no_favorite_yet".tr,
                  style: theme.textTheme.titleLarge,
                ),
                SizedBox(height: 11.v),
                SizedBox(
                  width: 312.h,
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
                  onPressed: (){
                    customBottomBarController.getIndex(0);
                  },
                  text: "Go to home",
                  margin: EdgeInsets.only(
                    left: 33.h,
                    right: 31.h,
                  ),
                ),
                SizedBox(height: 5.v),
              ],
            ),
          ),
          SizedBox()
        ],
      ): Column(
        children: [
          _buildAppBar(),
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
                      itemCount: controller.favouriteList.length,
                      itemBuilder: (context, index) {
                        CourseModel model =
                            controller.favouriteList[index];
                        return animationfunction(
                            index,
                            FavoritegridItemWidget(model, onTapFund: () {
                              Get.toNamed(AppRoutes.courseDetailsAboutScreen, arguments: model);
                            }));
                      }))),
        ],
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return CustomAppBar(
        height: 64.v,
        centerTitle: true,
        title: AppbarSubtitle(text: "Favourite"));
  }
}
