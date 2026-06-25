// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_elearning_app/core/app_export.dart';
import 'package:flutter_elearning_app/widgets/custom_elevated_button.dart';
import 'package:flutter_elearning_app/widgets/custom_rating_bar.dart';
import '../course_details_screen/controller/course_details_controller.dart';
import '../course_details_screen/models/widget_item_model.dart';
import '../course_details_screen/widgets/widget_item_widget.dart';
import '../customer_reviews_screen/controller/customer_reviews_controller.dart';
import '../customer_reviews_screen/models/userprofile_item_model.dart';
import 'controller/course_details_about_controller.dart';



class CourseDetailsAboutScreen extends StatefulWidget {
  const CourseDetailsAboutScreen({super.key});

  @override
  State<CourseDetailsAboutScreen> createState() => _CourseDetailsAboutScreenState();
}

class _CourseDetailsAboutScreenState extends State<CourseDetailsAboutScreen> {
  PageController pageController = PageController();
 CourseDetailsAboutController courseDetailsAboutController = Get.put(CourseDetailsAboutController());
  CustomerReviewsController customerReviewsController = Get.put(CustomerReviewsController());
  CourseDetailsController courseDetailsController = Get.put(CourseDetailsController());
 bool blockScroll = false;

 @override
  void initState() {
    // TODO: implement initState
   // setSafeAreaColor(color: Colors.transparent);
    super.initState();
  }
 @override
 Widget build(BuildContext context) {
  mediaQueryData = MediaQuery.of(context);
  return WillPopScope(
    onWillPop: ()async {
      Get.back();
      return true;
    },
    child: Scaffold(
     backgroundColor: appTheme.bgColor,
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: SizedBox(
              width: double.maxFinite,
              child:
              GetBuilder<CourseDetailsAboutController>(
                init: CourseDetailsAboutController(),
                builder:(controller) =>  Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                  Expanded(
                    child: CustomScrollView(
                      shrinkWrap: true,
                      primary: true,
                      physics: blockScroll
                          ? NeverScrollableScrollPhysics()
                          : BouncingScrollPhysics(),
                      slivers: [
                        SliverAppBar(
                          toolbarHeight:52.v,
                          backgroundColor: Colors.transparent,
                          expandedHeight:420.v,
                          leadingWidth: 52.h,
                          leading:  Padding(
                            padding:  EdgeInsets.only(left: 16.h,top: 16.v),
                            child: Container(
                              height: 36.v,
                              width: 36.v,
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.h),
                              color: appTheme.iconButtonbgColor.withOpacity(0.7),),
                              child: Padding(
                                padding:  EdgeInsets.all(7.v),
                                child: CustomImageView(
                                  color: appTheme.black900,
                                  onTap: () {
                                    Get.back();
                                  },
                                  imagePath: ImageConstant.imgArrowLeftOnprimary,
                                ),
                              ),
                            ),
                          ),




                          // AppbarTrailingIconbutton(
                          //     imagePath: ImageConstant.imgArrowLeftOnprimary,),
                          centerTitle: true,
                          // .marginOnly(
                          // top: 21.h, bottom: 13.h, left: 20.h),
                          actions: [
                            Padding(
                              padding:  EdgeInsets.only(right: 16.h,top: 16.v),
                              child: Container(
                                height: 36.v,
                                width: 36.v,
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.h),
                                  color: appTheme.iconButtonbgColor.withOpacity(0.7),),
                                child: Padding(
                                  padding:  EdgeInsets.all(7.v),
                                  child: CustomImageView(
                                    color: appTheme.black900,
                                    imagePath: ImageConstant.imgFavoriteOnprimary36x36,
                                  ),
                                ),
                              ),
                            ),
                          ],
                          flexibleSpace: FlexibleSpaceBar(
                            background: Container(
                              height: 428.v,
                              child:  Stack(
                                children: [
                                  PageView.builder(
                                    onPageChanged: (value) {
                                      controller.currentPage = value;
                                      controller.update();
                                    },
                                    controller: pageController,
                                    itemCount: 2,
                                    itemBuilder: (context, index) {
                                    return
                                      CustomImageView(
                                        imagePath: ImageConstant.imgRectangle4429,
                                        height: double.infinity,
                                        width: double.infinity,
                                        radius: BorderRadius.circular(12.h),
                                        fit: BoxFit.fill,);
                                  },),
                                  Padding(
                                    padding:  EdgeInsets.only(left: 16.h,bottom: 16.v),
                                    child: Align(
                                      alignment: Alignment.bottomLeft,
                                      child: Container(
                                        height: 36.v,
                                          width: 68.h,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(24.h),
                                          color: appTheme.iconButtonbgColor.withOpacity(0.7)
                                        ),
                                        child: Center(
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Text("${controller.currentPage + 1} / ",style: TextStyle(
                                                fontSize: 14.fSize,
                                                fontWeight: FontWeight.w400,
                                                color: appTheme.black900
                                              ),),
                                              Text("2",style: TextStyle(
                                                  fontSize: 14.fSize,
                                                  fontWeight: FontWeight.w400,
                                                  color: appTheme.black900
                                              ),),
                                            ],
                                          ),
                                        ),

                                      ),
                                    ),
                                  )
                                ],
                              )





                            ),
                          ),
                        ),
                        SliverList(
                          delegate: SliverChildListDelegate([
                            SafeArea(
                              child: ListView(

                                primary: false,
                                shrinkWrap: true,
                                physics:  NeverScrollableScrollPhysics(),
                                children: [
SizedBox(height: 16.v,),
                                  SizedBox(
                                      width: mediaQueryData.size.width,
                                      child: SingleChildScrollView(
                                          child: Padding(
                                              padding: EdgeInsets.only(bottom: 0.v),
                                              child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                        padding: EdgeInsets.only(left: 16.h),
                                                        child: Text("msg_how_to_become_an".tr,
                                                            style: CustomTextStyles.titleLarge20)),
                                                    SizedBox(height: 11.v),
                                                    Padding(
                                                        padding: EdgeInsets.only(left: 16.h),
                                                        child: Text("lbl_45_00".tr,
                                                            style: CustomTextStyles.titleMedium16)),
                                                    SizedBox(height: 11.v),
                                                    Padding(
                                                        padding: EdgeInsets.only(left: 16.h),
                                                        child: Row(children: [
                                                          CustomImageView(
                                                              imagePath: ImageConstant.imgStar,
                                                              height: 14.adaptSize,
                                                              width: 14.adaptSize,
                                                              margin: EdgeInsets.only(bottom: 2.v)),
                                                          Padding(
                                                              padding: EdgeInsets.only(left: 4.h),
                                                              child: Text("lbl_4_0".tr,
                                                                  style: CustomTextStyles
                                                                      .bodyMediumOnPrimary)),
                                                          Padding(
                                                              padding: EdgeInsets.only(left: 4.h),
                                                              child: Text("lbl_4_2k_reviews".tr,
                                                                  style: CustomTextStyles
                                                                      .bodyMediumOnPrimary))
                                                        ])),
                                                    SizedBox(height: 20.v),
                                                    Padding(
                                                        padding: EdgeInsets.only(left: 16.h),
                                                        child: Text("lbl_about_course".tr,
                                                            style: theme.textTheme.titleMedium)),
                                                    SizedBox(height: 12.v),
                                                    Align(
                                                        alignment: Alignment.center,
                                                        child: Container(
                                                            width: 396.h,
                                                            margin: EdgeInsets.symmetric(
                                                                horizontal: 16.h),
                                                            child: Text("msg_user_interface_ui".tr,
                                                                maxLines: 8,
                                                                overflow: TextOverflow.ellipsis,
                                                                style: theme.textTheme.bodyLarge!
                                                                    .copyWith(height: 1.50)))),
                                                    SizedBox(height: 16.v),
                                                    Padding(
                                                        padding: EdgeInsets.only(left: 16.h),
                                                        child: Text("lbl_mentor".tr,
                                                            style: theme.textTheme.titleMedium)),
                                                    SizedBox(height: 10.v),
                                                    Padding(
                                                        padding: EdgeInsets.only(left: 16.h),
                                                        child: Row(children: [
                                                          CustomImageView(
                                                              imagePath:
                                                              ImageConstant.imgEllipse204948x48,
                                                              height: 48.adaptSize,
                                                              width: 48.adaptSize,
                                                              radius: BorderRadius.circular(24.h)),
                                                          Padding(
                                                              padding: EdgeInsets.only(
                                                                  left: 12.h, top: 2.v),
                                                              child: Column(
                                                                  crossAxisAlignment:
                                                                  CrossAxisAlignment.start,
                                                                  children: [
                                                                    Text("msg_johnson_williams".tr,
                                                                        style: CustomTextStyles
                                                                            .titleMedium16),
                                                                    SizedBox(height: 8.v),
                                                                    Text(
                                                                        "msg_senior_ui_ux_designer"
                                                                            .tr,
                                                                        style: CustomTextStyles
                                                                            .bodyMedium14)
                                                                  ]))
                                                        ])),
                                                    SizedBox(height: 19.v),
                                                    _buildTitleAndViewAll(),
                                                    SizedBox(height: 18.v),
                                                    _buildFrameRow(),
                                                    SizedBox(height: 18.v),
                                                    Padding(
                                                        padding: EdgeInsets.symmetric(horizontal: 16.h),
                                                        child: Row(
                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                            children: [
                                                              Text("154 lessons",
                                                                  style: theme.textTheme.titleMedium),
                                                              GestureDetector(
                                                                  onTap: () {
                                                                   Get.toNamed(AppRoutes.lessonsScreen);
                                                                  },
                                                                  child: Padding(
                                                                      padding: EdgeInsets.only(bottom: 3.v),
                                                                      child: Text("lbl_view_all".tr,
                                                                          style: CustomTextStyles.bodyMediumOnPrimary)))
                                                            ])),
                                                    SizedBox(height: 16.v),
                                                    _buildLessonsList(),
                                                    SizedBox(height: 16.v),
                                                  ])))),
                                ],
                              ),
                            ),
                          ]),
                        ),
                      ],
                    ),
                  )
                ]),
              )),
        ),
        bottomNavigationBar: _buildEnrollNow()),
  );
 }


 /// Section Widget
 Widget _buildTitleAndViewAll() {
  return Align(
      alignment: Alignment.center,
      child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.h),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
               Text("msg_customer_reviews".tr,
                   style: theme.textTheme.titleMedium),
               GestureDetector(
                   onTap: () {
                    onTapTxtViewAll();
                   },
                   child: Padding(
                       padding: EdgeInsets.only(bottom: 3.v),
                       child: Text("lbl_view_all".tr,
                           style: CustomTextStyles.bodyMediumOnPrimary)))
              ])));
 }

 /// Section Widget
 Widget _buildFrameRow() {
  return SizedBox(
    height: 152.v,
    child: ListView.builder(
      itemCount: customerReviewsController.customerReviewList.length>2?2:customerReviewsController.customerReviewList.length,
      padding: EdgeInsets.symmetric(horizontal: 8.h),
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        UserprofileItemModel data = customerReviewsController.customerReviewList[index];
      return Padding(
        padding:  EdgeInsets.symmetric(horizontal: 8.h),
        child: Container(
          decoration: AppDecoration.fillGray.copyWith(
            borderRadius: BorderRadiusStyle.roundedBorder12,
          ),
          width: 361.h,
          child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 2.v),
                Padding(
                    padding: EdgeInsets.only(left: 16.h),
                    child: Row(
                        mainAxisAlignment:
                        MainAxisAlignment.start,
                        children: [
                          CustomImageView(
                              imagePath:
                              data.image,
                              height: 56.adaptSize,
                              width: 56.adaptSize,
                              radius:
                              BorderRadius.circular(28.h)),
                          Padding(
                              padding: EdgeInsets.only(
                                  left: 17.h,
                                  top: 4.v,
                                  bottom: 3.v),
                              child: Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Text(data.name!,
                                        style: theme.textTheme
                                            .titleMedium),
                                    SizedBox(height: 8.v),
                                    CustomRatingBar(
                                      color: appTheme.amber500,
                                        initialRating: 5)
                                  ])),
                        ])),
                SizedBox(height: 18.v),
                Container(
                    width: 325.h,
                    margin:
                    EdgeInsets.only(left: 16.h, right: 20.h),
                    child: Text(data.review!,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: theme.textTheme.bodyLarge!
                            .copyWith(height: 1.50)))
              ]),
        ),
      );
    },),
  );
 }

 /// Section Widget
 Widget _buildLessonsList() {
  return Align(
      alignment: Alignment.center,
      child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.h),
          child:  ListView.separated(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              separatorBuilder: (context, index) {
                return SizedBox(height: 16.v);
              },
              itemCount:
              courseDetailsController.lessonList.length>2?2:courseDetailsController.lessonList.length,
              itemBuilder: (context, index) {
                WidgetItemModel model = courseDetailsController.lessonList[index];
                return WidgetItemWidget(model);
              })));
 }

 /// Section Widget
 Widget _buildEnrollNow() {
  return CustomElevatedButton(
      text: "lbl_enroll_now".tr,
      margin: EdgeInsets.only(left: 16.h, right: 16.h, bottom: 40.v),
      onPressed: () {
       onTapEnrollNow();
      });
 }

 /// Navigates to the lessonsScreen when the action is triggered.
 onTapTxtViewAllText() {
  Get.toNamed(AppRoutes.lessonsScreen);
 }

 /// Navigates to the previous screen.
 onTapArrowLeft() {
  Get.back();
 }

 /// Navigates to the customerReviewsScreen when the action is triggered.
 onTapTxtViewAll() {
  Get.toNamed(
   AppRoutes.customerReviewsScreen,
  );
 }

 /// Navigates to the cartScreen when the action is triggered.
 onTapEnrollNow() {
  Get.toNamed(
   AppRoutes.cartScreen,
  );
 }
}



