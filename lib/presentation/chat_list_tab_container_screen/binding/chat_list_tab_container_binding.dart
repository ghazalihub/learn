import '../controller/chat_list_tab_container_controller.dart';
import 'package:get/get.dart';

/// A binding class for the ChatListTabContainerScreen.
///
/// This class ensures that the ChatListTabContainerController is created when the
/// ChatListTabContainerScreen is first loaded.
class ChatListTabContainerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ChatListTabContainerController());
  }
}
