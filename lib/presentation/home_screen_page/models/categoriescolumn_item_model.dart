import '../../../core/app_export.dart';/// This class is used in the [categoriescolumn_item_widget] screen.
class CategoriescolumnItemModel {CategoriescolumnItemModel({this.catDesigning, this.designingText, this.id, }) { catDesigning = catDesigning  ?? Rx(ImageConstant.imgCatDesigining);designingText = designingText  ?? Rx("Designing");id = id  ?? Rx(""); }

Rx<String>? catDesigning;

Rx<String>? designingText;

Rx<String>? id;

 }
