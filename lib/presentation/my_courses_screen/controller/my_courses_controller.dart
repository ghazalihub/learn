import 'package:flutter_elearning_app/core/app_export.dart';
import 'package:flutter_elearning_app/presentation/my_courses_screen/models/my_courses_model.dart';

/// A controller class for the MyCoursesScreen.
///
/// This class manages the state of the MyCoursesScreen, including the
/// current myCoursesModelObj
class MyCoursesController extends GetxController {
  Rx<MyCoursesModel> myCoursesModelObj = MyCoursesModel().obs;
}
