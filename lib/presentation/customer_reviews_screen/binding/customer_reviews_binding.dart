import '../controller/customer_reviews_controller.dart';
import 'package:get/get.dart';

/// A binding class for the CustomerReviewsScreen.
///
/// This class ensures that the CustomerReviewsController is created when the
/// CustomerReviewsScreen is first loaded.
class CustomerReviewsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CustomerReviewsController());
  }
}
