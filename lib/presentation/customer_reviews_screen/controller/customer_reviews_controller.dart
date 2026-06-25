import 'package:flutter_elearning_app/core/app_export.dart';
import 'package:flutter_elearning_app/presentation/customer_reviews_screen/models/customer_reviews_model.dart';

import '../models/userprofile_item_model.dart';

/// A controller class for the CustomerReviewsScreen.
///
/// This class manages the state of the CustomerReviewsScreen, including the
/// current customerReviewsModelObj
class CustomerReviewsController extends GetxController {
 List<UserprofileItemModel> customerReviewList = CustomerReviewsModel.getCustomerReviewList();
}
