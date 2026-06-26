import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_elearning_app/core/app_export.dart';

class NotificationService extends GetxService {
  final FirebaseMessaging _fcm = FirebaseMessaging.instance;

  Future<NotificationService> init() async {
    NotificationSettings settings = await _fcm.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('User granted permission');

      String? token = await _fcm.getToken();
      print("FCM Token: $token");

      FirebaseMessaging.onMessage.listen((RemoteMessage message) {
        print('Got a message whilst in the foreground!');
        if (message.notification != null) {
          Get.snackbar(
            message.notification!.title ?? "New Update",
            message.notification!.body ?? "",
            snackPosition: SnackPosition.TOP,
          );
        }
      });
    }

    return this;
  }
}
