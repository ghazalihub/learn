import '../../../core/app_export.dart';
import 'chatlist_item_model.dart';

/// This class defines the variables used in the [call_list_page],
/// and is typically used to hold data that is passed between different parts of the application.
class CallListModel {
 static List<ChatlistItemModel> getCallData(){
  return [
   ChatlistItemModel(ImageConstant.imgEllipse22, "Esther howard", "Dec 20, 2023", "Outgoing","voice"),
    ChatlistItemModel(ImageConstant.imgEllipse2258x58, "Guy hawkins", "Dec 20, 2023", "Outgoing","video"),
    ChatlistItemModel(ImageConstant.imgEllipse221, "Leslie alexander", "Dec 20, 2023", "Outgoing","voice"),
    ChatlistItemModel(ImageConstant.imgEllipse222, "Brooklyn simmons", "Dec 20, 2023", "Outgoing","video"),
    ChatlistItemModel(ImageConstant.imgEllipse223, "Jenny wilson", "Dec 20, 2023", "Outgoing","voice"),
    ChatlistItemModel(ImageConstant.imgEllipse224, "Ralph edwards", "Dec 20, 2023", "Outgoing","video"),
    ChatlistItemModel(ImageConstant.imgEllipse22, "Esther howard", "Dec 20, 2023", "Outgoing","voice"),
    ChatlistItemModel(ImageConstant.imgEllipse2258x58, "Guy hawkins", "Dec 20, 2023", "Outgoing","video"),
    ChatlistItemModel(ImageConstant.imgEllipse221, "Leslie alexander", "Dec 20, 2023", "Outgoing","voice"),
    ChatlistItemModel(ImageConstant.imgEllipse222, "Brooklyn simmons", "Dec 20, 2023", "Outgoing","video"),
  ];
 }



}
