import 'package:flutter/material.dart';

/// A controller class for the ResultFoundScreen.
import 'package:flutter_elearning_app/core/app_export.dart';

import '../models/favoritegrid1_item_model.dart';

///
/// This class manages the state of the ResultFoundScreen, including the
/// current resultFoundModelObj
class ResultFoundController extends GetxController {
  TextEditingController searchController = TextEditingController();

  List<Favoritegrid1ItemModel> getSearchData = [];

  @override
  void onClose() {
    super.onClose();
    searchController.dispose();
  }
}
