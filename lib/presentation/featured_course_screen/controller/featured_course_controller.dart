import 'package:flutter_elearning_app/core/app_export.dart';
import 'package:flutter_elearning_app/data/models/course_model.dart';
import 'package:flutter_elearning_app/data/repositories/course_repository.dart';

class FeaturedCourseController extends GetxController {
  final CourseRepository _repo = Get.find<CourseRepository>();
  RxList<CourseModel> featuredCourses = <CourseModel>[].obs;
  RxBool isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    loadFeaturedCourses();
  }

  Future<void> loadFeaturedCourses() async {
    isLoading.value = true;
    try {
      featuredCourses.value = await _repo.getFeaturedCourses();
    } catch (e) {
      print("Error loading featured courses: $e");
    } finally {
      isLoading.value = false;
    }
  }
}
