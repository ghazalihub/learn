import 'package:flutter/material.dart';
import 'package:flutter_elearning_app/core/app_export.dart';
import 'package:flutter_elearning_app/data/repositories/course_repository.dart';
import 'package:flutter_elearning_app/data/models/course_model.dart';

class ResultFoundController extends GetxController {
  TextEditingController searchController = TextEditingController();
  final CourseRepository _courseRepository = Get.find<CourseRepository>();

  RxList<CourseModel> searchResults = <CourseModel>[].obs;
  RxList<CourseModel> allCourses = <CourseModel>[].obs;
  RxBool isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    loadAllCourses();
  }

  Future<void> loadAllCourses() async {
    isLoading.value = true;
    allCourses.value = await _courseRepository.getCourses();
    searchResults.value = allCourses;
    isLoading.value = false;
  }

  void search(String query) {
    if (query.isEmpty) {
      searchResults.value = allCourses;
    } else {
      searchResults.value = allCourses
          .where((c) => c.title!.toLowerCase().contains(query.toLowerCase()) ||
                       c.description!.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
  }

  @override
  void onClose() {
    super.onClose();
    searchController.dispose();
  }
}
