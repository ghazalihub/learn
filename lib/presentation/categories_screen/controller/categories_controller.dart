import 'package:flutter_elearning_app/core/app_export.dart';
import 'package:flutter_elearning_app/data/repositories/course_repository.dart';
import 'package:flutter_elearning_app/data/models/course_model.dart';

class CategoriesController extends GetxController {
  final CourseRepository _courseRepository = Get.find<CourseRepository>();
  RxList<CategoryModel> categories = <CategoryModel>[].obs;
  RxBool isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    loadCategories();
  }

  Future<void> loadCategories() async {
    isLoading.value = true;
    categories.value = await _courseRepository.getCategories();
    isLoading.value = false;
  }
}
