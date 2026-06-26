import 'package:flutter_elearning_app/core/app_export.dart';
import 'package:flutter_elearning_app/data/models/course_model.dart';

class LessonsController extends GetxController {
  Rxn<CourseModel> courseModel = Rxn<CourseModel>();

  @override
  void onInit() {
    super.onInit();
    if (Get.arguments is CourseModel) {
      courseModel.value = Get.arguments;
    }
  }
}
