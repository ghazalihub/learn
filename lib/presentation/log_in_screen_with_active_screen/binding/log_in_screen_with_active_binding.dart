import '../controller/log_in_screen_with_active_controller.dart';
import 'package:get/get.dart';

/// A binding class for the LogInScreenWithActiveScreen.
///
/// This class ensures that the LogInScreenWithActiveController is created when the
/// LogInScreenWithActiveScreen is first loaded.
class LogInScreenWithActiveBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LogInScreenWithActiveController());
  }
}
