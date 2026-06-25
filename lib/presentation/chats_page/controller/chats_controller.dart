import 'package:flutter_elearning_app/core/app_export.dart';
import 'package:flutter_elearning_app/presentation/chats_page/models/chats_model.dart';

/// A controller class for the ChatsPage.
///
/// This class manages the state of the ChatsPage, including the
/// current chatsModelObj
class ChatsController extends GetxController {
  ChatsController(this.chatsModelObj);

  Rx<ChatsModel> chatsModelObj;
}
