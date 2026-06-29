import 'package:flutter/material.dart';
import 'package:flutter_elearning_app/core/app_export.dart';
import '../models/ronaldrichards_item_model.dart';

class RonaldrichardsItemWidget extends StatelessWidget {
  RonaldrichardsItemWidget(this.model);
  final RonaldrichardsItemModel model;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.h),
      decoration: AppDecoration.fillGray.copyWith(borderRadius: BorderRadiusStyle.roundedBorder12),
      child: Column(children: [
        CustomImageView(imagePath: model.userImage, height: 80.adaptSize, width: 80.adaptSize, radius: BorderRadius.circular(40.h)),
        SizedBox(height: 12.v),
        Text(model.userName!, style: theme.textTheme.titleSmall, textAlign: TextAlign.center, overflow: TextOverflow.ellipsis),
        SizedBox(height: 4.v),
        Text(model.userType!, style: theme.textTheme.bodySmall, textAlign: TextAlign.center, overflow: TextOverflow.ellipsis)
      ]),
    );
  }
}
