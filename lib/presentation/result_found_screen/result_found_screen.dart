import 'package:flutter/material.dart';
import 'package:flutter_elearning_app/core/app_export.dart';
import 'package:flutter_elearning_app/widgets/custom_text_form_field.dart';
import '../featured_course_screen/models/favoritegrid_item_model.dart';
import '../featured_course_screen/widgets/favoritegrid_item_widget.dart';
import 'controller/result_found_controller.dart';

class ResultFoundScreen extends GetWidget<ResultFoundController> {
  const ResultFoundScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            backgroundColor: appTheme.bgColor,
            resizeToAvoidBottomInset: false,
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 16.h),
                child: Column(children: [
                  SizedBox(height: 24.v),
                  CustomTextFormField(
                      controller: controller.searchController,
                      hintText: "lbl_finance".tr,
                      onChanged: (val) => controller.search(val),
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
                                controller.search("");
                              },
                              imagePath: ImageConstant.imgPlusOnprimarycontainer,
                              height: 24.adaptSize,
                              width: 24.adaptSize)),
                      suffixConstraints: BoxConstraints(maxHeight: 56.v),
                      contentPadding: EdgeInsets.symmetric(vertical: 18.v),
                      borderDecoration: CustomTextFormFieldStyleHelper.fillGrayTL161,
                      fillColor: appTheme.gray10001),
                  SizedBox(height: 18.v),
                  Obx(() => Align(
                      alignment: Alignment.centerLeft,
                      child: RichText(
                          text: TextSpan(children: [
                            TextSpan(
                                text: "lbl_result_found".tr,
                                style: theme.textTheme.titleMedium),
                            TextSpan(
                                text: " ${controller.searchResults.length} items",
                                style: CustomTextStyles.titleMediumPrimary)
                          ]),
                          textAlign: TextAlign.left))),
                  SizedBox(height: 18.v),
                  Expanded(child: Obx(() => GridView.builder(
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          mainAxisExtent: 238.v,
                          crossAxisCount: 2,
                          mainAxisSpacing: 16.h,
                          crossAxisSpacing: 16.h),
                      physics: BouncingScrollPhysics(),
                      itemCount: controller.searchResults.length,
                      itemBuilder: (context, index) {
                        var model = controller.searchResults[index];
                        return animationfunction(index, FavoritegridItemWidget(
                            FavoritegridItemModel(model.thumbnailUrl, model.title, model.instructorImage, model.instructorName, model.category, "${model.currency} ${model.price}", false),
                            onTapFund: () => Get.toNamed(AppRoutes.courseDetailsAboutScreen, arguments: model)));
                      })))
                ]))));
  }
}
