import 'package:flutter/material.dart';
import 'package:flutter_elearning_app/core/app_export.dart';
import 'package:percent_indicator/percent_indicator.dart';
import '../models/fundlist_item_model.dart';

class FundlistItemWidget extends StatefulWidget {
  FundlistItemWidget(this.fundlistItemModelObj, {Key? key, this.onTapFund}) : super(key: key);
  final FundlistItemModel fundlistItemModelObj;
  final VoidCallback? onTapFund;
  @override
  State<FundlistItemWidget> createState() => _FundlistItemWidgetState();
}

class _FundlistItemWidgetState extends State<FundlistItemWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTapFund,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8.v),
        decoration: AppDecoration.fillGray.copyWith(borderRadius: BorderRadiusStyle.roundedBorder12),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, crossAxisAlignment: CrossAxisAlignment.start, children: [
            CustomImageView(imagePath: widget.fundlistItemModelObj.image, height: 114.adaptSize, width: 114.adaptSize, radius: BorderRadius.circular(12.h)),
            Expanded(child: Padding(padding: EdgeInsets.symmetric(horizontal: 12.h), child: Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(widget.fundlistItemModelObj.title!, maxLines: 2, overflow: TextOverflow.ellipsis, style: theme.textTheme.titleSmall!.copyWith(color: appTheme.black900, height: 1.71)),
                  SizedBox(height: 8.v),
                  Text(widget.fundlistItemModelObj.time!, style: CustomTextStyles.bodySmallBlack900),
                  SizedBox(height: 11.v),
                  Row(children: [
                      Expanded(child: LinearPercentIndicator(padding: EdgeInsets.zero, barRadius: Radius.circular(16.h), backgroundColor:appTheme.progressBarColor, animation: true, lineHeight: 6.v, percent: widget.fundlistItemModelObj.progressValue ?? 0, progressColor:appTheme.buttonColor)),
                      Padding(padding: EdgeInsets.only(left: 5.h), child: Text(widget.fundlistItemModelObj.progress!, style: CustomTextStyles.bodySmallBlack900))
                  ])
            ])))
        ])));
  }
}
