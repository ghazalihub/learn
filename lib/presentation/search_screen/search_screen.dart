import 'package:flutter/material.dart' hide SearchController;
import 'package:flutter_elearning_app/core/app_export.dart';
import 'package:flutter_elearning_app/widgets/custom_search_view.dart';
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
  SearchController controller = Get.put(SearchController());

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return PopScope(
      canPop: true,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) return;
      },
      child: Scaffold(
        backgroundColor: appTheme.bgColor,
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Column(children: [
            SizedBox(height: 24.v),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.h),
              child: Row(children: [
                Expanded(
                  child: CustomSearchView(
                    onTap: () {},
                    controller: controller.searchController,
                    hintText: "Search",
                    onChanged: (val) => controller.onSearch(val),
                    borderDecoration: CustomTextFormFieldStyleHelper.fillGrayTL161,
                    fillColor: appTheme.gray10001,
                  ),
                ),
                SizedBox(width: 16.h),
                GestureDetector(
                  onTap: () => Get.back(),
                  child: Text("Cancel", style: CustomTextStyles.bodyMediumBlack900),
                )
              ]),
            ),
            SizedBox(height: 16.h),
            Obx(() {
              if (controller.searchController.text.isEmpty) {
                return _buildRecentSection();
              }
              if (controller.isLoading.value) {
                return Center(child: CircularProgressIndicator());
              }
              return _buildResultsSection();
            }),
          ]),
        ),
      ),
    );
  }

  Widget _buildRecentSection() {
    return Column(children: [
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.h),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text("Recent ", style: CustomTextStyles.titleMediumBlack900_1),
          GestureDetector(
            onTap: () => controller.searchList.clear(),
            child: Padding(
              padding: EdgeInsets.only(bottom: 3.v),
              child: Text("Clear all", style: CustomTextStyles.bodyMediumBlack900),
            ),
          )
        ]),
      ),
      SizedBox(height: 8.v),
      ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 16.h),
        primary: false,
        shrinkWrap: true,
        itemCount: controller.searchList.length,
        itemBuilder: (context, index) {
          RecentclearallrowItemModel data = controller.searchList[index];
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 8.v),
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              GestureDetector(
                onTap: () {
                  controller.searchController.text = data.searchMsg!;
                  controller.onSearch(data.searchMsg!);
                },
                child: Text(data.searchMsg!, style: CustomTextStyles.bodyMediumBlack90016),
              ),
              CustomImageView(
                onTap: () => controller.searchList.removeAt(index),
                height: 24.adaptSize,
                width: 24.adaptSize,
                imagePath: ImageConstant.imgCloseIcon,
              )
            ]),
          );
        },
      )
    ]);
  }

  Widget _buildResultsSection() {
    return Expanded(
      child: Column(children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.h),
          child: Align(
            alignment: Alignment.centerLeft,
            child: RichText(
              text: TextSpan(children: [
                TextSpan(text: "lbl_result_found".tr, style: theme.textTheme.titleMedium),
                TextSpan(text: " ${controller.searchResults.length} items", style: CustomTextStyles.titleMediumPrimary)
              ]),
              textAlign: TextAlign.left,
            ),
          ),
        ),
        SizedBox(height: 16.v),
        Expanded(
          child: GridView.builder(
            padding: EdgeInsets.symmetric(horizontal: 16.h),
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisExtent: 238.v,
              crossAxisCount: 2,
              mainAxisSpacing: 16.h,
              crossAxisSpacing: 16.h,
            ),
            physics: BouncingScrollPhysics(),
            itemCount: controller.searchResults.length,
            itemBuilder: (context, index) {
              var model = controller.searchResults[index];
              return animationfunction(
                index,
                FavoritegridItemWidget(
                  FavoritegridItemModel(
                    model.thumbnailUrl,
                    model.title,
                    model.instructorImage,
                    model.instructorName,
                    model.category,
                    "${model.currency} ${model.price}",
                    false,
                  ),
                  onTapFund: () => Get.toNamed(AppRoutes.courseDetailsAboutScreen, arguments: model),
                ),
              );
            },
          ),
        ),
      ]),
    );
  }
}
