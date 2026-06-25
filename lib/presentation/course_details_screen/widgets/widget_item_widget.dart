import 'package:flutter/services.dart';
import '../../video_screen/video_screen/controller/video_controller.dart';
import '../models/widget_item_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_elearning_app/core/app_export.dart';

class WidgetItemWidget extends StatefulWidget {
  WidgetItemWidget(this.widgetItemModelObj, {Key? key, this.onTap}) : super(key: key);
  final WidgetItemModel widgetItemModelObj;
  final VoidCallback? onTap;
  @override
  State<WidgetItemWidget> createState() => _WidgetItemWidgetState();
}

class _WidgetItemWidgetState extends State<WidgetItemWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 15.v),
        decoration: AppDecoration.fillGray.copyWith(borderRadius: BorderRadiusStyle.roundedBorder12),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Container(
              width: 44.adaptSize, padding: EdgeInsets.symmetric(vertical: 10.v),
              decoration: AppDecoration.fillIndigo5002.copyWith(borderRadius: BorderRadiusStyle.circleBorder24),
              child:Center(child: Text(widget.widgetItemModelObj.lessonNo!, style: CustomTextStyles.titleMediumPrimary_1))),
            Padding(
              padding: EdgeInsets.only(left: 12.h, top: 4.v),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(widget.widgetItemModelObj.title!, style: CustomTextStyles.titleMediumBlack900),
                  SizedBox(height: 7.v),
                  Text(widget.widgetItemModelObj.min!, style: CustomTextStyles.bodySmallBlack900)])),
            Spacer(),
            CustomImageView(
              imagePath: (widget.widgetItemModelObj.isComplete ?? false) ? ImageConstant.imgLessonTickIcon : ImageConstant.imgPlayIcon,
              height: 32.adaptSize, width: 32.adaptSize, margin: EdgeInsets.symmetric(vertical: 7.v))
        ])));
  }
}
