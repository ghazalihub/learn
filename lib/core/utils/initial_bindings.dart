import 'package:flutter_elearning_app/core/app_export.dart';
import 'package:flutter_elearning_app/data/apiClient/api_client.dart';
import 'package:flutter_elearning_app/data/repositories/course_repository.dart';
import 'package:flutter_elearning_app/services/auth_service.dart';
import 'package:flutter_elearning_app/services/cache_service.dart';
import 'package:flutter_elearning_app/presentation/cart_screen/controller/cart_controller.dart';
import 'package:flutter_elearning_app/presentation/featured_course_screen/controller/featured_course_controller.dart';
import 'package:flutter_elearning_app/presentation/popular_courses_screen/controller/popular_courses_controller.dart';
import "package:flutter_elearning_app/services/notification_service.dart";

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(PrefUtils());
    Get.put(ApiClient());
    Get.put(CacheService());
    Get.put(AuthService());
    Get.put(CourseRepository());
    Get.putAsync(() => NotificationService().init());
    Get.put(CartController());

    // UI persistent controllers
    Get.lazyPut(() => FeaturedCourseController());
    Get.lazyPut(() => PopularCoursesController());

    Connectivity connectivity = Connectivity();
    Get.put(NetworkInfo(connectivity));
  }
}
