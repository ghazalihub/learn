import '../../../core/app_export.dart';

/// This class is used in the [frame_item_widget] screen.

class FrameItemModel {
  FrameItemModel({
    this.holidayDealText,
    this.id,
  }) {
    holidayDealText = holidayDealText ?? Rx("HOLIDAYDEAL");
    id = id ?? Rx("");
  }

  Rx<String>? holidayDealText;

  Rx<String>? id;
}
