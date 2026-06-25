import '../../../core/app_export.dart';/// This class is used in the [userprofilelist_item_widget] screen.
class UserprofilelistItemModel {UserprofilelistItemModel({this.userImage, this.learnNewSkills, this.userCircleImage, this.userName, this.userInstructor, this.userPrice, this.id, }) { userImage = userImage  ?? Rx(ImageConstant.imgGroupIndianCh);learnNewSkills = learnNewSkills  ?? Rx("How to become an UI/UX designer");userCircleImage = userCircleImage  ?? Rx(ImageConstant.imgEllipse2049);userName = userName  ?? Rx("Esther howards");userInstructor = userInstructor  ?? Rx("Instructor");userPrice = userPrice  ?? Rx("50.00");id = id  ?? Rx(""); }

Rx<String>? userImage;

Rx<String>? learnNewSkills;

Rx<String>? userCircleImage;

Rx<String>? userName;

Rx<String>? userInstructor;

Rx<String>? userPrice;

Rx<String>? id;

 }
