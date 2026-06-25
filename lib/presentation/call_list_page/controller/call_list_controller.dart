import 'package:flutter_elearning_app/core/app_export.dart';
import 'package:flutter_elearning_app/presentation/call_list_page/models/call_list_model.dart';

import '../models/chatlist_item_model.dart';

/// A controller class for the CallListPage.
///
/// This class manages the state of the CallListPage, including the
/// current callListModelObj
class CallListController extends GetxController {
 List<ChatlistItemModel> callData = CallListModel.getCallData();
}
