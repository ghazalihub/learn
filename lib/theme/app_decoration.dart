import 'package:flutter/material.dart';
import 'package:flutter_elearning_app/core/app_export.dart';

class AppDecoration {
  // Fill decorations
  static BoxDecoration get fillBlack => BoxDecoration(
        color: appTheme.black900.withValues(alpha: 0.2),
      );
  static BoxDecoration get fillBlue => BoxDecoration(
        color: appTheme.blue5001,
      );
  static BoxDecoration get fillBlue50 => BoxDecoration(
        color: appTheme.blue50,
      );
  static BoxDecoration get fillDeepOrange => BoxDecoration(
        color: appTheme.deepOrange50,
      );
  static BoxDecoration get fillDeepPurple => BoxDecoration(
        color: appTheme.deepPurple50,
      );
  static BoxDecoration get fillGray => BoxDecoration(
        color: appTheme.containerbgColor,
      );
  static BoxDecoration get fillIndigo => BoxDecoration(
        color: appTheme.indigo50,
      );
  static BoxDecoration get fillIndigo5001 => BoxDecoration(
        color: appTheme.indigo5001,
      );
  static BoxDecoration get fillIndigo5002 => BoxDecoration(
        color: appTheme.indigo5002,
      );
  static BoxDecoration get fillLightBlue => BoxDecoration(
        color: appTheme.lightBlue50,
      );
  static BoxDecoration get fillOrange => BoxDecoration(
        color: appTheme.orange50,
      );
  static BoxDecoration get fillPurple => BoxDecoration(
        color: appTheme.purple50,
      );
  static BoxDecoration get fillRed => BoxDecoration(
        color: appTheme.red50,
      );
  static BoxDecoration get fillTeal => BoxDecoration(
        color: appTheme.teal50,
      );

  // Gradient decorations
  static BoxDecoration get gradientBlackToBlack => BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(0.54, -1.24),
          end: Alignment(0.5, 1),
          colors: [
            appTheme.black900.withValues(alpha: 0.4),
            appTheme.black900.withValues(alpha: 0),
          ],
        ),
      );
  static BoxDecoration get gradientBlackToBlack900 => BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(0.5, 0.81),
          end: Alignment(0.5, 1),
          colors: [
            appTheme.black900.withValues(alpha: 0),
            appTheme.black900.withValues(alpha: 0.63),
          ],
        ),
      );

  // Outline decorations
  static BoxDecoration get outlineBlack => BoxDecoration(
        color: appTheme.whiteA700,
        boxShadow: [
          BoxShadow(
            color: appTheme.black900.withValues(alpha: 0.03),
            spreadRadius: 2.h,
            blurRadius: 2.h,
            offset: Offset(
              0,
              -6,
            ),
          ),
        ],
      );
  static BoxDecoration get outlineGray => BoxDecoration(
        color: appTheme.whiteA700,
        border: Border(
          bottom: BorderSide(
            color: appTheme.gray100,
            width: 1.h,
          ),
        ),
      );
  static BoxDecoration get outlineGray300 => BoxDecoration(
        color: appTheme.whiteA700,
        border: Border(
          bottom: BorderSide(
            color: appTheme.gray300,
            width: 1.h,
          ),
        ),
      );

  // White decorations
  static BoxDecoration get white => BoxDecoration(
        color: appTheme.bgColor,
      );
}

class BorderRadiusStyle {
  // Circle borders
  static BorderRadius get circleBorder15 => BorderRadius.circular(
        15.h,
      );
  static BorderRadius get circleBorder24 => BorderRadius.circular(
        24.h,
      );
  static BorderRadius get circleBorder28 => BorderRadius.circular(
        28.h,
      );
  static BorderRadius get circleBorder50 => BorderRadius.circular(
        50.h,
      );
  static BorderRadius get circleBorder60 => BorderRadius.circular(
        60.h,
      );
  static BorderRadius get circleBorder82 => BorderRadius.circular(
        82.h,
      );

  // Custom borders
  static BorderRadius get customBorderTL12 => BorderRadius.only(
        topLeft: Radius.circular(12.h),
        topRight: Radius.circular(12.h),
        bottomLeft: Radius.circular(12.h),
      );

  // Rounded borders
  static BorderRadius get roundedBorder12 => BorderRadius.circular(
        12.h,
      );
  static BorderRadius get roundedBorder20 => BorderRadius.circular(
        20.h,
      );
  static BorderRadius get roundedBorder8 => BorderRadius.circular(
        8.h,
      );
}

// Comment/Uncomment the below code based on your Flutter SDK version.
    
// For Flutter SDK Version 3.7.2 or greater.
    
double get strokeAlignInside => BorderSide.strokeAlignInside;

double get strokeAlignCenter => BorderSide.strokeAlignCenter;

double get strokeAlignOutside => BorderSide.strokeAlignOutside;

// For Flutter SDK Version 3.7.1 or less.

// StrokeAlign get strokeAlignInside => StrokeAlign.inside;
//
// StrokeAlign get strokeAlignCenter => StrokeAlign.center;
//
// StrokeAlign get strokeAlignOutside => StrokeAlign.outside;
    