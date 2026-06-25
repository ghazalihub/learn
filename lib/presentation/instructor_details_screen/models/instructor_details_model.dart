import '../../../core/app_export.dart';import 'userprofile1_item_model.dart';/// This class defines the variables used in the [instructor_details_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class InstructorDetailsModel {Rx<List<Userprofile1ItemModel>> userprofile1ItemList = Rx([Userprofile1ItemModel(image:ImageConstant.imgGroupIndianCh114x114.obs,learnNewSkills: "Learn new skills, advance your career".obs,favorite:ImageConstant.imgFavoriteOnprimary.obs,alreadyHaveAn: "Ronald richards".obs,alreadyHaveAn1: "Instructor".obs,price: "65.00".obs),Userprofile1ItemModel(image:ImageConstant.imgGroupIndianCh5.obs,learnNewSkills: "Learn from the best, anywhere in the world".obs,favorite:ImageConstant.imgFavorite28x28.obs,alreadyHaveAn: "Ronald richards".obs,alreadyHaveAn1: "Instructor".obs,price: "80.00".obs)]);

 }
