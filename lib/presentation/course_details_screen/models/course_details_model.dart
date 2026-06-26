import 'widget_item_model.dart';

/// This class defines the variables used in the [course_details_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class CourseDetailsModel {

 static List<WidgetItemModel> getLessonsList(){
  return [
   WidgetItemModel("Why using figma", "20 Min", false, 01),
    WidgetItemModel("Set up your figma account", "20 Min", false, 02),
    WidgetItemModel("Take a look figma interface", "20 Min", false, 03),
    WidgetItemModel("Working with frame & layer", "20 Min", false, 04),
    WidgetItemModel("Working with text & grids", "20 Min", false, 05),
    WidgetItemModel("Using figma plugins", "20 Min", false, 06),
    WidgetItemModel("User interface for websites", "20 Min", false, 07),
    WidgetItemModel("Designing the overall website", "20 Min", false, 08),
    WidgetItemModel("Creating digital illustrations", "20 Min", false, 09),
  ];
 }

  // Rx<List<WidgetItemModel>> widgetItemList = Rx([
  //   WidgetItemModel(
  //       widget: "01".obs,
  //       whyUsingFigma: "Why using figma".obs,
  //       time: "20 Min".obs,
  //       image: ImageConstant.imgCheckmarkPrimary.obs),
  //   WidgetItemModel(
  //       widget: "02".obs,
  //       whyUsingFigma: "Set up your figma account".obs,
  //       time: "20 Min".obs,
  //       image: ImageConstant.imgCheckmarkPrimary.obs),
  //   WidgetItemModel(
  //       widget: "03".obs,
  //       whyUsingFigma: "Take a look figma interface".obs,
  //       time: "20 Min".obs,
  //       image: ImageConstant.imgCheckmarkPrimary.obs),
  //   WidgetItemModel(
  //       widget: "04".obs,
  //       whyUsingFigma: "Working with frame & layer".obs,
  //       time: "20 Min".obs,
  //       image: ImageConstant.imgCheckmarkPrimary.obs),
  //   WidgetItemModel(
  //       widget: "05".obs,
  //       whyUsingFigma: "Working with text & grids".obs,
  //       time: "20 Min".obs,
  //       image: ImageConstant.imgPlay.obs),
  //   WidgetItemModel(
  //       widget: "06".obs,
  //       whyUsingFigma: "Using figma plugins".obs,
  //       time: "20 Min".obs,
  //       image: ImageConstant.imgPlay.obs),
  //   WidgetItemModel(
  //       widget: "07".obs,
  //       whyUsingFigma: "User interface for websites".obs,
  //       time: "20 Min".obs,
  //       image: ImageConstant.imgPlay.obs),
  //   WidgetItemModel(
  //       widget: "08".obs,
  //       whyUsingFigma: "Designing the overall website".obs,
  //       time: "20 Min".obs,
  //       image: ImageConstant.imgPlay.obs),
  //   WidgetItemModel(
  //       widget: "04".obs,
  //       whyUsingFigma: "Creating digital illustrations".obs,
  //       time: "20 Min".obs,
  //       image: ImageConstant.imgPlay.obs)
  // ]);
}
