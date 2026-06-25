import 'learningframe_item_model.dart';import '../../../core/app_export.dart';/// This class defines the variables used in the [onboarding_screen_one_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class OnboardingScreenOneModel {Rx<List<LearningframeItemModel>> learningframeItemList = Rx(List.generate(1,(index) => LearningframeItemModel()));

 }
