import '../../../core/app_export.dart';/// This class is used in the [favoritegrid2_item_widget] screen.
class Favoritegrid2ItemModel {Favoritegrid2ItemModel({this.image, this.favorite, this.learnNewSkills, this.circleImage, this.alreadyHaveAn, this.alreadyHaveAn1, this.price, this.id, }) { image = image  ?? Rx(ImageConstant.imgGroupIndianCh2);favorite = favorite  ?? Rx(ImageConstant.imgFavoriteOnprimary);learnNewSkills = learnNewSkills  ?? Rx("How to become an UI/UX designer");circleImage = circleImage  ?? Rx(ImageConstant.imgEllipse2049);alreadyHaveAn = alreadyHaveAn  ?? Rx("Esther howards");alreadyHaveAn1 = alreadyHaveAn1  ?? Rx("Instructor");price = price  ?? Rx("65.00");id = id  ?? Rx(""); }

Rx<String>? image;

Rx<String>? favorite;

Rx<String>? learnNewSkills;

Rx<String>? circleImage;

Rx<String>? alreadyHaveAn;

Rx<String>? alreadyHaveAn1;

Rx<String>? price;

Rx<String>? id;

 }
