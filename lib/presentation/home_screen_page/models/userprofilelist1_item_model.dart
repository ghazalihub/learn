import '../../../core/app_export.dart';/// This class is used in the [userprofilelist1_item_widget] screen.
class Userprofilelist1ItemModel {Userprofilelist1ItemModel({this.userName, this.userRole, this.id, }) { userName = userName  ?? Rx("Ronald richards");userRole = userRole  ?? Rx("Instructor");id = id  ?? Rx(""); }

Rx<String>? userName;

Rx<String>? userRole;

Rx<String>? id;

 }
