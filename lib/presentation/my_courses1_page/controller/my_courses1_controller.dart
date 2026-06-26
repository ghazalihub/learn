import 'package:flutter_elearning_app/core/app_export.dart';
import 'package:flutter_elearning_app/data/models/course_model.dart';
import 'package:flutter_elearning_app/data/repositories/course_repository.dart';
import 'package:flutter_elearning_app/services/auth_service.dart';

/// A controller class for the MyCourses1Page.
///
/// This class manages the state of the MyCourses1Page, including the
/// current myCourses1ModelObj
class MyCourses1Controller extends GetxController {
  final CourseRepository _repo = Get.find<CourseRepository>();
  final AuthService _authService = Get.find<AuthService>();

  RxList<CourseModel> myCourses = <CourseModel>[].obs;
  RxBool isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    loadMyCourses();
  }

  Future<void> loadMyCourses() async {
    isLoading.value = true;
    if (_authService.isLoggedIn) {
      final enrolledIds = _authService.currentUser.value!.enrolledCourses ?? [];
      final allCourses = await _repo.getCourses();
      myCourses.value = allCourses.where((c) => enrolledIds.contains(c.id)).toList();
    }
    isLoading.value = false;
  }
}
