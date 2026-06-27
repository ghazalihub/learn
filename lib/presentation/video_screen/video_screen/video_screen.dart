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
  late YoutubePlayerController controller;
  bool fullScreen = false;

  @override
  void initState() {
    super.initState();
    final url = (Get.arguments is Map ? Get.arguments['url'] : null) ?? videoController.youtubeUrl;
    final videoId = YoutubePlayer.convertUrlToId(url) ?? "0Sg6QHmlFJE";
    controller = YoutubePlayerController(
      initialVideoId: videoId,
      flags: const YoutubePlayerFlags(autoPlay: true, mute: false),
    );
  }

  @override
  void deactivate() { controller.pause(); super.deactivate(); }
  @override
  void dispose() { controller.dispose(); super.dispose(); }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return YoutubePlayerBuilder(
      player: YoutubePlayer(controller: controller),
      builder: (context, player) => Scaffold(
        backgroundColor: appTheme.bgColor,
        appBar: AppBar(
          toolbarHeight: 60.v, elevation: 0, leadingWidth: 44.h,
          leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgArrowLeft,
            margin: EdgeInsets.only(left: 20.h, top: 13.v, bottom: 16.v),
            onTap: () { setSafeAreaColor(); Get.back(); }
          ),
          backgroundColor: Colors.transparent,
        ),
        body: Center(child: player),
      ),
    );
  }
}
