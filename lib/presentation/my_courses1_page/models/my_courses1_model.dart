import '../../../core/app_export.dart';
import 'fundlist_item_model.dart';

/// This class defines the variables used in the [my_courses1_page],
/// and is typically used to hold data that is passed between different parts of the application.
class MyCourses1Model {

  static List<FundlistItemModel> getMyCourcesList(){
    return [
      FundlistItemModel(ImageConstant.imgGroupIndianCh2, "How to become an UI/UX designer", "2 hrs 30 min", "70",false),
      FundlistItemModel(ImageConstant.imgGroupIndianCh1, "Learn the skills you need to get ahead in your career", "2 hrs 30 min", "50",false),
      FundlistItemModel(ImageConstant.imgGroupIndianCh4, "Learn at your own pace, anywhere in the world", "2 hrs 30 min", "90",false),
      FundlistItemModel(ImageConstant.imgGroupIndianCh5, "Learn at your own pace, in your own time", "2 hrs 30 min", "98",false),
      FundlistItemModel(ImageConstant.imgGroupIndianCh115x174, "How e-learning can help you achieve your goals", "2 hrs 30 min", "40",false),
    ];
  }
}
