import '../../../core/app_export.dart';
import 'fundlist_item_model.dart';

/// This class defines the variables used in the [my_courses1_page],
/// and is typically used to hold data that is passed between different parts of the application.
class MyCourses1Model {

  static List<FundlistItemModel> getMyCourcesList(){
    return [
      FundlistItemModel(ImageConstant.imgGroupIndianCh2, "How to become an UI/UX designer", ImageConstant.imgEllipse2049, "Mentor", "Category", 0.7),
      FundlistItemModel(ImageConstant.imgGroupIndianCh1, "Learn the skills you need", ImageConstant.imgEllipse2049, "Mentor", "Category", 0.5),
      FundlistItemModel(ImageConstant.imgGroupIndianCh4, "Learn at your own pace", ImageConstant.imgEllipse2049, "Mentor", "Category", 0.9),
      FundlistItemModel(ImageConstant.imgGroupIndianCh5, "In your own time", ImageConstant.imgEllipse2049, "Mentor", "Category", 0.98),
      FundlistItemModel(ImageConstant.imgGroupIndianCh115x174, "How e-learning can help", ImageConstant.imgEllipse2049, "Mentor", "Category", 0.4),
    ];
  }
}
