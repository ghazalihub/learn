import 'package:flutter_elearning_app/core/app_export.dart';

import 'my_cards_model.dart';

class MyCardsData{
  static List<MyCardsModel> getCardData (){
    return [
      MyCardsModel(ImageConstant.imgIcPaypal, "lbl_paypal".tr, 1),
      MyCardsModel(ImageConstant.imgFile, "lbl_visa".tr, 2),
      MyCardsModel(ImageConstant.imgGoogleRed500, "lbl_google_pay".tr, 3),
      MyCardsModel(PrefUtils().getThemeData() == "primary"?ImageConstant.imgApplePay:ImageConstant.imgApplePayWhite, "Apple pay", 4),
    ];
  }
}