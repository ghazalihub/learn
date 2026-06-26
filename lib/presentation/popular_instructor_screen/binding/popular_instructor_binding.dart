import 'package:get/get.dart';
import '../controller/popular_instructor_controller.dart';

class PopularInstructorBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PopularInstructorController());
  }
}
