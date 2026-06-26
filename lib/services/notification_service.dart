import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_elearning_app/core/app_export.dart';

class NotificationService extends GetxService {
  final FirebaseMessaging _fcm = FirebaseMessaging.instance;

  Future<void> init() async {
    await _fcm.requestPermission();
    // String? token = await _fcm.getToken();
    //  // print("FCM Token: \$token");

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      Get.snackbar(message.notification?.title ?? "Notification", message.notification?.body ?? "");
    });
  }
}
