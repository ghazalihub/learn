import 'package:flutter_elearning_app/core/app_export.dart';
import 'package:flutter_elearning_app/data/models/course_model.dart';
import 'package:flutter_elearning_app/data/repositories/course_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MyCoursesController extends GetxController {
  final CourseRepository _courseRepository = Get.find<CourseRepository>();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  RxList<CourseModel> enrolledCourses = <CourseModel>[].obs;
  RxBool isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    loadEnrolledCourses();
  }

  Future<void> loadEnrolledCourses() async {
    User? user = _auth.currentUser;
    if (user == null) {
      isLoading.value = false;
      return;
    }

    isLoading.value = true;
    try {
      DocumentSnapshot userDoc = await _firestore.collection('users').doc(user.uid).get();
      if (userDoc.exists && userDoc.data() != null) {
        List<dynamic> courseIds = (userDoc.data() as Map<String, dynamic>)['enrolledCourses'] ?? [];
        List<CourseModel> allCourses = await _courseRepository.getCourses();
        enrolledCourses.value = allCourses.where((c) => courseIds.contains(c.id)).toList();
      }
    } catch (e) {
      Get.snackbar("Error", "Failed to load courses");
    } finally {
      isLoading.value = false;
    }
  }
}
