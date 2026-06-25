import 'widget_item_model.dart';

class CourseDetailsModel {
  static List<WidgetItemModel> getLessonList() {
    return [
      WidgetItemModel("01", "Introduction", "10:00", false),
      WidgetItemModel("02", "Basics", "15:00", false),
    ];
  }
}
