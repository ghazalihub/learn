import '../controller/result_found_controller.dart';
import 'package:get/get.dart';

/// A binding class for the ResultFoundScreen.
///
/// This class ensures that the ResultFoundController is created when the
/// ResultFoundScreen is first loaded.
class ResultFoundBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ResultFoundController());
  }
}
