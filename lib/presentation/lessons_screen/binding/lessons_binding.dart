import '../controller/lessons_controller.dart';
import 'package:get/get.dart';

/// A binding class for the LessonsScreen.
///
/// This class ensures that the LessonsController is created when the
/// LessonsScreen is first loaded.
class LessonsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LessonsController());
  }
}
