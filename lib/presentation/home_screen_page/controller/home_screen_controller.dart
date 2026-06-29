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
  RxList<InstructorModel> instructors = <InstructorModel>[].obs;
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
      final remoteData = await _repo.apiClient.fetchCourseData();
      if (remoteData.isNotEmpty) {
        if (remoteData['banners'] != null) {
          banners.value = (remoteData['banners'] as List).map((e) => BannerModel.fromJson(e)).toList();
        }
        if (remoteData['categories'] != null) {
          categories.value = (remoteData['categories'] as List).map((e) => CategoryModel.fromJson(e)).toList();
        }
        if (remoteData['courses'] != null) {
          final allCourses = (remoteData['courses'] as List).map((e) => CourseModel.fromJson(e)).toList();
          featuredCourses.value = allCourses.where((c) => c.isFeatured == true).toList();
          popularCourses.value = allCourses;
        }
        if (remoteData['instructors'] != null) {
          instructors.value = (remoteData['instructors'] as List).map((e) => InstructorModel.fromJson(e)).toList();
        }
      }
    } catch (e) {
      //  // print("Error loading home data: $e");
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
