import 'notificationrow_item_model.dart';

/// This class defines the variables used in the [notifications_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class NotificationsModel {

  static List<NotificationrowItemModel> getNotificationData(){
    return [
      NotificationrowItemModel("Limited time discount", "Offer a discount on your e-learning course for a limited time only.", "a few seconds ago"),
      NotificationrowItemModel("Money back guarantee", "Offer a money-back guarantee on your e-learning course to reduce risk", "30 min ago"),
      NotificationrowItemModel("Early bird discount", "Offer a discount to people who sign up for your e-learning course early.", "2 hour ago"),
      NotificationrowItemModel("Certificate of completion", "Offer a certificate of completion to people who finish your e-learning course.", "24 hour ago"),
      NotificationrowItemModel("Payment plans", "Offer students payment plans so they can spread cost of your e-learning course", "a few seconds ago"),

    ];
  }


}
