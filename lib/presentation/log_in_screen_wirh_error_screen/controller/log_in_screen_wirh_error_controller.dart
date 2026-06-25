import 'package:flutter_elearning_app/core/app_export.dart';import 'package:flutter_elearning_app/presentation/log_in_screen_wirh_error_screen/models/log_in_screen_wirh_error_model.dart';import 'package:flutter/material.dart';/// A controller class for the LogInScreenWirhErrorScreen.
///
/// This class manages the state of the LogInScreenWirhErrorScreen, including the
/// current logInScreenWirhErrorModelObj
class LogInScreenWirhErrorController extends GetxController {TextEditingController emailFieldController = TextEditingController();

TextEditingController passwordFieldController = TextEditingController();

Rx<LogInScreenWirhErrorModel> logInScreenWirhErrorModelObj = LogInScreenWirhErrorModel().obs;

@override void onClose() { super.onClose(); emailFieldController.dispose(); passwordFieldController.dispose(); } 
 }
