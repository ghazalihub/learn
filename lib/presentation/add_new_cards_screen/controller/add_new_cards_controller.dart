import 'package:flutter_elearning_app/core/app_export.dart';import 'package:flutter_elearning_app/presentation/add_new_cards_screen/models/add_new_cards_model.dart';import 'package:flutter/material.dart';/// A controller class for the AddNewCardsScreen.
///
/// This class manages the state of the AddNewCardsScreen, including the
/// current addNewCardsModelObj
class AddNewCardsController extends GetxController {TextEditingController cardNumberEditTextController = TextEditingController();

TextEditingController expiryDateEditTextController = TextEditingController();

TextEditingController cvvEditTextController = TextEditingController();

Rx<AddNewCardsModel> addNewCardsModelObj = AddNewCardsModel().obs;

@override void onClose() { super.onClose(); cardNumberEditTextController.dispose(); expiryDateEditTextController.dispose(); cvvEditTextController.dispose(); } 
 }
