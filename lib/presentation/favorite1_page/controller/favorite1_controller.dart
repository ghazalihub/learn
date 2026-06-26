import 'package:flutter_elearning_app/services/favorite_service.dart';
import 'package:flutter_elearning_app/data/models/course_model.dart';
import 'package:flutter_elearning_app/data/repositories/course_repository.dart';
import 'package:flutter_elearning_app/core/app_export.dart';

/// A controller class for the Favorite1Page.
///
/// This class manages the state of the Favorite1Page, including the
/// current favorite1ModelObj
class Favorite1Controller extends GetxController {

 final FavoriteService _favoriteService = Get.find<FavoriteService>();
  final CourseRepository _repo = Get.find<CourseRepository>();
  RxList<CourseModel> favoriteCourses = <CourseModel>[].obs;
  RxBool isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    loadFavorites();
    ever(_favoriteService.favoriteCourseIds, (_) => loadFavorites());
  }

  Future<void> loadFavorites() async {
    isLoading.value = true;
    final allCourses = await _repo.getCourses();
    favoriteCourses.value = allCourses.where((c) => _favoriteService.isFavorite(c.id!)).toList();
    isLoading.value = false;
  }
 }
