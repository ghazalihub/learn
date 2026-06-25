import 'controller/videocall_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_elearning_app/core/app_export.dart';
import 'package:flutter_elearning_app/widgets/custom_icon_button.dart';



class VideocallDetailsScreen extends StatefulWidget {
  const VideocallDetailsScreen({super.key});

  @override
  State<VideocallDetailsScreen> createState() => _VideocallDetailsScreenState();
}

class _VideocallDetailsScreenState extends State<VideocallDetailsScreen> {
  VideocallDetailsController controller = Get.put(VideocallDetailsController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return Scaffold(

backgroundColor: appTheme.bgColor,
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(

            borderRadius: BorderRadius.circular(
              12.h,
            ),
            image: DecorationImage(
              image: AssetImage(
                ImageConstant.img06VideocallDetails,
              ),
              fit: BoxFit.fill,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 19.h),
                child: CustomImageView(
                  imagePath: ImageConstant.imgSmallImage,
                  height: 169.v,
                  width: 140.h,
                  radius: BorderRadius.circular(
                    12.h,
                  ),
                  alignment: Alignment.bottomRight,

                ),
              ),
              SizedBox(height: 43.v),
              _buildActions(),
            ],
          ),
        ),
      ),


    );
  }

  Widget _buildActions() {
    return Padding(
      padding: EdgeInsets.only(
        left: 82.h,
        right: 82.h,
        bottom: 40.v,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomIconButton(
            height: 58.adaptSize,
            width: 58.adaptSize,
            padding: EdgeInsets.all(16.h),
            decoration: IconButtonStyleHelper.fillGray.copyWith(
                color: PrefUtils().getThemeData() == "primary"?Color(0XFFFFFFFF):appTheme.darkInput
            ),
            child: CustomImageView(
              color: appTheme.black900,
              imagePath: ImageConstant.imgMicrophone,
            ),
          ),
          CustomIconButton(
            onTap: () {
              Get.back();
            },
            height: 58.adaptSize,
            width: 58.adaptSize,
            padding: EdgeInsets.all(6.h),
            decoration: IconButtonStyleHelper.fillRed,
            child: CustomImageView(
              imagePath: ImageConstant.imgCallWhiteA700,
            ),
          ),
          CustomIconButton(
            height: 58.adaptSize,
            width: 58.adaptSize,
            padding: EdgeInsets.all(16.h),
            decoration: IconButtonStyleHelper.fillGray.copyWith(
    color: PrefUtils().getThemeData() == "primary"?Color(0XFFFFFFFF):appTheme.darkInput
    ),
            child: CustomImageView(
              color: appTheme.black900,
              imagePath: ImageConstant.imgMail,
            ),
          ),
        ],
      ),
    );
  }
}






