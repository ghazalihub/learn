import 'package:flutter_elearning_app/core/app_export.dart';
import 'package:flutter_elearning_app/presentation/notifications_screen/models/notifications_model.dart';
import '../models/notificationrow_item_model.dart';

class NotificationsController extends GetxController {
  final RxList<NotificationrowItemModel> getNotificationList = <NotificationrowItemModel>[].obs;
  final RxBool isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    loadNotifications();
  }

  Future<void> loadNotifications() async {
    isLoading.value = true;
    getNotificationList.value = NotificationsModel.getNotificationData();
    isLoading.value = false;
  }
}
