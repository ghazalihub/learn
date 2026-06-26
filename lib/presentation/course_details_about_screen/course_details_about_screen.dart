import 'package:flutter/material.dart';
import 'package:flutter_elearning_app/data/models/course_model.dart';
import 'package:flutter_elearning_app/presentation/cart_screen/controller/cart_controller.dart';
import 'package:flutter_elearning_app/widgets/custom_icon_button.dart';
import 'package:flutter_elearning_app/core/app_export.dart';
import 'package:flutter_elearning_app/widgets/custom_elevated_button.dart';
import 'package:flutter_elearning_app/widgets/custom_rating_bar.dart';
import '../customer_reviews_screen/controller/customer_reviews_controller.dart';
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
  bool blockScroll = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return PopScope(
      canPop: true,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) return;
        Get.back();
      },
      child: Scaffold(
        backgroundColor: appTheme.bgColor,
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: SizedBox(
            width: double.maxFinite,
            child: GetBuilder<CourseDetailsAboutController>(
              init: CourseDetailsAboutController(),
              builder: (controller) => Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                Expanded(
                  child: CustomScrollView(
                    shrinkWrap: true,
                    primary: true,
                    physics: blockScroll ? NeverScrollableScrollPhysics() : BouncingScrollPhysics(),
                    slivers: [
                      SliverAppBar(
                        toolbarHeight: 52.v,
                        backgroundColor: Colors.transparent,
                        expandedHeight: 420.v,
                        leadingWidth: 52.h,
                        leading: Padding(
                          padding: EdgeInsets.only(left: 16.h, top: 16.v),
                          child: Container(
                            height: 36.v,
                            width: 36.v,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.h),
                              color: appTheme.iconButtonbgColor.withValues(alpha: 0.7),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(7.v),
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
                        centerTitle: true,
                        actions: [
                          Padding(
                            padding: EdgeInsets.only(right: 16.h, top: 16.v),
                            child: Container(
                              height: 36.v,
                              width: 36.v,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.h),
                                color: appTheme.iconButtonbgColor.withValues(alpha: 0.7),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(7.v),
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
                            child: Stack(
                              children: [
                                PageView.builder(
                                  onPageChanged: (value) {
                                    controller.currentPage = value;
                                    controller.update();
                                  },
                                  controller: pageController,
                                  itemCount: controller.courseModel.value?.thumbnailUrl != null ? 1 : 0,
                                  itemBuilder: (context, index) {
                                    return CustomImageView(
                                      imagePath: controller.courseModel.value?.thumbnailUrl ?? ImageConstant.imgRectangle4429,
                                      height: double.infinity,
                                      width: double.infinity,
                                      radius: BorderRadius.circular(12.h),
                                      fit: BoxFit.fill,
                                    );
                                  },
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 16.h, bottom: 16.v),
                                  child: Align(
                                    alignment: Alignment.bottomLeft,
                                    child: Container(
                                      height: 36.v,
                                      width: 68.h,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(24.h),
                                        color: appTheme.iconButtonbgColor.withValues(alpha: 0.7),
                                      ),
                                      child: Center(
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text(
                                              "${controller.currentPage + 1} / ",
                                              style: TextStyle(fontSize: 14.fSize, fontWeight: FontWeight.w400, color: appTheme.black900),
                                            ),
                                            Text(
                                              "1",
                                              style: TextStyle(fontSize: 14.fSize, fontWeight: FontWeight.w400, color: appTheme.black900),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      SliverList(
                        delegate: SliverChildListDelegate([
                          SafeArea(
                            child: ListView(
                              primary: false,
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              children: [
                                SizedBox(height: 16.v),
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
                                            child: Text(controller.courseModel.value?.title ?? "", style: CustomTextStyles.titleLarge20),
                                          ),
                                          SizedBox(height: 11.v),
                                          Padding(
                                            padding: EdgeInsets.only(left: 16.h),
                                            child: Text("${controller.courseModel.value?.currency ?? ""}${controller.courseModel.value?.price ?? ""}",
                                                style: CustomTextStyles.titleMedium16),
                                          ),
                                          SizedBox(height: 11.v),
                                          if (controller.courseModel.value?.validityDays != null)
                                            Padding(
                                              padding: EdgeInsets.only(left: 16.h, bottom: 11.v),
                                              child: Text("Validity: ${controller.courseModel.value!.validityDays} days",
                                                  style: theme.textTheme.bodyMedium),
                                            ),
                                          Padding(
                                            padding: EdgeInsets.only(left: 16.h),
                                            child: Row(children: [
                                              CustomImageView(
                                                imagePath: ImageConstant.imgStar,
                                                height: 14.adaptSize,
                                                width: 14.adaptSize,
                                                margin: EdgeInsets.only(bottom: 2.v),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.only(left: 4.h),
                                                child: Text(controller.courseModel.value?.rating?.toString() ?? "0.0",
                                                    style: CustomTextStyles.bodyMediumOnPrimary),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.only(left: 4.h),
                                                child: Text("(${controller.courseModel.value?.reviewCount ?? 0} reviews)",
                                                    style: CustomTextStyles.bodyMediumOnPrimary),
                                              )
                                            ]),
                                          ),
                                          SizedBox(height: 20.v),
                                          Padding(
                                            padding: EdgeInsets.only(left: 16.h),
                                            child: Text("lbl_about_course".tr, style: theme.textTheme.titleMedium),
                                          ),
                                          SizedBox(height: 12.v),
                                          Align(
                                            alignment: Alignment.center,
                                            child: Container(
                                              width: 396.h,
                                              margin: EdgeInsets.symmetric(horizontal: 16.h),
                                              child: Text(controller.courseModel.value?.description ?? "",
                                                  maxLines: 8, overflow: TextOverflow.ellipsis, style: theme.textTheme.bodyLarge!.copyWith(height: 1.50)),
                                            ),
                                          ),
                                          SizedBox(height: 16.v),
                                          Padding(
                                            padding: EdgeInsets.only(left: 16.h),
                                            child: Text("lbl_mentor".tr, style: theme.textTheme.titleMedium),
                                          ),
                                          SizedBox(height: 10.v),
                                          Padding(
                                            padding: EdgeInsets.only(left: 16.h),
                                            child: Row(children: [
                                              CustomImageView(
                                                imagePath: controller.courseModel.value?.instructorImage ?? ImageConstant.imgEllipse204948x48,
                                                height: 48.adaptSize,
                                                width: 48.adaptSize,
                                                radius: BorderRadius.circular(24.h),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.only(left: 12.h, top: 2.v),
                                                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                                                  Text(controller.courseModel.value?.instructorName ?? "", style: CustomTextStyles.titleMedium16),
                                                  SizedBox(height: 8.v),
                                                  Text("Senior Instructor", style: CustomTextStyles.bodyMedium14)
                                                ]),
                                              )
                                            ]),
                                          ),
                                          SizedBox(height: 19.v),
                                          _buildTitleAndViewAll(),
                                          SizedBox(height: 18.v),
                                          _buildFrameRow(),
                                          SizedBox(height: 18.v),
                                          Padding(
                                            padding: EdgeInsets.symmetric(horizontal: 16.h),
                                            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                                              Text("${controller.courseModel.value?.lessons?.length ?? 0} lessons", style: theme.textTheme.titleMedium),
                                              GestureDetector(
                                                onTap: () {
                                                  Get.toNamed(AppRoutes.lessonsScreen, arguments: controller.courseModel.value);
                                                },
                                                child: Padding(
                                                  padding: EdgeInsets.only(bottom: 3.v),
                                                  child: Text("lbl_view_all".tr, style: CustomTextStyles.bodyMediumOnPrimary),
                                                ),
                                              )
                                            ]),
                                          ),
                                          SizedBox(height: 16.v),
                                          _buildLessonsList(controller),
                                          SizedBox(height: 16.v),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ]),
                      ),
                    ],
                  ),
                )
              ]),
            ),
          ),
        ),
        bottomNavigationBar: _buildEnrollNow(),
      ),
    );
  }

  Widget _buildTitleAndViewAll() {
    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.h),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text("msg_customer_reviews".tr, style: theme.textTheme.titleMedium),
          GestureDetector(
            onTap: () {
              onTapTxtViewAll();
            },
            child: Padding(
              padding: EdgeInsets.only(bottom: 3.v),
              child: Text("lbl_view_all".tr, style: CustomTextStyles.bodyMediumOnPrimary),
            ),
          )
        ]),
      ),
    );
  }

  Widget _buildFrameRow() {
    return SizedBox(
      height: 152.v,
      child: Obx(() => ListView.builder(
        itemCount: (courseDetailsAboutController.courseModel.value?.reviews?.length ?? 0) > 2 ? 2 : (courseDetailsAboutController.courseModel.value?.reviews?.length ?? 0),
        padding: EdgeInsets.symmetric(horizontal: 8.h),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          ReviewModel data = courseDetailsAboutController.courseModel.value!.reviews![index];
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.h),
            child: Container(
              decoration: AppDecoration.fillGray.copyWith(
                borderRadius: BorderRadiusStyle.roundedBorder12,
              ),
              width: 361.h,
              child: Column(mainAxisSize: MainAxisSize.min, mainAxisAlignment: MainAxisAlignment.center, children: [
                SizedBox(height: 2.v),
                Padding(
                  padding: EdgeInsets.only(left: 16.h),
                  child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                    CustomImageView(imagePath: data.userImage, height: 56.adaptSize, width: 56.adaptSize, radius: BorderRadius.circular(28.h)),
                    Padding(
                      padding: EdgeInsets.only(left: 17.h, top: 4.v, bottom: 3.v),
                      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                        Text(data.userName ?? "", style: theme.textTheme.titleMedium),
                        SizedBox(height: 8.v),
                        CustomRatingBar(color: appTheme.amber500, initialRating: data.rating ?? 5.0)
                      ]),
                    ),
                  ]),
                ),
                SizedBox(height: 18.v),
                Container(
                  width: 325.h,
                  margin: EdgeInsets.only(left: 16.h, right: 20.h),
                  child: Text(data.comment ?? "", maxLines: 2, overflow: TextOverflow.ellipsis, style: theme.textTheme.bodyLarge!.copyWith(height: 1.50)),
                )
              ]),
            ),
          );
        },
      )),
    );
  }

  Widget _buildLessonsList(CourseDetailsAboutController controller) {
    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.h),
        child: ListView.separated(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          separatorBuilder: (context, index) {
            return SizedBox(height: 16.v);
          },
          itemCount: (controller.courseModel.value?.lessons?.length ?? 0) > 2 ? 2 : (controller.courseModel.value?.lessons?.length ?? 0),
          itemBuilder: (context, index) {
            LessonModel lesson = controller.courseModel.value!.lessons![index];
            return GestureDetector(
              onTap: () {
                Get.toNamed(AppRoutes.videoScreen, arguments: lesson);
              },
              child: Container(
                padding: EdgeInsets.all(12.h),
                decoration: AppDecoration.fillGray.copyWith(
                  borderRadius: BorderRadiusStyle.roundedBorder12,
                ),
                child: Row(
                  children: [
                    CustomIconButton(
                      height: 40.adaptSize,
                      width: 40.adaptSize,
                      padding: EdgeInsets.all(10.h),
                      decoration: IconButtonStyleHelper.fillWhiteATL20,
                      child: CustomImageView(
                        imagePath: ImageConstant.imgPlay,
                      ),
                    ),
                    SizedBox(width: 12.h),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(lesson.title ?? "", style: theme.textTheme.titleSmall),
                          SizedBox(height: 4.v),
                          Text(lesson.duration ?? "", style: theme.textTheme.bodySmall),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildEnrollNow() {
    return CustomElevatedButton(
      text: "lbl_enroll_now".tr,
      margin: EdgeInsets.only(left: 16.h, right: 16.h, bottom: 40.v),
      onPressed: () {
        onTapEnrollNow();
      },
    );
  }

  onTapTxtViewAllText() {
    Get.toNamed(AppRoutes.lessonsScreen, arguments: courseDetailsAboutController.courseModel.value);
  }

  onTapArrowLeft() {
    Get.back();
  }

  onTapTxtViewAll() {
    Get.toNamed(AppRoutes.customerReviewsScreen, arguments: courseDetailsAboutController.courseModel.value);
  }

  onTapEnrollNow() {
    if (courseDetailsAboutController.courseModel.value != null) {
      CartController cartController = Get.find<CartController>();
      cartController.addToCart(courseDetailsAboutController.courseModel.value!);
      Get.toNamed(AppRoutes.cartScreen);
    }
  }
}
