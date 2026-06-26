import 'package:flutter_elearning_app/core/app_export.dart';
import 'package:flutter_elearning_app/data/repositories/course_repository.dart';
import 'package:flutter_elearning_app/data/models/course_model.dart';

class PopularCoursesController extends GetxController {
  final CourseRepository _courseRepository = Get.find<CourseRepository>();
  RxList<CourseModel> getPopulerCource = <CourseModel>[].obs;
  RxBool isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    loadPopularCourses();
  }

  Future<void> loadPopularCourses() async {
    isLoading.value = true;
    getPopulerCource.value = await _courseRepository.getCourses();
    isLoading.value = false;
  }
}
