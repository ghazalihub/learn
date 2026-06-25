import '../controller/result_not_found_controller.dart';
import 'package:get/get.dart';

/// A binding class for the ResultNotFoundScreen.
///
/// This class ensures that the ResultNotFoundController is created when the
/// ResultNotFoundScreen is first loaded.
class ResultNotFoundBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ResultNotFoundController());
  }
}
