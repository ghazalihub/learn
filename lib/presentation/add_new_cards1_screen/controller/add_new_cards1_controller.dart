import 'package:flutter_elearning_app/core/app_export.dart';import 'package:flutter_elearning_app/presentation/add_new_cards1_screen/models/add_new_cards1_model.dart';import 'package:flutter/material.dart';/// A controller class for the AddNewCards1Screen.
///
/// This class manages the state of the AddNewCards1Screen, including the
/// current addNewCards1ModelObj
class AddNewCards1Controller extends GetxController {TextEditingController cardNumberEditTextController = TextEditingController();

TextEditingController expiryDateEditTextController = TextEditingController();

TextEditingController cvvEditTextController = TextEditingController();

Rx<AddNewCards1Model> addNewCards1ModelObj = AddNewCards1Model().obs;

@override void onClose() { super.onClose(); cardNumberEditTextController.dispose(); expiryDateEditTextController.dispose(); cvvEditTextController.dispose(); } 
 }
