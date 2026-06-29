import 'dart:convert';
import 'package:flutter_elearning_app/core/app_export.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../data/models/course_model.dart';

class CacheService extends GetxService {
  static const String _coursesKey = 'cached_courses';

  Future<void> saveCourses(List<CourseModel> courses) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<String> coursesJson = courses.map((e) => json.encode(e.toJson())).toList();
    await prefs.setStringList(_coursesKey, coursesJson);
  }

  Future<List<CourseModel>> getCourses() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<String>? coursesJson = prefs.getStringList(_coursesKey);
    if (coursesJson == null) return [];
    return coursesJson.map((e) => CourseModel.fromJson(json.decode(e))).toList();
  }
}
