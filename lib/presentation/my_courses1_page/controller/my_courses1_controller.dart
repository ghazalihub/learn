import 'package:flutter_elearning_app/core/app_export.dart';
import 'package:flutter_elearning_app/data/models/course_model.dart';
import 'package:flutter_elearning_app/data/repositories/course_repository.dart';
import 'package:flutter_elearning_app/services/auth_service.dart';

class MyCourses1Controller extends GetxController {
  final CourseRepository _repo = Get.find<CourseRepository>();
  final AuthService _auth = Get.find<AuthService>();

  RxList<CourseModel> enrolledCourses = <CourseModel>[].obs;
  RxMap<String, List<String>> progress = <String, List<String>>{}.obs;
  RxBool isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    loadEnrolledCourses();
  }

  Future<void> loadEnrolledCourses() async {
    isLoading.value = true;
    try {
      final allCourses = await _repo.getCourses();
      final user = _auth.currentUser.value;
      if (user != null) {
        enrolledCourses.value = allCourses
            .where((c) => user.enrolledCourses?.contains(c.id) ?? false)
            .toList();
        for (var course in enrolledCourses) {
          progress[course.id!] = await _repo.getProgress(course.id!);
        }
      }
    } catch (e) {
      print("Error loading enrolled courses: $e");
    } finally {
      isLoading.value = false;
    }
  }
}
