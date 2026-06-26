import 'package:flutter_elearning_app/core/app_export.dart';
import 'package:flutter_elearning_app/data/models/course_model.dart';

class CustomerReviewsController extends GetxController {
  RxList<ReviewModel> customerReviewList = <ReviewModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    if (Get.arguments is CourseModel) {
      customerReviewList.value = (Get.arguments as CourseModel).reviews ?? [];
    }
  }
}
