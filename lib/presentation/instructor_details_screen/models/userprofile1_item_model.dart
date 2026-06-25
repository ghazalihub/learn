import '../../../core/app_export.dart';/// This class is used in the [userprofile1_item_widget] screen.
class Userprofile1ItemModel {Userprofile1ItemModel({this.image, this.learnNewSkills, this.favorite, this.alreadyHaveAn, this.alreadyHaveAn1, this.price, this.id, }) { image = image  ?? Rx(ImageConstant.imgGroupIndianCh114x114);learnNewSkills = learnNewSkills  ?? Rx("Learn new skills, advance your career");favorite = favorite  ?? Rx(ImageConstant.imgFavoriteOnprimary);alreadyHaveAn = alreadyHaveAn  ?? Rx("Ronald richards");alreadyHaveAn1 = alreadyHaveAn1  ?? Rx("Instructor");price = price  ?? Rx("65.00");id = id  ?? Rx(""); }

Rx<String>? image;

Rx<String>? learnNewSkills;

Rx<String>? favorite;

Rx<String>? alreadyHaveAn;

Rx<String>? alreadyHaveAn1;

Rx<String>? price;

Rx<String>? id;

 }
