import 'package:flutter_elearning_app/core/app_export.dart';
import '../models/course_details_model.dart';
import '../models/widget_item_model.dart';

class CourseDetailsController extends GetxController {
  List<WidgetItemModel> lessonList = CourseDetailsModel.getLessonList();
}
