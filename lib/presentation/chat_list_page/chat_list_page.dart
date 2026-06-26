import 'package:flutter/material.dart';
import 'package:flutter_elearning_app/core/app_export.dart';

import '../chat_list_page/widgets/userprofileinfo_item_widget.dart';
import 'controller/chat_list_controller.dart';
import 'models/userprofileinfo_item_model.dart';

// ignore_for_file: must_be_immutable
class ChatListPage extends StatefulWidget {
  ChatListPage({Key? key}) : super(key: key);

  @override
  State<ChatListPage> createState() => _ChatListPageState();
}

class _ChatListPageState extends State<ChatListPage> {
  ChatListController controller =
      Get.put(ChatListController());

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return  ListView.separated(
      padding: EdgeInsets.all(16.h),
        physics: BouncingScrollPhysics(),
        shrinkWrap: true,
        separatorBuilder: (context, index) {
          return SizedBox(height: 16.v);
        },
        itemCount: controller.chatList.length,
        itemBuilder: (context, index) {
          UserprofileinfoItemModel model = controller.chatList[index];
          return animationfunction(index, GestureDetector(

              onTap: (){
                Get.toNamed(AppRoutes.chatDetailsScreen);
              },
              child: UserprofileinfoItemWidget(model)));
        });
  }




  /// Navigates to the homeScreenContainerScreen when the action is triggered.
  onTapTwentyEight() {
    Get.toNamed(
      AppRoutes.homeScreenContainerScreen,
    );
  }

  /// Navigates to the myCoursesScreen when the action is triggered.
  onTapMyCourses() {
    Get.toNamed(
      AppRoutes.myCoursesScreen,
    );
  }

  /// Navigates to the favoriteScreen when the action is triggered.
  onTapTwentyEight1() {
    Get.toNamed(
      AppRoutes.favorite1Page,
    );
  }

  /// Navigates to the profileOneScreen when the action is triggered.
  onTapTwentyEight2() {
    Get.toNamed(
      AppRoutes.profileOneScreen,
    );
  }
}
