import 'package:flutter_elearning_app/presentation/home_screen_page/models/slidre_model.dart';

import '../../../core/app_export.dart';
import 'categoriescolumn_item_model.dart';
import 'userprofilelist1_item_model.dart';
import 'userprofilelist2_item_model.dart';

/// This class defines the variables used in the [home_screen_page],
import 'userprofilelist_item_model.dart';

/// and is typically used to hold data that is passed between different parts of the application.
class HomeScreenModel {


 static List<SliderData> getSliderData(){
  return [
   SliderData(ImageConstant.imgSliderBanner1,"Learn New Skills, advance Your Career"),
   SliderData(ImageConstant.imgSliderBanner2,"Learn New Skills, advance Your Career"),
   SliderData(ImageConstant.imgSliderBanner3,"Learn New Skills, advance Your Career"),
  ];
 }
  Rx<List<CategoriescolumnItemModel>> categoriescolumnItemList = Rx([
    CategoriescolumnItemModel(
        catDesigning: ImageConstant.imgCatDesigining.obs,
        designingText: "Designing".obs),
    CategoriescolumnItemModel(
        catDesigning: ImageConstant.imgCatMoney.obs,
        designingText: "Finance".obs),
    CategoriescolumnItemModel(
        catDesigning: ImageConstant.imgCatCode.obs,
        designingText: "Coding".obs),
    CategoriescolumnItemModel(
        catDesigning: ImageConstant.imgCatScience.obs,
        designingText: "Science".obs)
  ]);

  Rx<List<UserprofilelistItemModel>> userprofilelistItemList = Rx([
    UserprofilelistItemModel(
        userImage: ImageConstant.imgGroupIndianCh.obs,
        learnNewSkills: "How to become an UI/UX designer".obs,
        userCircleImage: ImageConstant.imgEllipse2049.obs,
        userName: "Esther howards".obs,
        userInstructor: "Instructor".obs,
        userPrice: "50.00".obs),
    UserprofilelistItemModel(
        userImage: ImageConstant.imgGroupIndianCh115x174.obs,
        learnNewSkills: "Online courses that fit your busy schedule".obs,
        userCircleImage: ImageConstant.imgEllipse204930x30.obs,
        userName: "Ronald richards".obs,
        userInstructor: "Cordinator".obs,
        userPrice: "30.00".obs)
  ]);

  Rx<List<Userprofilelist1ItemModel>> userprofilelist1ItemList = Rx([
    Userprofilelist1ItemModel(
        userName: "Ronald richards".obs, userRole: "Instructor".obs),
    Userprofilelist1ItemModel(
        userName: "Leslie alexander".obs, userRole: "Senior ui designer ".obs),
    Userprofilelist1ItemModel(
        userName: "Ronald richards".obs, userRole: "Instructor".obs)
  ]);

  Rx<List<Userprofilelist2ItemModel>> userprofilelist2ItemList = Rx([
    Userprofilelist2ItemModel(
        userImage: ImageConstant.imgGroupIndianCh114x114.obs,
        learnNewSkillsText: "Learn new skills, advance your career".obs,
        priceCircleImage: ImageConstant.imgEllipse20491.obs,
        instructorNameText: "Esther howards".obs,
        instructorTitleText: "Instructor".obs,
        priceText: "80.00".obs),
    Userprofilelist2ItemModel(
        userImage: ImageConstant.imgGroupIndianCh1.obs,
        learnNewSkillsText:
            "Master the art of coding with our online courses".obs,
        priceCircleImage: ImageConstant.imgEllipse20492.obs,
        instructorNameText: "Jenny wilson".obs,
        instructorTitleText: "Cordinator".obs,
        priceText: "90.00".obs)
  ]);
}
