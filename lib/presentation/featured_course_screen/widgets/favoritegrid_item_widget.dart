import '../../favorite1_page/controller/favorite1_controller.dart';
import '../controller/featured_course_controller.dart';
import '../models/favoritegrid_item_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_elearning_app/core/app_export.dart';
import 'package:flutter_elearning_app/widgets/custom_icon_button.dart';

// ignore: must_be_immutable
class FavoritegridItemWidget extends StatefulWidget {
  FavoritegridItemWidget(
    this.favoritegridItemModelObj, {
    Key? key,
    this.onTapFund,
  }) : super(
          key: key,
        );

  FavoritegridItemModel favoritegridItemModelObj;

  VoidCallback? onTapFund;

  @override
  State<FavoritegridItemWidget> createState() => _FavoritegridItemWidgetState();
}

class _FavoritegridItemWidgetState extends State<FavoritegridItemWidget> {
  Favorite1Controller favorite1Controller = Get.put(Favorite1Controller());
  var controller = Get.find<FeaturedCourseController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FeaturedCourseController>(
      init: FeaturedCourseController(),
      builder:(controller) =>  GestureDetector(
        onTap: () {
          widget.onTapFund!.call();
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
                child: Stack(
                  alignment: Alignment.topRight,
                  children: [
                    CustomImageView(
                      imagePath: widget.favoritegridItemModelObj.image!,
                      height: 115.v,
                      width: 174.h,
                      radius: BorderRadius.circular(
                        12.h,
                      ),
                      alignment: Alignment.center,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: 8.v,
                        right: 8.h,
                      ),
                      child: CustomIconButton(
                        onTap: () {
                          widget.favoritegridItemModelObj.isLike =
                              !widget.favoritegridItemModelObj.isLike!;
                          if(widget.favoritegridItemModelObj.isLike!){
                            favorite1Controller.favouriteList.add(widget.favoritegridItemModelObj);
                            favorite1Controller.update();
                          }
                          else{
                            favorite1Controller.favouriteList.remove(widget.favoritegridItemModelObj);
                            favorite1Controller.update();
                          }
                          controller.update();
                        },
                        height: 28.adaptSize,
                        width: 28.adaptSize,
                        padding: EdgeInsets.all(6.h),
                        alignment: Alignment.topRight,
                        child: CustomImageView(
                          color: appTheme.black900,
                          imagePath:  widget.favoritegridItemModelObj.isLike!?ImageConstant.imgFavouriteIcon:ImageConstant.imgUnFavouriteIcon,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 9.v),
              Align(
                alignment: Alignment.centerLeft,
                child: SizedBox(
                  width: 155.h,
                  child: Text(
                    widget.favoritegridItemModelObj.title!,
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
                        imagePath: widget.favoritegridItemModelObj.userImage!,
                        height: 30.adaptSize,
                        width: 30.adaptSize,
                        radius: BorderRadius.circular(
                          15.h,
                        ),
                        margin: EdgeInsets.only(bottom: 2.v),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 8.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.favoritegridItemModelObj.userName!,
                              style: theme.textTheme.labelLarge!.copyWith(
                                color: appTheme.black900,
                              ),
                            ),
                            SizedBox(height: 2.v),
                            Text(
                              widget.favoritegridItemModelObj.userType!,
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
                    padding: EdgeInsets.only(
                      left: 0.h,
                      top: 7.v,
                      bottom: 10.v,
                    ),
                    child: Text(
                      widget.favoritegridItemModelObj.price!,
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
