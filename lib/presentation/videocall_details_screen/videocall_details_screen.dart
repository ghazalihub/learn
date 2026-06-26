import 'controller/videocall_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_elearning_app/core/app_export.dart';
import 'package:flutter_elearning_app/widgets/custom_icon_button.dart';
import 'package:flutter_elearning_app/services/webrtc_service.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';



class VideocallDetailsScreen extends StatefulWidget {
  const VideocallDetailsScreen({super.key});

  @override
  State<VideocallDetailsScreen> createState() => _VideocallDetailsScreenState();
}

class _VideocallDetailsScreenState extends State<VideocallDetailsScreen> {
  VideocallDetailsController controller = Get.put(VideocallDetailsController());
  final WebRTCService _webrtc = Get.find<WebRTCService>();

  @override
  void initState() {
    super.initState();
    _webrtc.initRenderers().then((_) {
      _webrtc.makeCall();
      setState(() {});
    });
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
          child: Stack(
            children: [
              RTCVideoView(_webrtc.remoteRenderer),
              Padding(
                padding:  EdgeInsets.all(16.h),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    height: 169.v,
                    width: 140.h,
                    child: RTCVideoView(_webrtc.localRenderer),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: _buildActions(),
              ),
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






