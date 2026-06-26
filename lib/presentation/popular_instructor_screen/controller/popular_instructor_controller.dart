import 'package:flutter_elearning_app/core/app_export.dart';
import 'package:flutter_elearning_app/data/models/course_model.dart';
import 'package:flutter_elearning_app/data/repositories/course_repository.dart';

class PopularInstructorController extends GetxController {
  final CourseRepository _repo = Get.find<CourseRepository>();
  RxList<InstructorModel> instructors = <InstructorModel>[].obs;
  RxBool isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    loadInstructors();
  }

  Future<void> loadInstructors() async {
    isLoading.value = true;
    final data = await _repo.apiClient.fetchCourseData();
    if (data['instructors'] != null) {
      instructors.value = (data['instructors'] as List).map((e) => InstructorModel.fromJson(e)).toList();
    }
    isLoading.value = false;
  }
}
