import 'package:flutter/material.dart';
import 'package:flutter_elearning_app/data/models/course_model.dart';
import 'package:flutter_elearning_app/core/app_export.dart';
import 'package:flutter_elearning_app/widgets/custom_text_form_field.dart';

import 'controller/result_found_controller.dart';

class ResultFoundScreen extends GetWidget<ResultFoundController> {
  const ResultFoundScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 16.h),
                child: Column(children: [
                  SizedBox(height: 24.v),
                  Expanded(
                      child: SizedBox(
                          width: double.maxFinite,
                          child: Column(children: [
                            CustomTextFormField(
                                controller: controller.searchController,
                                hintText: "lbl_search".tr,
                                textInputAction: TextInputAction.done,
                                onChanged: (value) {
                                  controller.search(value);
                                },
                                prefix: Container(
                                    margin: EdgeInsets.fromLTRB(
                                        16.h, 16.v, 12.h, 16.v),
                                    child: CustomImageView(
                                        imagePath: ImageConstant.imgContrast,
                                        height: 24.adaptSize,
                                        width: 24.adaptSize)),
                                prefixConstraints:
                                    BoxConstraints(maxHeight: 56.v),
                                suffix: GestureDetector(
                                  onTap: () {
                                    controller.searchController.clear();
                                    controller.search("");
                                  },
                                  child: Container(
                                      margin: EdgeInsets.fromLTRB(
                                          30.h, 16.v, 20.h, 16.v),
                                      child: CustomImageView(
                                          imagePath: ImageConstant.imgClose,
                                          height: 24.adaptSize,
                                          width: 24.adaptSize)),
                                ),
                                suffixConstraints:
                                    BoxConstraints(maxHeight: 56.v),
                                contentPadding:
                                    EdgeInsets.symmetric(vertical: 18.v),
                                borderDecoration:
                                    TextFormFieldStyleHelper.fillGrayTL161,
                                fillColor: appTheme.gray10001),
                            SizedBox(height: 18.v),
                            Align(
                                alignment: Alignment.centerLeft,
                                child: Obx(() => RichText(
                                    text: TextSpan(children: [
                                      TextSpan(
                                          text: "lbl_result_found".tr,
                                          style: theme.textTheme.titleMedium),
                                      TextSpan(
                                          text: " “${controller.searchResults.length} items”",
                                          style: CustomTextStyles
                                              .titleMediumPrimary)
                                    ]),
                                    textAlign: TextAlign.left))),
                            SizedBox(height: 18.v),
                             _buildFavoriteGrid()
                          ])))
                ]))));
  }

  /// Section Widget
  Widget _buildFavoriteGrid() {
    return Expanded(
        child: Obx(() => GridView.builder(
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisExtent: 240.v,
                crossAxisCount: 2,
                mainAxisSpacing: 16.h,
                crossAxisSpacing: 16.h),
            physics: BouncingScrollPhysics(),
            itemCount: controller.searchResults.length,
            itemBuilder: (context, index) {
              CourseModel model = controller.searchResults[index];
              return GestureDetector(
                onTap: () {
                  Get.toNamed(AppRoutes.courseDetailsAboutScreen, arguments: model);
                },
                child: Container(
                  decoration: AppDecoration.fillGray.copyWith(
                    borderRadius: BorderRadiusStyle.roundedBorder12,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomImageView(
                        imagePath: model.thumbnailUrl,
                        height: 115.v,
                        width: 174.h,
                        radius: BorderRadius.circular(12.h),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              model.title ?? "",
                              style: theme.textTheme.titleSmall,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(height: 8.v),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "${model.currency ?? ""}${model.price ?? ""}",
                                  style: theme.textTheme.labelLarge,
                                ),
                                Row(
                                  children: [
                                    Icon(Icons.star, color: Colors.amber, size: 14.adaptSize),
                                    Text(
                                      model.rating?.toString() ?? "0.0",
                                      style: theme.textTheme.labelMedium,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            })));
  }

  /// Navigates to the courseDetailsAboutScreen when the action is triggered.
  onTapFund() {
    Get.toNamed(
      AppRoutes.courseDetailsAboutScreen,
    );
  }
}
