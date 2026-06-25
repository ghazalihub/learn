import '../controller/log_in_screen_wirh_error_controller.dart';
import 'package:get/get.dart';

/// A binding class for the LogInScreenWirhErrorScreen.
///
/// This class ensures that the LogInScreenWirhErrorController is created when the
/// LogInScreenWirhErrorScreen is first loaded.
class LogInScreenWirhErrorBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LogInScreenWirhErrorController());
  }
}
