import 'package:flutter_elearning_app/core/app_export.dart';import 'package:flutter_elearning_app/presentation/lessons_screen/models/lessons_model.dart';/// A controller class for the LessonsScreen.
///
/// This class manages the state of the LessonsScreen, including the
/// current lessonsModelObj
class LessonsController extends GetxController {Rx<LessonsModel> lessonsModelObj = LessonsModel().obs;

 }
