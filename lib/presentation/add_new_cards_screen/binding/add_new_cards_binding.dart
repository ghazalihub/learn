import '../controller/add_new_cards_controller.dart';
import 'package:get/get.dart';

/// A binding class for the AddNewCardsScreen.
///
/// This class ensures that the AddNewCardsController is created when the
/// AddNewCardsScreen is first loaded.
class AddNewCardsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddNewCardsController());
  }
}
