import '../controller/instructor_details_controller.dart';
import 'package:get/get.dart';

/// A binding class for the InstructorDetailsScreen.
///
/// This class ensures that the InstructorDetailsController is created when the
/// InstructorDetailsScreen is first loaded.
class InstructorDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => InstructorDetailsController());
  }
}
