import '../controller/video_controller.dart';
import 'package:get/get.dart';

/// A binding class for the VideoScreen.
///
/// This class ensures that the VideoController is created when the
/// VideoScreen is first loaded.
class VideoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => VideoController());
  }
}
