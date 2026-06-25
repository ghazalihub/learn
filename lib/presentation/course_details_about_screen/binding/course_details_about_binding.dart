import '../controller/course_details_about_controller.dart';
import 'package:get/get.dart';

/// A binding class for the CourseDetailsAboutScreen.
///
/// This class ensures that the CourseDetailsAboutController is created when the
/// CourseDetailsAboutScreen is first loaded.
class CourseDetailsAboutBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CourseDetailsAboutController());
  }
}
