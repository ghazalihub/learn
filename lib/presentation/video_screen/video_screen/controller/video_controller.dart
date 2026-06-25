

import 'package:get/get.dart';

import '../models/video_model.dart';

/// A controller class for the VideoScreen.
///
/// This class manages the state of the VideoScreen, including the
/// current videoModelObj
class VideoController extends GetxController {
  Rx<VideoModel> videoModelObj = VideoModel().obs;
  String youtubeUrl = "";

}
