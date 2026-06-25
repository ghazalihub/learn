import '../controller/my_courses_controller.dart';
import 'package:get/get.dart';

/// A binding class for the MyCoursesScreen.
///
/// This class ensures that the MyCoursesController is created when the
/// MyCoursesScreen is first loaded.
class MyCoursesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MyCoursesController());
  }
}
