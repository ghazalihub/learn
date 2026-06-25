import '../../../core/app_export.dart';
import 'userprofile_item_model.dart';

/// This class defines the variables used in the [customer_reviews_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class CustomerReviewsModel {

 static List<UserprofileItemModel> getCustomerReviewList(){
  return [
   UserprofileItemModel(ImageConstant.imgEllipse30, "Ralph edwards", "I've been really impressed with the quality of the instruction and the convenience."),
    UserprofileItemModel(ImageConstant.imgEllipse301, "Guy hawkins", "I've been really impressed with the quality of the instruction and the convenience."),
    UserprofileItemModel(ImageConstant.imgEllipse302, "Robert fox", "I've been really impressed with the quality of the instruction and the convenience."),
    UserprofileItemModel(ImageConstant.imgEllipse303, "Darlene robertson", "I've been really impressed with the quality of the instruction and the convenience."),
    UserprofileItemModel(ImageConstant.imgEllipse304, "Albert flores", "I've been really impressed with the quality of the instruction and the convenience."),

  ];
 }
}
