import 'package:flutter_elearning_app/core/app_export.dart';
import 'package:flutter_elearning_app/data/apiClient/api_client.dart';
import 'package:flutter_elearning_app/data/repositories/course_repository.dart';
import 'package:flutter_elearning_app/services/auth_service.dart';
import 'package:flutter_elearning_app/services/cache_service.dart';
import 'package:flutter_elearning_app/services/cart_service.dart';
import 'package:flutter_elearning_app/services/payment_service.dart';
import 'package:flutter_elearning_app/services/ad_service.dart';
import 'package:flutter_elearning_app/services/favorite_service.dart';
import 'package:flutter_elearning_app/services/chat_service.dart';
import 'package:flutter_elearning_app/services/webrtc_service.dart';
import 'package:flutter_elearning_app/services/notification_service.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(PrefUtils());
    Get.put(CacheService());
    Get.put(ApiClient());
    Get.put(CourseRepository());
    Get.put(AuthService());
    Get.put(CartService());
    Get.put(PaymentService());
    Get.put(AdService());
    Get.put(FavoriteService());
    Get.put(ChatService());
    Get.put(WebRTCService());
    Get.put(NotificationService());
    Connectivity connectivity = Connectivity();
    Get.put(NetworkInfo(connectivity));
  }
}
