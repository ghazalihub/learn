import 'package:flutter_elearning_app/core/app_export.dart';import 'package:flutter_elearning_app/presentation/promo_code_screen/models/promo_code_model.dart';import 'package:flutter/material.dart';/// A controller class for the PromoCodeScreen.
///
/// This class manages the state of the PromoCodeScreen, including the
/// current promoCodeModelObj
class PromoCodeController extends GetxController {TextEditingController enterhereController = TextEditingController();

Rx<PromoCodeModel> promoCodeModelObj = PromoCodeModel().obs;

@override void onClose() { super.onClose(); enterhereController.dispose(); } 
 }
