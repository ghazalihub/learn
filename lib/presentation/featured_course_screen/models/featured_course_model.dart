import '../../../core/app_export.dart';
import 'favoritegrid_item_model.dart';

/// This class defines the variables used in the [featured_course_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class FeaturedCourseModel {


  static List<FavoritegridItemModel> getFeaturedCource(){
    return [
      FavoritegridItemModel(ImageConstant.imgGroupIndianCh2,"How to become an UI/UX designer",ImageConstant.imgUser1,"Esther howards", "Instructor", "\$65.00",false),
      FavoritegridItemModel(ImageConstant.imgGroupIndianCh3,"Learn at your own pace,  anywhere in the world", ImageConstant.imgUser2, "Ralph edwards", "Cordinator", "\$70.00",false),
      FavoritegridItemModel(ImageConstant.imgGroupIndianCh1,"Learn the skills you need to get ahead in your career",ImageConstant.imgUser3,  "Courtney henry", "Instructor", "\$95.00",false),
      FavoritegridItemModel(ImageConstant.imgGroupIndianCh4,"Learn faster and more effectively with elearning",ImageConstant.imgUser4,  "Ralph edwards", "Cordinator", "\$75.00",false),
      FavoritegridItemModel(ImageConstant.imgGroupIndianCh5,"Learn at your own pace, in your own time",ImageConstant.imgUser5,  "Cody fisher", "Instructor", "\$85.00",false),
      FavoritegridItemModel(ImageConstant.imgGroupIndianCh115x174,"How elearning can help you achieve your goals", ImageConstant.imgUser6, "Guy hawkins", "Cordinator", "\$42.00",false),
      FavoritegridItemModel(ImageConstant.imgGroupIndianCh6,"Learn new skills, advance your career",ImageConstant.imgUser1,  "Esther howards", "Instructor", "\$65.00",false),
      FavoritegridItemModel(ImageConstant.imgGroupIndianCh7,"Learn new skills, advance your career",ImageConstant.imgUser2,  "Ralph Edwards", "Cordinator", "\$70.00",false),
    ];
  }
}
