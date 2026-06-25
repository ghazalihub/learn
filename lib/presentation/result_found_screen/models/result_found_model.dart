import '../../../core/app_export.dart';
import 'favoritegrid1_item_model.dart';

/// This class defines the variables used in the [result_found_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class ResultFoundModel {
  Rx<List<Favoritegrid1ItemModel>> favoritegrid1ItemList = Rx([
    Favoritegrid1ItemModel(
        image: ImageConstant.imgGroupIndianCh2.obs,
        favorite: ImageConstant.imgFavorite.obs,
        learnNewSkills: "How to become an UI/UX designer".obs,
        circleImage: ImageConstant.imgEllipse2049.obs,
        alreadyHaveAn: "Esther howards".obs,
        alreadyHaveAn1: "Instructor".obs,
        price: "65.00".obs),
    Favoritegrid1ItemModel(
        image: ImageConstant.imgGroupIndianCh3.obs,
        favorite: ImageConstant.imgFavoriteOnprimary.obs,
        learnNewSkills: "Learn at your own pace,  anywhere in the world".obs,
        circleImage: ImageConstant.imgEllipse20493.obs,
        alreadyHaveAn: "Ralph edwards".obs,
        alreadyHaveAn1: "Cordinator".obs,
        price: "70.00".obs),
    Favoritegrid1ItemModel(
        image: ImageConstant.imgGroupIndianCh1.obs,
        favorite: ImageConstant.imgFavoriteOnprimary.obs,
        learnNewSkills:
            "Learn the skills you need to get ahead in your career".obs,
        circleImage: ImageConstant.imgEllipse20494.obs,
        alreadyHaveAn: "Courtney henry".obs,
        alreadyHaveAn1: "Instructor".obs,
        price: "95.00".obs),
    Favoritegrid1ItemModel(
        image: ImageConstant.imgGroupIndianCh4.obs,
        favorite: ImageConstant.imgFavorite.obs,
        learnNewSkills: "Learn faster and more effectively with elearning".obs,
        circleImage: ImageConstant.imgEllipse20495.obs,
        alreadyHaveAn: "Ralph edwards".obs,
        alreadyHaveAn1: "Cordinator".obs,
        price: "75.00".obs),
    Favoritegrid1ItemModel(
        image: ImageConstant.imgGroupIndianCh5.obs,
        favorite: ImageConstant.imgFavorite.obs,
        learnNewSkills: "Learn at your own pace, in your own time".obs,
        circleImage: ImageConstant.imgEllipse20496.obs,
        alreadyHaveAn: "Cody fisher".obs,
        alreadyHaveAn1: "Instructor".obs,
        price: "85.00".obs),
    Favoritegrid1ItemModel(
        image: ImageConstant.imgGroupIndianCh115x174.obs,
        favorite: ImageConstant.imgFavoriteOnprimary.obs,
        learnNewSkills: "How elearning can help you achieve your goals".obs,
        circleImage: ImageConstant.imgEllipse20497.obs,
        alreadyHaveAn: "Guy hawkins".obs,
        alreadyHaveAn1: "Cordinator".obs,
        price: "42.00".obs),
    Favoritegrid1ItemModel(
        image: ImageConstant.imgGroupIndianCh6.obs,
        favorite: ImageConstant.imgFavoriteOnprimary.obs,
        learnNewSkills: "Learn new skills, advance your career".obs,
        circleImage: ImageConstant.imgEllipse2049.obs,
        alreadyHaveAn: "Esther howards".obs,
        alreadyHaveAn1: "Instructor".obs,
        price: "65.00".obs),
    Favoritegrid1ItemModel(
        image: ImageConstant.imgGroupIndianCh7.obs,
        favorite: ImageConstant.imgFavorite.obs,
        learnNewSkills: "Learn new skills, advance your career".obs,
        circleImage: ImageConstant.imgEllipse20493.obs,
        alreadyHaveAn: "Ralph Edwards".obs,
        alreadyHaveAn1: "Cordinator".obs,
        price: "70".obs)
  ]);
}
