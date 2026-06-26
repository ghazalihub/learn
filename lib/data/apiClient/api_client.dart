import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter_elearning_app/core/app_export.dart';

class ApiClient extends GetConnect {
  static const String assetPath = 'assets/courses.json';
  // Replace with actual remote URL when available
  static const String remoteUrl = 'https://raw.githubusercontent.com/user/repo/main/courses.json';

  Future<Map<String, dynamic>> fetchCourseData() async {
    try {
      // Attempt to fetch from remote first with a timeout
      // final response = await http.get(Uri.parse(remoteUrl)).timeout(Duration(seconds: 10));
      // if (response.statusCode == 200) {
      //   return json.decode(response.body);
      // }

      // Fallback to local asset
      String jsonString = await rootBundle.loadString(assetPath);
      return json.decode(jsonString);
    } catch (e) {
      //  // print("Error fetching courses: $e");
      // Fallback to local asset if remote fails
      try {
        String jsonString = await rootBundle.loadString(assetPath);
        return json.decode(jsonString);
      } catch (e2) {
        //  // print("Error fetching local fallback: $e2");
        return {};
      }
    }
  }
}
