import 'package:flutter_elearning_app/core/app_export.dart';
import 'package:flutter_elearning_app/presentation/course_details_screen/models/course_details_model.dart';
import 'package:flutter_elearning_app/data/models/course_model.dart';

import '../models/widget_item_model.dart';

/// A controller class for the CourseDetailsScreen.
///
/// This class manages the state of the CourseDetailsScreen, including the
/// current courseDetailsModelObj
class CourseDetailsController extends GetxController {
 List<WidgetItemModel> lessonList =CourseDetailsModel.getLessonsList();
 late CourseModel course;

 @override
 void onInit() {
  super.onInit();
  course = Get.arguments ?? CourseModel(id: "course_001", title: "Default Course");
 }
}
