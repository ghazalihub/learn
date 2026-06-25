import '../../../core/app_export.dart';/// This class is used in the [lessonslist_item_widget] screen.
class LessonslistItemModel {LessonslistItemModel({this.lessonCount, this.viewAllText, this.id, }) { lessonCount = lessonCount  ?? Rx("154 lessons");viewAllText = viewAllText  ?? Rx("View all");id = id  ?? Rx(""); }

Rx<String>? lessonCount;

Rx<String>? viewAllText;

Rx<String>? id;

 }
