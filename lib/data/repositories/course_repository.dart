import 'package:flutter_elearning_app/core/app_export.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_elearning_app/services/auth_service.dart';
import '../apiClient/api_client.dart';
import '../models/course_model.dart';
import '../../services/cache_service.dart';

class CourseRepository {
  final ApiClient apiClient = Get.find<ApiClient>();
  final CacheService cacheService = Get.find<CacheService>();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<CourseModel>> getCourses() async {
    final remoteData = await apiClient.fetchCourseData();
    if (remoteData.isNotEmpty) {
      final List coursesJson = remoteData['courses'] ?? [];
      final List<CourseModel> courses = coursesJson.map((e) => CourseModel.fromJson(e)).toList();

      // Comparison logic could be added here using 'lastEditDate'
      await cacheService.saveCourses(courses);
      return courses;
    }
    return await cacheService.getCourses();
  }

  Future<List<CategoryModel>> getCategories() async {
    final remoteData = await apiClient.fetchCourseData();
    if (remoteData.isNotEmpty) {
      final List categoriesJson = remoteData['categories'] ?? [];
      return categoriesJson.map((e) => CategoryModel.fromJson(e)).toList();
    }
    return [];
  }

  Future<List<BannerModel>> getBanners() async {
    final remoteData = await apiClient.fetchCourseData();
    if (remoteData.isNotEmpty) {
      final List bannersJson = remoteData['banners'] ?? [];
      return bannersJson.map((e) => BannerModel.fromJson(e)).toList();
    }
    return [];
  }

  Future<List<CourseModel>> getFeaturedCourses() async {
    final allCourses = await getCourses();
    return allCourses.where((c) => c.isFeatured == true).toList();
  }

  Future<void> saveProgress(String courseId, String lessonId) async {
    final authService = Get.find<AuthService>();
    if (authService.isLoggedIn) {
      final userId = authService.currentUser.value!.userId;
      await _firestore.collection('users').doc(userId).collection('progress').doc(courseId).set({
        'completedLessons': FieldValue.arrayUnion([lessonId]),
        'lastUpdated': FieldValue.serverTimestamp(),
      }, SetOptions(merge: true));
    }

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> completed = prefs.getStringList('progress_$courseId') ?? [];
    if (!completed.contains(lessonId)) {
      completed.add(lessonId);
      await prefs.setStringList('progress_$courseId', completed);
    }
  }

  Future<List<String>> getProgress(String courseId) async {
    final authService = Get.find<AuthService>();
    if (authService.isLoggedIn) {
      final userId = authService.currentUser.value!.userId;
      final doc = await _firestore.collection('users').doc(userId).collection('progress').doc(courseId).get();
      if (doc.exists) {
        return List<String>.from(doc.data()!['completedLessons'] ?? []);
      }
    }
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getStringList('progress_$courseId') ?? [];
  }
}
