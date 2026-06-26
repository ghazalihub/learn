import 'package:flutter/material.dart';
import 'package:flutter_elearning_app/core/app_export.dart';
import 'package:flutter_elearning_app/data/models/course_model.dart';
import '../controller/featured_course_controller.dart';

class FavoritegridItemWidget extends StatefulWidget {
  FavoritegridItemWidget(
    this.favoritegridItemModelObj, {
    Key? key,
    this.onTapFund,
  }) : super(
          key: key,
        );

  final CourseModel favoritegridItemModelObj;
  final VoidCallback? onTapFund;

  @override
  State<FavoritegridItemWidget> createState() => _FavoritegridItemWidgetState();
}

class _FavoritegridItemWidgetState extends State<FavoritegridItemWidget> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<FeaturedCourseController>(
      init: FeaturedCourseController(),
      builder:(controller) => GestureDetector(
        onTap: () {
          widget.onTapFund?.call();
        },
        child: Container(
          padding: EdgeInsets.all(8.h),
          decoration: AppDecoration.fillGray.copyWith(
            borderRadius: BorderRadiusStyle.roundedBorder12,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 115.v,
                width: 174.h,
                child: CustomImageView(
                  imagePath: widget.favoritegridItemModelObj.thumbnailUrl,
                  height: 115.v,
                  width: 174.h,
                  radius: BorderRadius.circular(12.h),
                  alignment: Alignment.center,
                ),
              ),
              SizedBox(height: 9.v),
              Align(
                alignment: Alignment.centerLeft,
                child: SizedBox(
                  width: 155.h,
                  child: Text(
                    widget.favoritegridItemModelObj.title ?? "",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.titleSmall!.copyWith(
                      color: appTheme.black900,
                      height: 1.50,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 17.v),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CustomImageView(
                        imagePath: widget.favoritegridItemModelObj.instructorImage,
                        height: 30.adaptSize,
                        width: 30.adaptSize,
                        radius: BorderRadius.circular(15.h),
                        margin: EdgeInsets.only(bottom: 2.v),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 8.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.favoritegridItemModelObj.instructorName ?? "",
                              style: theme.textTheme.labelLarge!.copyWith(
                                color: appTheme.black900,
                              ),
                            ),
                            SizedBox(height: 2.v),
                            Text(
                              "Instructor",
                              style: theme.textTheme.bodySmall!.copyWith(
                                color: appTheme.black900,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 0.h, top: 7.v, bottom: 10.v),
                    child: Text(
                      "${widget.favoritegridItemModelObj.currency ?? ""}${widget.favoritegridItemModelObj.price ?? ""}",
                      style: theme.textTheme.labelLarge!.copyWith(
                        color: appTheme.black900,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
