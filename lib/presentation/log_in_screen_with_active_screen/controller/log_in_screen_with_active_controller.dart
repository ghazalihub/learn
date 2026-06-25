import 'package:flutter_elearning_app/core/app_export.dart';import 'package:flutter_elearning_app/presentation/log_in_screen_with_active_screen/models/log_in_screen_with_active_model.dart';import 'package:flutter/material.dart';/// A controller class for the LogInScreenWithActiveScreen.
///
/// This class manages the state of the LogInScreenWithActiveScreen, including the
/// current logInScreenWithActiveModelObj
class LogInScreenWithActiveController extends GetxController {TextEditingController emailFieldController = TextEditingController();

TextEditingController passwordFieldController = TextEditingController();

Rx<LogInScreenWithActiveModel> logInScreenWithActiveModelObj = LogInScreenWithActiveModel().obs;

@override void onClose() { super.onClose(); emailFieldController.dispose(); passwordFieldController.dispose(); } 
 }
