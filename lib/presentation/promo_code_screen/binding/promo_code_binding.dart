import '../controller/promo_code_controller.dart';
import 'package:get/get.dart';

/// A binding class for the PromoCodeScreen.
///
/// This class ensures that the PromoCodeController is created when the
/// PromoCodeScreen is first loaded.
class PromoCodeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PromoCodeController());
  }
}
