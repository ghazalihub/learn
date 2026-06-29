import '../../../core/app_export.dart';
import 'userprofileinfo_item_model.dart';

/// This class defines the variables used in the [chat_list_page],
/// and is typically used to hold data that is passed between different parts of the application.
class ChatListModel {

  static List<UserprofileinfoItemModel> getCahtList(){
    return [
      UserprofileinfoItemModel("chat_001", ImageConstant.imgEllipse22, "Esther howard", "Hii, buddy submit your notes", "22:00"),
      UserprofileinfoItemModel("chat_002", ImageConstant.imgEllipse2258x58, "Guy hawkins", "What is your today plan", "22:00"),
      UserprofileinfoItemModel("chat_003", ImageConstant.imgEllipse221, "Leslie alexander", "Hello, how are you", "22:00"),
      UserprofileinfoItemModel("chat_004", ImageConstant.imgEllipse222, "Brooklyn simmons", "Hii, buddy submit your notes", "22:00"),
      UserprofileinfoItemModel("chat_005", ImageConstant.imgEllipse223, "Jenny wilson", "Hello, you have any dought", "22:00"),
      UserprofileinfoItemModel("chat_006", ImageConstant.imgEllipse224, "Ralph edwards", "Hii, buddy submit your notes", "22:00"),
      UserprofileinfoItemModel("chat_007", ImageConstant.imgEllipse22, "Esther howard", "Hii, buddy submit your notes", "22:00"),
      UserprofileinfoItemModel("chat_008", ImageConstant.imgEllipse2258x58, "Guy hawkins", "What is your today plan", "22:00"),
      UserprofileinfoItemModel("chat_009", ImageConstant.imgEllipse221, "Leslie alexander", "Hello, how are you", "22:00"),
      UserprofileinfoItemModel("chat_010", ImageConstant.imgEllipse222, "Brooklyn simmons", "Hii, buddy submit your notes", "22:00"),
      UserprofileinfoItemModel("chat_011", ImageConstant.imgEllipse223, "Jenny wilson", "Hello, you have any dought", "22:00"),
      UserprofileinfoItemModel("chat_012", ImageConstant.imgEllipse224, "Ralph edwards", "Hii, buddy submit your notes", "22:00"),
    ];
  }

}
