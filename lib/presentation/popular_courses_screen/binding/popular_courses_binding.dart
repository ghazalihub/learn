import 'package:get/get.dart';
import '../controller/popular_courses_controller.dart';

class PopularCoursesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PopularCoursesController());
  }
}
