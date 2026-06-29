import 'package:flutter/material.dart';

/// A controller class for the ResultFoundScreen.
import 'package:flutter_elearning_app/core/app_export.dart';
import 'package:flutter_elearning_app/data/models/course_model.dart';
import 'package:flutter_elearning_app/data/repositories/course_repository.dart';


///
/// This class manages the state of the ResultFoundScreen, including the
/// current resultFoundModelObj
class ResultFoundController extends GetxController {
  final CourseRepository _repo = Get.find<CourseRepository>();
  TextEditingController searchController = TextEditingController();

  RxList<CourseModel> searchResults = <CourseModel>[].obs;
  RxBool isLoading = false.obs;

  void search(String query) async {
    if (query.isEmpty) {
      searchResults.clear();
      return;
    }
    isLoading.value = true;
    final allCourses = await _repo.getCourses();
    searchResults.value = allCourses.where((c) =>
      c.title!.toLowerCase().contains(query.toLowerCase()) ||
      c.category!.toLowerCase().contains(query.toLowerCase()) ||
      c.instructorName!.toLowerCase().contains(query.toLowerCase())
    ).toList();
    isLoading.value = false;
  }

  @override
  void onClose() {
    super.onClose();
    searchController.dispose();
  }
}
