import '../../../core/app_export.dart';
import 'categoriesgrid_item_model.dart';

/// This class defines the variables used in the [categories_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class CategoriesModel {

 static List<CategoriesgridItemModel> getCategoriesData(){
  return [
   CategoriesgridItemModel(ImageConstant.imgCatDesigining ,"Designing",appTheme.indigo50,1),
    CategoriesgridItemModel(ImageConstant.imgCar ,"Finance",appTheme.orange50,2),
    CategoriesgridItemModel(ImageConstant.imgCatCode ,"Coding",appTheme.blue5001,3),
    CategoriesgridItemModel(ImageConstant.imgCatScience ,"Science",appTheme.teal50,4),
    CategoriesgridItemModel(ImageConstant.imgCalculator ,"Maths",appTheme.red50,5),
    CategoriesgridItemModel(ImageConstant.imgCatPhysics ,"Physics",appTheme.lightBlue50,6),
    CategoriesgridItemModel(ImageConstant.imgGroup34219 ,"Marketing",appTheme.lightPurple,7),
    CategoriesgridItemModel(ImageConstant.imgCatStock ,"Stock market",appTheme.deepOrange50,8),
    CategoriesgridItemModel(ImageConstant.imgSearchIndigoA200 ,"Photography",appTheme.deepPurple,9),
    CategoriesgridItemModel(ImageConstant.imgCatAnalisys ,"data analysis",appTheme.blue50,10),
    CategoriesgridItemModel(ImageConstant.imgCatCloud ,"Cloud security",appTheme.teal50,11),
    CategoriesgridItemModel(ImageConstant.imgCatMachine ,"Machine learn",appTheme.purple,12),
  ];
 }



}
