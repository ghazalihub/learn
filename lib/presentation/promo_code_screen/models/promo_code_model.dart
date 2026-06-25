import '../../../core/app_export.dart';import 'frame_item_model.dart';/// This class defines the variables used in the [promo_code_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class PromoCodeModel {Rx<List<FrameItemModel>> frameItemList = Rx([FrameItemModel(holidayDealText: "HOLIDAYDEAL".obs),FrameItemModel(holidayDealText: "NFTREDS".obs),FrameItemModel(holidayDealText: "E-LEARN".obs)]);

 }
