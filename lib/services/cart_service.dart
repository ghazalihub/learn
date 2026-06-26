import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_elearning_app/core/app_export.dart';
import '../data/models/course_model.dart';
import 'auth_service.dart';

class CartService extends GetxService {
  final AuthService _auth = Get.find<AuthService>();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<bool> validatePromoCode(String code) async {
    final doc = await _firestore.collection('promo_codes').doc(code).get();
    return doc.exists && (doc.data()!['isActive'] ?? false);
  }

  Future<void> enroll(CourseModel course) async {
    if (!_auth.isLoggedIn) {
      Get.toNamed(AppRoutes.logInScreen);
      return;
    }

    final user = _auth.currentUser.value!;
    if (!(user.enrolledCourses?.contains(course.id) ?? false)) {
      user.enrolledCourses = [...(user.enrolledCourses ?? []), course.id!];

      // Sync to Firestore
      await _firestore.collection('users').doc(user.userId).update({
        'enrolledCourses': user.enrolledCourses,
      });

      _auth.currentUser.value = user;
      _auth.currentUser.refresh();
      Get.snackbar("Success", "Enrolled in ${course.title} successfully!");
    } else {
      Get.snackbar("Info", "You are already enrolled in this course.");
    }
  }
}
