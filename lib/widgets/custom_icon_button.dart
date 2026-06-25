import 'package:flutter/material.dart';
import 'package:flutter_elearning_app/core/app_export.dart';

class CustomIconButton extends StatelessWidget {
  CustomIconButton({
    Key? key,
    this.alignment,
    this.height,
    this.width,
    this.padding,
    this.decoration,
    this.child,
    this.onTap,
  }) : super(
          key: key,
        );

  final Alignment? alignment;

  final double? height;

  final double? width;

  final EdgeInsetsGeometry? padding;

  final BoxDecoration? decoration;

  final Widget? child;

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: iconButtonWidget,
          )
        : iconButtonWidget;
  }

  Widget get iconButtonWidget => SizedBox(
        height: height ?? 0,
        width: width ?? 0,
        child: IconButton(
         splashRadius: 1.1,
          padding: EdgeInsets.zero,
          icon: Container(
            height: height ?? 0,
            width: width ?? 0,
            padding: padding ?? EdgeInsets.zero,
            decoration: decoration ??
                BoxDecoration(
                  color: appTheme.iconButtonbgColor.withOpacity(0.7),
                  // color: appTheme.whiteA700.withOpacity(0.7),
                  borderRadius: BorderRadius.circular(14.h),
                  boxShadow: [
                    BoxShadow(
                      color: appTheme.black900.withOpacity(0.1),
                      spreadRadius: 2.h,
                      blurRadius: 2.h,
                      offset: Offset(
                        0,
                        4,
                      ),
                    ),
                  ],
                ),
            child: child,
          ),
          onPressed: onTap,
        ),
      );
}

/// Extension on [CustomIconButton] to facilitate inclusion of all types of border style etc
extension IconButtonStyleHelper on CustomIconButton {
  static BoxDecoration get fillOnErrorContainer => BoxDecoration(
        color: appTheme.gray,
        borderRadius: BorderRadius.circular(8.h),
      );
  static BoxDecoration get fillWhiteA => BoxDecoration(
        color: appTheme.whiteA700,
        borderRadius: BorderRadius.circular(23.h),
      );
  static BoxDecoration get outlineBlackTL14 => BoxDecoration(
        color: PrefUtils().getThemeData() == "primary"?appTheme.whiteA700:Color(0XFF2B2B2B),
        borderRadius: BorderRadius.circular(14.h),

      );
  static BoxDecoration get fillWhiteATL27 => BoxDecoration(
        color: appTheme.whiteA700,
        borderRadius: BorderRadius.circular(27.h),
      );
  static BoxDecoration get fillWhiteATL8 => BoxDecoration(
        color: appTheme.whiteA700.withOpacity(0.7),
        borderRadius: BorderRadius.circular(8.h),
      );
  static BoxDecoration get fillWhiteATL14 => BoxDecoration(
        color: appTheme.whiteA700,
        borderRadius: BorderRadius.circular(14.h),
      );
  static BoxDecoration get outlineBlackTL20 => BoxDecoration(
        color: appTheme.greenA70001,
        borderRadius: BorderRadius.circular(20.h),
        boxShadow: [
          BoxShadow(
            color: appTheme.black900.withOpacity(0.06),
            spreadRadius: 2.h,
            blurRadius: 2.h,
            offset: Offset(
              0,
              4,
            ),
          ),
        ],
      );
  static BoxDecoration get fillGray => BoxDecoration(
        color: appTheme.gray100,
        borderRadius: BorderRadius.circular(29.h),
      );
  static BoxDecoration get fillRed => BoxDecoration(
        color: appTheme.red,
        borderRadius: BorderRadius.circular(29.h),
      );
  static BoxDecoration get outlineBlackTL141 => BoxDecoration(
        color: appTheme.whiteA700,
        borderRadius: BorderRadius.circular(14.h),
        boxShadow: [
          BoxShadow(
            color: appTheme.black900.withOpacity(0.05),

            blurRadius: 15.h,
            offset: Offset(
              0,
              4,
            ),
          ),
        ],
      );
  static BoxDecoration get fillWhiteATL20 => BoxDecoration(
        color: appTheme.iconButtonbgColor.withOpacity(0.7),
        borderRadius: BorderRadius.circular(20.h),
      );
}
