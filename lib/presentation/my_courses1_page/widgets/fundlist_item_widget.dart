import 'package:flutter/material.dart';
import 'package:flutter_elearning_app/core/app_export.dart';
import 'package:flutter_elearning_app/widgets/custom_icon_button.dart';
import 'package:percent_indicator/percent_indicator.dart';
import '../controller/my_courses1_controller.dart';
import '../models/fundlist_item_model.dart';

// ignore: must_be_immutable
class FundlistItemWidget extends StatefulWidget {
  FundlistItemWidget(
    this.fundlistItemModelObj, {
    Key? key,
    this.onTapFund,
  }) : super(
          key: key,
        );

  FundlistItemModel fundlistItemModelObj;

  VoidCallback? onTapFund;

  @override
  State<FundlistItemWidget> createState() => _FundlistItemWidgetState();
}

class _FundlistItemWidgetState extends State<FundlistItemWidget> {
  var controller = Get.find<MyCourses1Controller>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onTapFund!.call();
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8.v),
        decoration: AppDecoration.fillGray.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder12,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomImageView(
              imagePath: widget.fundlistItemModelObj.image,
              height: 114.adaptSize,
              width: 114.adaptSize,
              radius: BorderRadius.circular(
                12.h,
              ),
            ),
            Container(
              height: 103.v,
              width: 254.h,
              margin: EdgeInsets.only(bottom: 10.v),
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  CustomIconButton(
                    onTap: () {
                      widget.fundlistItemModelObj.isLike =
                          !widget.fundlistItemModelObj.isLike!;
                      controller.update();
                    },
                    height: 28.adaptSize,
                    width: 28.adaptSize,
                    padding: EdgeInsets.all(6.h),
                    decoration: IconButtonStyleHelper.outlineBlackTL14,
                    alignment: Alignment.topRight,
                    child: CustomImageView(
                      color: appTheme.black900,
                      imagePath: widget.fundlistItemModelObj.isLike!
                          ? ImageConstant.imgFavouriteIcon
                          : ImageConstant.imgUnFavouriteIcon,
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 155.h,
                          child: Text(
                            widget.fundlistItemModelObj.title!,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: theme.textTheme.titleSmall!.copyWith(
                              color: appTheme.black900,
                              height: 1.71,
                            ),
                          ),
                        ),
                        SizedBox(height: 8.v),
                        Text(
                          widget.fundlistItemModelObj.time!,
                          style: CustomTextStyles.bodySmallBlack900,
                        ),
                        SizedBox(height: 11.v),
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 4.v),
                              child: Container(
                                height: 6.v,
                                width: 224.h,
                                decoration: BoxDecoration(
                                  color: appTheme.progressBarColor,
                                  borderRadius: BorderRadius.circular(
                                    3.h,
                                  ),
                                ),
                                child: LinearPercentIndicator(
                                  padding: EdgeInsets.zero,
barRadius: Radius.circular(16.h),
                                  backgroundColor:appTheme.progressBarColor ,

                                  animation: true,
                                  lineHeight: 6.v,
                                  percent: double.parse(
                                      widget.fundlistItemModelObj.progress!) /
                                      100,
                                  progressColor:appTheme.buttonColor,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 5.h),
                              child: Text(
                                "${widget.fundlistItemModelObj.progress!}%",
                                style: CustomTextStyles.bodySmallBlack900,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
