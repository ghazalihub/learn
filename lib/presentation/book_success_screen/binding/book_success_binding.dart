import '../controller/book_success_controller.dart';
import 'package:get/get.dart';

/// A binding class for the BookSuccessScreen.
///
/// This class ensures that the BookSuccessController is created when the
/// BookSuccessScreen is first loaded.
class BookSuccessBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BookSuccessController());
  }
}
