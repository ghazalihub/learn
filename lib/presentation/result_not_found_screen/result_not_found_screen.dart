import 'controller/result_not_found_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_elearning_app/core/app_export.dart';
import 'package:flutter_elearning_app/widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable
class ResultNotFoundScreen extends GetWidget<ResultNotFoundController> {
  const ResultNotFoundScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(
            horizontal: 16.h,
            vertical: 24.v,
          ),
          child: Column(
            children: [
              CustomTextFormField(
                controller: controller.mACHINELEARNINGController,
                hintText: "msg_machine_learning".tr,
                textInputAction: TextInputAction.done,
                prefix: Container(
                  margin: EdgeInsets.fromLTRB(16.h, 16.v, 12.h, 16.v),
                  child: CustomImageView(
                    imagePath: ImageConstant.imgContrast,
                    height: 24.adaptSize,
                    width: 24.adaptSize,
                  ),
                ),
                prefixConstraints: BoxConstraints(
                  maxHeight: 56.v,
                ),
                suffix: Container(
                  margin: EdgeInsets.fromLTRB(30.h, 16.v, 20.h, 16.v),
                  child: CustomImageView(
                    imagePath: ImageConstant.imgPlusOnprimarycontainer,
                    height: 24.adaptSize,
                    width: 24.adaptSize,
                  ),
                ),
                suffixConstraints: BoxConstraints(
                  maxHeight: 56.v,
                ),
                contentPadding: EdgeInsets.symmetric(vertical: 18.v),
                borderDecoration: TextFormFieldStyleHelper.fillGrayTL161,
                fillColor: appTheme.gray10001,
              ),
              Spacer(
                flex: 39,
              ),
              Container(
                height: 120.adaptSize,
                width: 120.adaptSize,
                padding: EdgeInsets.all(30.h),
                decoration: AppDecoration.fillIndigo5002.copyWith(
                  borderRadius: BorderRadiusStyle.circleBorder60,
                ),
                child: CustomImageView(
                  imagePath: ImageConstant.imgMusic,
                  height: 57.adaptSize,
                  width: 57.adaptSize,
                  alignment: Alignment.center,
                ),
              ),
              SizedBox(height: 26.v),
              Text(
                "msg_search_result_not".tr,
                style: theme.textTheme.headlineSmall,
              ),
              SizedBox(height: 16.v),
              Container(
                width: 345.h,
                margin: EdgeInsets.only(
                  left: 24.h,
                  right: 25.h,
                ),
                child: Text(
                  "msg_sorry_we_couldn_t".tr,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: theme.textTheme.bodyLarge!.copyWith(
                    height: 1.50,
                  ),
                ),
              ),
              Spacer(
                flex: 60,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
