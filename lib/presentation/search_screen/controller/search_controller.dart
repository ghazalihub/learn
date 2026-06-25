import 'package:flutter/cupertino.dart';
import 'package:flutter_elearning_app/core/app_export.dart';

import '../models/recentclearallrow_item_model.dart';
import '../models/search_model.dart';

/// A controller class for the SearchScreen.
///
/// This class manages the state of the SearchScreen, including the
/// current searchModelObj
class SearchController extends GetxController {
  TextEditingController searchController = TextEditingController();
  List<RecentclearallrowItemModel> searchList = SearchModel.getSearchData();
}
