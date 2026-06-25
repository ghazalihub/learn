import 'package:flutter/material.dart';
import 'package:flutter_elearning_app/core/app_export.dart';
import 'package:flutter_elearning_app/data/models/course_model.dart';
import 'package:flutter_elearning_app/data/repositories/course_repository.dart';
import 'package:flutter_elearning_app/presentation/home_screen_page/models/home_screen_model.dart';

class HomeScreenController extends GetxController {
  final CourseRepository _repo = Get.find<CourseRepository>();

  RxList<BannerModel> banners = <BannerModel>[].obs;
  RxList<CategoryModel> categories = <CategoryModel>[].obs;
  RxList<CourseModel> featuredCourses = <CourseModel>[].obs;
  RxList<CourseModel> popularCourses = <CourseModel>[].obs;
  RxBool isLoading = true.obs;

  HomeScreenController(this.homeScreenModelObj);
  TextEditingController searchController = TextEditingController();
  Rx<HomeScreenModel> homeScreenModelObj;

  @override
  void onInit() {
    super.onInit();
    loadData();
  }

  Future<void> loadData() async {
    isLoading.value = true;
    try {
      banners.value = await _repo.getBanners();
      categories.value = await _repo.getCategories();
      featuredCourses.value = await _repo.getFeaturedCourses();
      popularCourses.value = await _repo.getCourses();
    } catch (e) {
      print("Error loading home data: $e");
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onClose() {
    super.onClose();
    searchController.clear();
  }
}
