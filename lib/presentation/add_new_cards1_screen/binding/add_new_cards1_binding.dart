import '../controller/add_new_cards1_controller.dart';
import 'package:get/get.dart';

/// A binding class for the AddNewCards1Screen.
///
/// This class ensures that the AddNewCards1Controller is created when the
/// AddNewCards1Screen is first loaded.
class AddNewCards1Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddNewCards1Controller());
  }
}
