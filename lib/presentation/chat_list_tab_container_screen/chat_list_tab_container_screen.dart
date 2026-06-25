import 'package:flutter/material.dart';
import 'package:flutter_elearning_app/core/app_export.dart';
import 'package:flutter_elearning_app/presentation/call_list_page/call_list_page.dart';
import 'package:flutter_elearning_app/presentation/chat_list_page/chat_list_page.dart';

import 'controller/chat_list_tab_container_controller.dart';

class ChatListTabContainerScreen extends StatefulWidget {
  const ChatListTabContainerScreen({super.key});

  @override
  State<ChatListTabContainerScreen> createState() =>
      _ChatListTabContainerScreenState();
}

class _ChatListTabContainerScreenState
    extends State<ChatListTabContainerScreen> {
  ChatListTabContainerController chatListTabContainerController =
      Get.put(ChatListTabContainerController());
  PageController pageController = PageController();
List pages = [
  ChatListPage(),
  CallListPage(),
];
  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return GetBuilder<ChatListTabContainerController>(
      init: ChatListTabContainerController(),
      builder:(controller) =>  Column(
        children: [
          SizedBox(height: 20.v),
          Text(
            "lbl_chat".tr,
            style: theme.textTheme.titleLarge,
          ),
          SizedBox(height: 24.v),
          // _buildTabview(),
          Row(
            children: [
              Expanded(
                  child: GestureDetector(
                onTap: () {
                  controller.currentTab = 0;
                  pageController.animateToPage(0,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.ease);
                  controller.update();
                },
                child: Container(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                          color: controller.currentTab == 0
                              ? appTheme.buttonColor
                              : PrefUtils().getThemeData() == "primary"?appTheme.black10:appTheme.gray700,
                          width: 1.v),
                    ),
                  ),
                  child: Center(
                    child: Padding(
                      padding:  EdgeInsets.only(bottom: 8.v),
                      child: Text(
                        "lbl_chat".tr,
                        style: controller.currentTab == 0
                            ? TextStyle(
                          color: appTheme.buttonColor,
                                fontSize: 16.fSize,
                                fontFamily: 'SF Pro Display',
                                fontWeight: FontWeight.w700,
                              )
                            : TextStyle(
                                color: appTheme.gray700,
                                fontSize: 16.fSize,
                                fontFamily: 'SF Pro Display',
                                fontWeight: FontWeight.w400,
                              ),
                      ),
                    ),
                  ),
                ),
              )),
              Expanded(
                  child: GestureDetector(
                onTap: () {
                  controller.currentTab = 1;
                  pageController.animateToPage(1,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.ease);
                  controller.update();
                },
                child: Container(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                          color:  controller.currentTab == 1
                              ? appTheme.buttonColor
                              : PrefUtils().getThemeData() == "primary"?appTheme.black10:appTheme.gray700,
                          width: 1.v),
                    ),
                  ),
                  child: Center(
                    child: Padding(
                      padding:  EdgeInsets.only(bottom: 8.v),
                      child: Text(
                        "lbl_call".tr,
                        style: controller.currentTab == 1
                            ? TextStyle(
                          color: appTheme.buttonColor,
                                fontSize: 16.fSize,
                                fontFamily: 'SF Pro Display',
                                fontWeight: FontWeight.w700,
                              )
                            : TextStyle(
                                color: appTheme.gray700,
                                fontSize: 16.fSize,
                                fontFamily: 'SF Pro Display',
                                fontWeight: FontWeight.w400,
                              ),
                      ),
                    ),
                  ),
                ),
              ))
            ],
          ),
          // Stack(
          //   // fit: StackFit.passthrough,
          //   alignment: Alignment.bottomCenter,
          //   children: <Widget>[
          //     PrefUtils().getThemeData() == "primary"?SizedBox():Container(
          //       decoration: BoxDecoration(
          //         border: Border(
          //           bottom: BorderSide(color: appTheme.borderColor, width: 2.0),
          //         ),
          //       ),
          //     ),
          //     TabBar(
          //       labelStyle: TextStyle(
          //         fontSize: 16.fSize,
          //         fontFamily: 'SF Pro Display',
          //         fontWeight: FontWeight.w700,
          //       ),
          //       labelColor: theme.colorScheme.primary,
          //       unselectedLabelStyle: TextStyle(
          //         color: appTheme.gray700,
          //         fontSize: 16.fSize,
          //         fontFamily: 'SF Pro Display',
          //         fontWeight: FontWeight.w400,
          //       ),
          //       indicatorColor: appTheme.buttonColor,
          //       indicatorSize: TabBarIndicatorSize.tab,
          //       controller: controller.tabviewController,
          //       isScrollable: true,
          //       onTap: (index) {
          //         // tabsModel.value = listTabsModel[index];
          //       },
          //       tabs: [
          //         Tab(
          //           child: Text(
          //             "lbl_chat".tr,
          //           ),
          //         ),
          //         Tab(
          //           child: Text(
          //             "lbl_call".tr,
          //           ),
          //         ),
          //       ],
          //     ),
          //   ],
          // ),
          Expanded(
            child: SizedBox(
              child:

              PageView.builder(
                onPageChanged: (value) {
                  pageController.animateToPage(value,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.ease);
                  controller.currentTab = value;
                  controller.update();
                },
                controller: pageController,
                itemCount: pages.length,
                itemBuilder: (context, index) {
                return pages[index];
              },)
              // TabBarView(
              //
              //   controller: controller.tabviewController,
              //
              //   children: [
              //     ChatListPage(),
              //     CallListPage(),
              //   ],
              // ),
            ),
          ),
        ],
      ),
    );
  }

}
