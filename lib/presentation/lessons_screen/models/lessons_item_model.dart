import '../../../core/app_export.dart';/// This class is used in the [lessons_item_widget] screen.
class LessonsItemModel {LessonsItemModel({this.widget, this.whyUsingFigma, this.minutes, this.id, }) { widget = widget  ?? Rx("01");whyUsingFigma = whyUsingFigma  ?? Rx("Why using figma");minutes = minutes  ?? Rx("20 Min");id = id  ?? Rx(""); }

Rx<String>? widget;

Rx<String>? whyUsingFigma;

Rx<String>? minutes;

Rx<String>? id;

 }
