import 'package:flutter/material.dart';
import 'package:flutter_elearning_app/core/app_export.dart';
import 'package:flutter_elearning_app/data/models/course_model.dart';

class CourseDetailsAboutController extends GetxController {
  TextEditingController elevenController = TextEditingController();

  Rxn<CourseModel> courseModel = Rxn<CourseModel>();
  int currentPage = 0;

  @override
  void onInit() {
    super.onInit();
    if (Get.arguments is CourseModel) {
      courseModel.value = Get.arguments;
    }
  }

  @override
  void onClose() {
    super.onClose();
    elevenController.dispose();
  }
}
