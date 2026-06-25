import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter_elearning_app/core/app_export.dart';

class ApiClient extends GetConnect {
  static const String jsonUrl = 'assets/courses.json';

  Future<Map<String, dynamic>> fetchCourseData() async {
    try {
      // Current implementation loads from assets.
      // Ready to swap with http.get(Uri.parse(url)) when needed.
      String jsonString = await rootBundle.loadString(jsonUrl);
      return json.decode(jsonString);
    } catch (e) {
      print("Error fetching courses: $e");
      return {};
    }
  }
}
