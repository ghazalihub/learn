// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart' hide SearchController;
import 'package:flutter_elearning_app/core/app_export.dart';
import 'package:flutter_elearning_app/widgets/custom_search_view.dart';

import '../../widgets/custom_text_form_field.dart';
import '../featured_course_screen/controller/featured_course_controller.dart';
import '../featured_course_screen/models/favoritegrid_item_model.dart';
import '../featured_course_screen/widgets/favoritegrid_item_widget.dart';
import 'controller/search_controller.dart';
import 'models/recentclearallrow_item_model.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  SearchController searchController = Get.put(SearchController());
  FeaturedCourseController featuredCourseController =
      Get.put(FeaturedCourseController());

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return WillPopScope(
      onWillPop: () async {
        Get.back();
        return true;
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: GetBuilder<SearchController>(
            init: SearchController(),
            builder: (controller) {
              return Column(
                children: [
                  SizedBox(height: 24.v),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.h),
                    child: Row(
                      children: [
                        Expanded(
                          child: CustomSearchView(
                            onTap: (){},
                              controller: controller.searchController,
                              hintText: "Search",
                              prefix: Container(
                                  margin: EdgeInsets.fromLTRB(16.h, 16.v, 12.h, 16.v),
                                  child: CustomImageView(
                                      imagePath: ImageConstant.imgContrast,
                                      height: 24.adaptSize,
                                      width: 24.adaptSize)),
                              prefixConstraints: BoxConstraints(maxHeight: 56.v),
                              suffix: Container(
                                  margin: EdgeInsets.fromLTRB(30.h, 16.v, 20.h, 16.v),
                                  child: CustomImageView(
                                      onTap: () {
                                        controller.searchController.clear();
                                        controller.update();
                                      },
                                      imagePath:
                                          ImageConstant.imgPlusOnprimarycontainer,
                                      height: 24.adaptSize,
                                      width: 24.adaptSize)),
                              suffixConstraints: BoxConstraints(maxHeight: 56.v),
                              contentPadding: EdgeInsets.symmetric(vertical: 18.v),
                              borderDecoration:
                                  TextFormFieldStyleHelper.fillGrayTL161,
                              fillColor: appTheme.gray10001),
                        ),
                        SizedBox(width: 16.h),
                        GestureDetector(
                          onTap: (){
                            Get.back();
                          },
                          child: Text(
                            "Cancel",
                            style: CustomTextStyles.bodyMediumBlack900,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  controller.searchController.text.isEmpty
                      ? Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Recent ",
                                style: CustomTextStyles.titleMediumBlack900_1,
                              ),
                              Padding(
                                padding: EdgeInsets.only(bottom: 3.v),
                                child: Text(
                                  "Clear all",
                                  style: CustomTextStyles.bodyMediumBlack900,
                                ),
                              ),
                            ],
                          ),
                        )
                      : Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.h),
                          child: Align(
                              alignment: Alignment.centerLeft,
                              child: RichText(
                                  text: TextSpan(children: [
                                    TextSpan(
                                        text: "lbl_result_found".tr,
                                        style: theme.textTheme.titleMedium),
                                    TextSpan(
                                        text: "lbl_20_items".tr,
                                        style:
                                            CustomTextStyles.titleMediumPrimary)
                                  ]),
                                  textAlign: TextAlign.left)),
                        ),
                  SizedBox(height: 8.v),
                  controller.searchController.text.isNotEmpty
                      ? Expanded(
                          child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16.h),
                              child: GridView.builder(
                                  shrinkWrap: true,
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                          mainAxisExtent: 238.v,
                                          crossAxisCount: 2,
                                          mainAxisSpacing: 16.h,
                                          crossAxisSpacing: 16.h),
                                  physics: BouncingScrollPhysics(),
                                  itemCount: featuredCourseController
                                      .featuredCourceList.length,
                                  itemBuilder: (context, index) {
                                    FavoritegridItemModel model =
                                        featuredCourseController
                                            .featuredCourceList[index];
                                    return animationfunction(
                                        index,
                                        FavoritegridItemWidget(model,
                                            onTapFund: () {
                                          Get.toNamed(AppRoutes
                                              .courseDetailsAboutScreen);
                                        }));
                                  })))
                      : ListView.builder(
                          padding: EdgeInsets.symmetric(horizontal: 16.h),
                          primary: false,
                          shrinkWrap: true,
                          itemCount: controller.searchList.length,
                          itemBuilder: (context, index) {
                            RecentclearallrowItemModel data =
                                controller.searchList[index];
                            return Padding(
                              padding: EdgeInsets.symmetric(vertical: 8.v),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      controller.searchController.text =
                                          data.searchMsg!;
                                      controller.update();
                                    },
                                    child: Text(
                                      data.searchMsg!,
                                      style:
                                          CustomTextStyles.bodyMediumBlack90016,
                                    ),
                                  ),
                                  CustomImageView(
                                    onTap: () {
                                      controller.searchList.removeAt(index);
                                      controller.update();
                                    },
                                    height: 24.adaptSize,
                                    width: 24.adaptSize,
                                    imagePath: ImageConstant.imgCloseIcon,
                                  )
                                ],
                              ),
                            );
                          },
                        )

                  // ntainer(
                  //       width: double.maxFinite,
                  //       padding: EdgeInsets.symmetric(
                  //         horizontal: 16.h,
                  //         vertical: 24.v,
                  //       ),
                  //       child: _buildRecentClearAllRow(),
                  // ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  /// Section Widget
// Widget _buildRecentClearAllRow() {
//   return Obx(
//         () => ListView.separated(
//       physics: BouncingScrollPhysics(),
//       shrinkWrap: true,
//       separatorBuilder: (
//           context,
//           index,
//           ) {
//         return SizedBox(
//           height: 16.v,
//         );
//       },
//       itemCount: searchController
//           .searchModelObj.value.recentclearallrowItemList.value.length,
//       itemBuilder: (context, index) {
//         RecentclearallrowItemModel model = searchController
//             .searchModelObj.value.recentclearallrowItemList.value[index];
//         return RecentclearallrowItemWidget(
//           model,
//         );
//       },
//     ),
//   );
// }
}
