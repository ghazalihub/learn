import '../../../core/app_export.dart';/// This class is used in the [learnnewskillslist1_item_widget] screen.
class Learnnewskillslist1ItemModel {Learnnewskillslist1ItemModel({this.image, this.learnNewSkills, this.price, this.circleImage, this.alreadyHaveAn, this.alreadyHaveAn1, this.one, this.id, }) { image = image  ?? Rx(ImageConstant.imgGroupIndianCh2);learnNewSkills = learnNewSkills  ?? Rx("Learn new skills, advance your career");price = price  ?? Rx("65.00");circleImage = circleImage  ?? Rx(ImageConstant.imgEllipse2049);alreadyHaveAn = alreadyHaveAn  ?? Rx("Esther howards");alreadyHaveAn1 = alreadyHaveAn1  ?? Rx("Instructor");one = one  ?? Rx("01");id = id  ?? Rx(""); }

Rx<String>? image;

Rx<String>? learnNewSkills;

Rx<String>? price;

Rx<String>? circleImage;

Rx<String>? alreadyHaveAn;

Rx<String>? alreadyHaveAn1;

Rx<String>? one;

Rx<String>? id;

 }
