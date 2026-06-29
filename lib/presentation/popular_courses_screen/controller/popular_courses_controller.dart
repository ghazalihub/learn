import 'package:flutter_elearning_app/core/app_export.dart';
import 'package:flutter_elearning_app/data/models/course_model.dart';
import 'package:flutter_elearning_app/data/repositories/course_repository.dart';

class PopularCoursesController extends GetxController {
  final CourseRepository _repo = Get.find<CourseRepository>();
  RxList<CourseModel> courses = <CourseModel>[].obs;
  RxBool isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    loadCourses();
  }

  Future<void> loadCourses() async {
    isLoading.value = true;
    courses.value = await _repo.getCourses();
    isLoading.value = false;
  }
}
