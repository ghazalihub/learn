import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter_elearning_app/core/app_export.dart';
import 'package:flutter_elearning_app/data/models/course_model.dart';
import 'package:flutter_elearning_app/services/cache_service.dart';
import 'package:http/http.dart' as http;

class CourseRepository extends GetxService {
  final CacheService _cacheService = Get.find<CacheService>();

  final String _remoteUrl = "https://xyz.com/api/courses.json";

  Future<Map<String, dynamic>> fetchAllData() async {
    try {
      // 1. Try fetching remote data
      final response = await http.get(Uri.parse(_remoteUrl)).timeout(const Duration(seconds: 5));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        _processData(data);
        return data;
      }
    } catch (e) {
      print("Remote fetch failed: $e");
    }

    try {
      // Fallback to local assets
      String jsonString = await rootBundle.loadString('assets/courses.json');
      final data = json.decode(jsonString);
      _processData(data);
      return data;
    } catch (e) {
      // Load from cache if offline
      final cachedData = _cacheService.getCachedData('all_data');
      if (cachedData != null) {
        return json.decode(cachedData);
      }
      return {};
    }
  }

  void _processData(Map<String, dynamic> data) {
    _cacheService.cacheData('all_data', json.encode(data));
    _cacheService.cacheLastUpdated(data['lastUpdated'] ?? '');
  }

  Future<List<CourseModel>> getCourses() async {
    final data = await fetchAllData();
    if (data.containsKey('courses')) {
      return (data['courses'] as List).map((i) => CourseModel.fromJson(i)).toList();
    }
    return [];
  }

  Future<List<CategoryModel>> getCategories() async {
    final data = await fetchAllData();
    if (data.containsKey('categories')) {
      return (data['categories'] as List).map((i) => CategoryModel.fromJson(i)).toList();
    }
    return [];
  }

  Future<List<BannerModel>> getBanners() async {
    final data = await fetchAllData();
    if (data.containsKey('banners')) {
      return (data['banners'] as List).map((i) => BannerModel.fromJson(i)).toList();
    }
    return [];
  }

  Future<List<CourseModel>> getFeaturedCourses() async {
    final courses = await getCourses();
    return courses.where((c) => c.isFeatured == true).toList();
  }
}
