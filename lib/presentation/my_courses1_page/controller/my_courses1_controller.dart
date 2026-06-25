import 'package:flutter_elearning_app/core/app_export.dart';
import 'package:flutter_elearning_app/presentation/my_courses1_page/models/my_courses1_model.dart';

import '../models/fundlist_item_model.dart';

/// A controller class for the MyCourses1Page.
///
/// This class manages the state of the MyCourses1Page, including the
/// current myCourses1ModelObj
class MyCourses1Controller extends GetxController {
 List<FundlistItemModel> myCourcesList = MyCourses1Model.getMyCourcesList();
}
