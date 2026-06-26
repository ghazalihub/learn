import 'dart:convert';
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

  Future<Map<String, dynamic>> _getData() async {
    final prefs = await SharedPreferences.getInstance();
    final cachedData = prefs.getString('cached_courses_json');
    final lastFetch = prefs.getInt('last_courses_fetch') ?? 0;
    final now = DateTime.now().millisecondsSinceEpoch;

    if (cachedData != null && (now - lastFetch < 24 * 60 * 60 * 1000)) {
      return json.decode(cachedData);
    }

    final remoteData = await apiClient.fetchCourseData();
    if (remoteData.isNotEmpty) {
      await prefs.setString('cached_courses_json', json.encode(remoteData));
      await prefs.setInt('last_courses_fetch', now);
      return remoteData;
    }

    return cachedData != null ? json.decode(cachedData) : {};
  }

  Future<List<CourseModel>> getCourses() async {
    final data = await _getData();
    if (data.isNotEmpty) {
      final List coursesJson = data['courses'] ?? [];
      return coursesJson.map((e) => CourseModel.fromJson(e)).toList();
    }
    return [];
  }

  Future<List<CategoryModel>> getCategories() async {
    final data = await _getData();
    if (data.isNotEmpty) {
      final List categoriesJson = data['categories'] ?? [];
      return categoriesJson.map((e) => CategoryModel.fromJson(e)).toList();
    }
    return [];
  }

  Future<List<BannerModel>> getBanners() async {
    final data = await _getData();
    if (data.isNotEmpty) {
      final List bannersJson = data['banners'] ?? [];
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

  Future<void> unlockLesson(String courseId, String lessonId) async {
    final authService = Get.find<AuthService>();
    if (authService.isLoggedIn) {
      final userId = authService.currentUser.value!.userId;
      await _firestore.collection('users').doc(userId).collection('unlocked_lessons').doc(courseId).set({
        'lessons': FieldValue.arrayUnion([lessonId]),
      }, SetOptions(merge: true));
    }
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> unlocked = prefs.getStringList('unlocked_$courseId') ?? [];
    if (!unlocked.contains(lessonId)) {
      unlocked.add(lessonId);
      await prefs.setStringList('unlocked_$courseId', unlocked);
    }
  }

  Future<bool> isLessonUnlocked(String courseId, String lessonId) async {
    final authService = Get.find<AuthService>();
    if (authService.isLoggedIn) {
      final userId = authService.currentUser.value!.userId;
      final doc = await _firestore.collection('users').doc(userId).collection('unlocked_lessons').doc(courseId).get();
      if (doc.exists) {
        final unlocked = List<String>.from(doc.data()!['lessons'] ?? []);
        if (unlocked.contains(lessonId)) return true;
      }
    }
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> unlocked = prefs.getStringList('unlocked_$courseId') ?? [];
    return unlocked.contains(lessonId);
  }
}
