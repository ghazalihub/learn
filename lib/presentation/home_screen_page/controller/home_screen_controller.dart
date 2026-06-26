import 'package:flutter/material.dart';
import 'package:flutter_elearning_app/core/app_export.dart';
import 'package:flutter_elearning_app/presentation/home_screen_page/models/home_screen_model.dart';
import 'package:flutter_elearning_app/data/repositories/course_repository.dart';
import 'package:flutter_elearning_app/data/models/course_model.dart';

class HomeScreenController extends GetxController {
  HomeScreenController(this.homeScreenModelObj);
  TextEditingController searchController = TextEditingController();
  Rx<HomeScreenModel> homeScreenModelObj;

  final CourseRepository _courseRepository = Get.find<CourseRepository>();

  RxList<BannerModel> banners = <BannerModel>[].obs;
  RxBool isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    loadData();
  }

  Future<void> loadData() async {
    isLoading.value = true;
    banners.value = await _courseRepository.getBanners();
    isLoading.value = false;
  }

  @override
  void onClose() {
    super.onClose();
    searchController.clear();
  }
}
