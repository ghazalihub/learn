import 'package:flutter_elearning_app/core/app_export.dart';
import '../controller/popular_instructor_controller.dart';
class PopularInstructorBinding extends Bindings {
  @override
  void dependencies() { Get.lazyPut(() => PopularInstructorController()); }
}
