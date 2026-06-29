import 'package:flutter_elearning_app/core/app_export.dart';
import '../controller/popular_courses_controller.dart';
class PopularCoursesBinding extends Bindings {
  @override
  void dependencies() { Get.lazyPut(() => PopularCoursesController()); }
}
