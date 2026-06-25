import '../controller/featured_course_controller.dart';
import 'package:get/get.dart';

/// A binding class for the FeaturedCourseScreen.
///
/// This class ensures that the FeaturedCourseController is created when the
/// FeaturedCourseScreen is first loaded.
class FeaturedCourseBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FeaturedCourseController());
  }
}
