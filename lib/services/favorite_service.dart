import 'package:flutter_elearning_app/core/app_export.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoriteService extends GetxService {
  RxList<String> favoriteCourseIds = <String>[].obs;

  @override
  void onInit() {
    super.onInit();

    loadFavorites();
  }

  Future<void> loadFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    favoriteCourseIds.value = prefs.getStringList('favorite_courses') ?? [];
  }

  Future<void> toggleFavorite(String courseId) async {
    if (favoriteCourseIds.contains(courseId)) {
      favoriteCourseIds.remove(courseId);
    } else {
      favoriteCourseIds.add(courseId);
    }
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('favorite_courses', favoriteCourseIds);
  }

  bool isFavorite(String courseId) {
    return favoriteCourseIds.contains(courseId);
  }
}
