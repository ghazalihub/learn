import 'onboardingslider_item_model.dart';import '../../../core/app_export.dart';/// This class defines the variables used in the [onboarding_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class OnboardingModel {Rx<List<OnboardingsliderItemModel>> onboardingsliderItemList = Rx(List.generate(1,(index) => OnboardingsliderItemModel()));

 }
