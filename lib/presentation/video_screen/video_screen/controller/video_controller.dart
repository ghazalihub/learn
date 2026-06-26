import 'package:get/get.dart';
import 'package:flutter_elearning_app/data/models/course_model.dart';

class VideoController extends GetxController {
  String youtubeUrl = "";
  String? lessonTitle;

  @override
  void onInit() {
    super.onInit();
    if (Get.arguments is LessonModel) {
      LessonModel lesson = Get.arguments;
      youtubeUrl = lesson.youtubeUrl ?? "";
      lessonTitle = lesson.title;
    }
  }
}
