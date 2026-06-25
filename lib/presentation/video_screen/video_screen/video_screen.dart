import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_elearning_app/core/app_export.dart';
import 'package:flutter_elearning_app/presentation/video_screen/video_screen/controller/video_controller.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../widgets/app_bar/appbar_leading_image.dart';


class VideoScreen extends StatefulWidget {

  const VideoScreen({super.key});

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  VideoController videoController = Get.put(VideoController());

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  late YoutubePlayerController controller;
  late TextEditingController idController;
  late TextEditingController seekToController;
  bool isPlayerReady = false;
  late String videoId;
  bool fullScreen = false;

  @override
  void initState() {
    super.initState();
    videoId = YoutubePlayer.convertUrlToId(videoController.youtubeUrl)!;
    controller = YoutubePlayerController(
      initialVideoId: videoId,
      flags: const YoutubePlayerFlags(
        mute: false,
        autoPlay: true,
        disableDragSeek: false,
        loop: false,
        isLive: false,
        forceHD: false,
        enableCaption: true,
      ),
    )..addListener(listener);
    idController = TextEditingController();
    seekToController = TextEditingController();
  }

  void listener() {
    if (isPlayerReady && mounted && !controller.value.isFullScreen) {
      setState(() {});
    }
  }

  @override
  void deactivate() {
    controller.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    controller.dispose();
    idController.dispose();
    seekToController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 230,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.h),
      ),
      child: VisibilityDetector(
        key: const Key("unique key"),
        onVisibilityChanged: (info) {
          if (info.visibleFraction == 0) {
            controller.pause();
          } else {
            controller.value.isPlaying ? controller.play() : controller.pause();
          }
        },
        child: YoutubePlayerBuilder(
          onEnterFullScreen: () {
            this.fullScreen = true;
            Future.delayed(
              Duration(seconds: 1),
              () {
                SystemChrome.setSystemUIOverlayStyle(
                  SystemUiOverlayStyle.light.copyWith(
                    statusBarColor: Colors.transparent,
                    statusBarBrightness: Brightness.dark,
                    statusBarIconBrightness: Brightness
                        .dark, // Set your desired status bar color here
                  ),
                );
              },
            );
          },
          onExitFullScreen: () {
            this.fullScreen = false;
            Future.delayed(
              Duration(seconds: 1),
              () {
                SystemChrome.setSystemUIOverlayStyle(
                  SystemUiOverlayStyle.light.copyWith(
                    statusBarColor: Colors.transparent,
                    statusBarBrightness: Brightness.light,
                    statusBarIconBrightness: Brightness
                        .dark, // Set your desired status bar color here
                  ),
                );
              },
            );
            // SystemChrome.setPreferredOrientations(DeviceOrientation.values);
          },
          player: YoutubePlayer(
            controller: controller,
            showVideoProgressIndicator: true,
            aspectRatio: 16 / 9,
            progressIndicatorColor: theme.colorScheme.primary,
            topActions: <Widget>[
              const SizedBox(width: 8.0),
              Expanded(
                child: Text(
                  controller.metadata.title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
            ],
            onReady: () {
              controller.addListener(listener);
            },
            onEnded: (data) {},
          ),
          builder: (context, player) =>

              //     Scaffold(
              //   key: scaffoldKey,
              //   body: Column(
              //     children: [
              //       player,
              //     ],
              //   ),
              // ),

              OrientationBuilder(
                  builder: (BuildContext context, Orientation orientation) {
            if (orientation == Orientation.landscape ||
                fullScreen ||
                Get.context!.isLandscape) {
              return Scaffold(
                backgroundColor: appTheme.bgColor,
                body: player,
                // appBar: getInVisibleAppBar(
                //   color: Colors.transparent,
                //   statusBarBrightness: Brightness.dark,
                //   statusBarIconBrightness: Brightness.dark,
                // ),
                // body: Center(child: player),
                // // body: youtubeHierarchy(),
              );
            } else {
              return Scaffold(
                backgroundColor: appTheme.bgColor,
                appBar: AppBar(
                  toolbarHeight: 60.v,
                  elevation: 0,
                  leadingWidth: 44.h,
                  leading: AppbarLeadingImage(
                      imagePath: ImageConstant.imgArrowLeft,
                      margin:
                          EdgeInsets.only(left: 20.h, top: 13.v, bottom: 16.v),
                      onTap: () {
                        setSafeAreaColor();
                        Get.back();
                      }),
                  backgroundColor: Colors.transparent,
                  systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarIconBrightness: Brightness.dark,
                    statusBarBrightness: Brightness.dark,
                  ),
                ),
                // body: youtubeHierarchy(),
                body: Center(child: player),
              );
            }
          }),
        ),
      ),
    );
  }

  youtubeHierarchy() {
    return Container(
      child: Align(
        alignment: Alignment.center,
        child: FittedBox(
          fit: BoxFit.cover,
          child: YoutubePlayer(
            controller: controller,
            showVideoProgressIndicator: true,
            progressIndicatorColor: theme.colorScheme.primary,
            topActions: <Widget>[
              const SizedBox(width: 8.0),
              Expanded(
                child: Text(
                  controller.metadata.title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
            ],
            onReady: () {
              controller.addListener(listener);
            },
            onEnded: (data) {},
          ),
        ),
      ),
    );
  }
}
