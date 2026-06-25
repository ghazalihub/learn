import 'package:flutter_elearning_app/core/app_export.dart';import 'package:flutter_elearning_app/presentation/cart_screen/models/cart_model.dart';import 'package:flutter/material.dart';/// A controller class for the CartScreen.
///
/// This class manages the state of the CartScreen, including the
/// current cartModelObj
class CartController extends GetxController {TextEditingController promoCodeController = TextEditingController();

Rx<CartModel> cartModelObj = CartModel().obs;

@override void onClose() { super.onClose(); promoCodeController.dispose(); } 
 }
