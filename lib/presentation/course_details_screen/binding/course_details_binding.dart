import '../controller/course_details_controller.dart';
import 'package:get/get.dart';

/// A binding class for the CourseDetailsScreen.
///
/// This class ensures that the CourseDetailsController is created when the
/// CourseDetailsScreen is first loaded.
class CourseDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CourseDetailsController());
  }
}
