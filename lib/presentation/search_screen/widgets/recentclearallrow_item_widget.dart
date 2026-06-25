// import '../controller/search_controller.dart';
// import '../models/recentclearallrow_item_model.dart';
// import 'package:flutter/material.dart' hide SearchController;
// import 'package:flutter_elearning_app/core/app_export.dart';
//
// // ignore: must_be_immutable
// class RecentclearallrowItemWidget extends StatelessWidget {
//   RecentclearallrowItemWidget(
//     this.recentclearallrowItemModelObj, {
//     Key? key,
//   }) : super(
//           key: key,
//         );
//
//   RecentclearallrowItemModel recentclearallrowItemModelObj;
//
//   var controller = Get.find<SearchController>();
//
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Obx(
//           () => Text(
//             recentclearallrowItemModelObj.recentText!.value,
//             style: CustomTextStyles.titleMediumBlack900_1,
//           ),
//         ),
//         Padding(
//           padding: EdgeInsets.only(bottom: 3.v),
//           child: Obx(
//             () => Text(
//               recentclearallrowItemModelObj.clearAllText!.value,
//               style: CustomTextStyles.bodyMediumBlack900,
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
