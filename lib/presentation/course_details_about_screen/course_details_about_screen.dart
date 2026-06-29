// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_elearning_app/core/app_export.dart';
import 'package:flutter_elearning_app/widgets/custom_elevated_button.dart';
import 'package:flutter_elearning_app/widgets/custom_rating_bar.dart';
import 'package:flutter_elearning_app/data/models/course_model.dart';
import 'package:flutter_elearning_app/services/payment_service.dart';
import 'package:flutter_elearning_app/services/cart_service.dart';
import 'package:flutter_elearning_app/services/ad_service.dart';
import 'package:flutter_elearning_app/widgets/banner_ad_widget.dart';
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
  late CourseModel course;
  PageController pageController = PageController();
 CourseDetailsAboutController courseDetailsAboutController = Get.put(CourseDetailsAboutController());
  CustomerReviewsController customerReviewsController = Get.put(CustomerReviewsController());
  CourseDetailsController courseDetailsController = Get.put(CourseDetailsController());
 bool blockScroll = false;

 @override
  void initState() {
    course = Get.arguments as CourseModel;
    super.initState();
  }
 @override
 Widget build(BuildContext context) {
  mediaQueryData = MediaQuery.of(context);
  return PopScope(
   canPop: true,
   onPopInvokedWithResult: (didPop, result) {
    if (didPop) return;
    // Get.back();
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
                                        imagePath: course.thumbnailUrl,
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
                                                        child: Text(course.title!,
                                                            style: CustomTextStyles.titleLarge20)),
                                                    SizedBox(height: 11.v),
                                                    Padding(
                                                        padding: EdgeInsets.only(left: 16.h),
                                                        child: Row(
                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                          children: [
                                                            Text("${course.currency} ${course.price}",
                                                                style: CustomTextStyles.titleMedium16),
                                                            if (course.validityDays != null)
                                                              Padding(
                                                                padding: EdgeInsets.only(right: 16.h),
                                                                child: Text("Access: ${course.validityDays} Days",
                                                                    style: CustomTextStyles.bodyMediumOnPrimary),
                                                              ),
                                                          ],
                                                        )),
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
                                                              child: Text("4.0",
                                                                  style: CustomTextStyles
                                                                      .bodyMediumOnPrimary)),
                                                          Padding(
                                                              padding: EdgeInsets.only(left: 4.h),
                                                              child: Text("4.2k reviews",
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
                                                            child: Text(course.description!,
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
                                                              course.instructorImage,
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
                                                                    Text(course.instructorName!,
                                                                        style: CustomTextStyles
                                                                            .titleMedium16),
                                                                    SizedBox(height: 8.v),
                                                                    Text(
                                                                        course.category!,
                                                                        style: CustomTextStyles
                                                                            .bodyMedium14)
                                                                  ]))
                                                        ])),
                                                    SizedBox(height: 19.v),
                                                    _buildTitleAndViewAll(),
                                                    SizedBox(height: 18.v),
                                                    _buildFrameRow(),
                                                    SizedBox(height: 18.v),
                                                    BannerAdWidget(),
                                                    SizedBox(height: 18.v),
                                                    Padding(
                                                        padding: EdgeInsets.symmetric(horizontal: 16.h),
                                                        child: Row(
                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                            children: [
                                                              Text("${course.lessons?.length ?? 0} lessons",
                                                                  style: theme.textTheme.titleMedium),
                                                              GestureDetector(
                                                                  onTap: () {
                                                                   Get.toNamed(AppRoutes.lessonsScreen, arguments: course);
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
              (course.lessons?.length ?? 0) > 2 ? 2 : (course.lessons?.length ?? 0),
              itemBuilder: (context, index) {
                var lesson = course.lessons![index];
                return WidgetItemWidget(WidgetItemModel(lesson.title, lesson.duration, false, index + 1, videoUrl: lesson.youtubeUrl));
              })));
 }

 /// Section Widget
 Widget _buildEnrollNow() {
  return CustomElevatedButton(
      text: (course.isFree ?? true) ? "lbl_enroll_now".tr : "lbl_enroll_now".tr + " (${course.currency} ${course.price})",
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
    if (course.isFree ?? true) {
      Get.find<CartService>().enroll(course).then((_) {
        Get.toNamed(AppRoutes.bookSuccessScreen);
      });
    } else {
      Get.defaultDialog(
        title: "Unlock Course",
        middleText: "Would you like to buy this course or watch a short video to get a discount?",
        actions: [
          TextButton(onPressed: () {
            Get.back();
            Get.find<PaymentService>().buyCourse(course).then((_) {
              Get.toNamed(AppRoutes.bookSuccessScreen);
            });
          }, child: Text("Buy Now")),
          TextButton(onPressed: () {
            Get.back();
            Get.find<AdService>().showRewardedAd(onUserEarnedReward: (ad, reward) {
              Get.snackbar("Reward", "You earned a discount! Proceeding to enroll...");
              Get.find<CartService>().enroll(course).then((_) {
                Get.toNamed(AppRoutes.bookSuccessScreen);
              });
            });
          }, child: Text("Watch Ad")),
        ]
      );
    }
 }
}
