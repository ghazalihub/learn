import '../controller/onboarding1_controller.dart';
import '../models/learningframe1_item_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_elearning_app/core/app_export.dart';

// ignore: must_be_immutable
class Learningframe1ItemWidget extends StatelessWidget {
  Learningframe1ItemWidget(
    this.learningframe1ItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  Learningframe1ItemModel learningframe1ItemModelObj;

  var controller = Get.find<Onboarding1Controller>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 355.h,
          margin: EdgeInsets.only(
            left: 18.h,
            right: 14.h,
          ),
          child: Text(
            "msg_learn_at_your_own".tr,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: theme.textTheme.headlineMedium!.copyWith(
              height: 1.36,
            ),
          ),
        ),
        SizedBox(height: 15.v),
        SizedBox(
          width: 388.h,
          child: Text(
            "msg_elearning_or_electronic".tr,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: theme.textTheme.bodyLarge!.copyWith(
              height: 1.50,
            ),
          ),
        ),
      ],
    );
  }
}
