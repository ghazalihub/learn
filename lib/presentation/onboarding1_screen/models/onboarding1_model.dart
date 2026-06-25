import '../../../core/app_export.dart';

/// This class defines the variables used in the [onboarding1_screen],
import 'learningframe1_item_model.dart';

/// and is typically used to hold data that is passed between different parts of the application.
class Onboarding1Model {
  static List<Learningframe1ItemModel> getOnboardingData() {
    return [
      Learningframe1ItemModel(
          ImageConstant.imgOnboarding1,
          "Learn new skills and advance your career with learning",
          "Electronic learning, is the delivery of learning and training through digital resources."),
      Learningframe1ItemModel(
          ImageConstant.imgOnboarding2,
          "The most convenient and effective way to learn.",
          "Electronic learning, is the delivery of learning and training through digital resources."),
      Learningframe1ItemModel(
          ImageConstant.imgOnboarding3,
          "Learn at your own time, with digital learning.",
          "Electronic learning, is the delivery of learning and training through digital resources."),
    ];
  }
}
