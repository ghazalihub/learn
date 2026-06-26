import 'package:flutter_elearning_app/core/app_export.dart';
import 'package:flutter_elearning_app/data/repositories/course_repository.dart';
import 'package:flutter_elearning_app/data/models/course_model.dart';

class FeaturedCourseController extends GetxController {
  final CourseRepository _courseRepository = Get.find<CourseRepository>();
  RxList<CourseModel> featuredCourceList = <CourseModel>[].obs;
  RxBool isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    loadFeaturedCourses();
  }

  Future<void> loadFeaturedCourses() async {
    isLoading.value = true;
    featuredCourceList.value = await _courseRepository.getFeaturedCourses();
    isLoading.value = false;
  }
}
