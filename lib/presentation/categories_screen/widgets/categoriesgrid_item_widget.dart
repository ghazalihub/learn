import '../controller/categories_controller.dart';
import '../../../data/models/course_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_elearning_app/core/app_export.dart';
import 'package:flutter_elearning_app/widgets/custom_icon_button.dart';

// ignore: must_be_immutable
class CategoriesgridItemWidget extends StatelessWidget {
  CategoriesgridItemWidget(
    this.categoriesgridItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  CategoryModel categoriesgridItemModelObj;

  var controller = Get.find<CategoriesController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 8.h,
        vertical: 8.v,
      ),
      decoration: AppDecoration.fillIndigo.copyWith(
        color: categoriesgridItemModelObj.colorHex != null ? Color(int.parse(categoriesgridItemModelObj.colorHex!.replaceFirst('#', '0xFF'))) : Colors.indigo.shade50,
        borderRadius: BorderRadiusStyle.roundedBorder12,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomIconButton(
            height: 54.adaptSize,
            width: 54.adaptSize,
            padding: EdgeInsets.all(11.h),
            decoration: IconButtonStyleHelper.fillWhiteATL27,
            child: CustomImageView(
              imagePath: categoriesgridItemModelObj.icon!,
            ),
          ),
SizedBox(height:16.v),
          Text(
            categoriesgridItemModelObj.title!,
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.fSize,
              fontFamily: 'SF Pro Display',
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 2.v),
        ],
      ),
    );
  }
}
