import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_elearning_app/core/app_export.dart';
import 'package:flutter_elearning_app/widgets/app_bar/appbar_trailing_iconbutton.dart';
import 'package:flutter_elearning_app/widgets/app_bar/custom_app_bar.dart';
import 'package:flutter_elearning_app/widgets/custom_search_view.dart';

import '../../widgets/custom_icon_button.dart';
import '../categories_screen/controller/categories_controller.dart';
import '../categories_screen/models/categoriesgrid_item_model.dart';
import '../featured_course_screen/controller/featured_course_controller.dart';
import '../featured_course_screen/models/favoritegrid_item_model.dart';
import '../featured_course_screen/widgets/favoritegrid_item_widget.dart';
import '../popular_courses_screen/controller/popular_courses_controller.dart';
import '../popular_courses_screen/models/learnnewskillslist_item_model.dart';
import '../popular_courses_screen/widgets/learnnewskillslist_item_widget.dart';
import '../popular_instructor_screen/controller/popular_instructor_controller.dart';
import '../popular_instructor_screen/models/ronaldrichards_item_model.dart';
import 'controller/home_screen_controller.dart';
import 'models/home_screen_model.dart';
import 'models/slidre_model.dart';

// ignore_for_file: must_be_immutable
class HomeScreenPage extends StatefulWidget {
  HomeScreenPage({Key? key}) : super(key: key);

  @override
  State<HomeScreenPage> createState() => _HomeScreenPageState();
}

class _HomeScreenPageState extends State<HomeScreenPage> {
  HomeScreenController controller =
      Get.put(HomeScreenController(HomeScreenModel().obs));
  CategoriesController categoriesController = Get.put(CategoriesController());
  FeaturedCourseController featuredCourseController =
      Get.put(FeaturedCourseController());
  PopularInstructorController popularInstructorController =
      Get.put(PopularInstructorController());
  PopularCoursesController popularCoursesController = Get.put(PopularCoursesController());

  @override
  Widget build(BuildContext context) {

    mediaQueryData = MediaQuery.of(context);
    double margin = 16.h;
    int crossCount = 4;

    double width = (MediaQuery.of(context).size.width - (margin * crossCount)) / crossCount;
    double height = 105.v;
    return Column(
      children: [
        _buildAppBar(),
        Padding(
            padding: EdgeInsets.only(right: 16.h, left: 16.h),
            child: CustomSearchView(
              onTap: (){
                Get.toNamed(AppRoutes.searchScreen);
              },
                textInputType: TextInputType.none,
                controller: controller.searchController,
                hintText: "lbl_search".tr)),
        SizedBox(height: 16.h),
       Expanded(
         child: Container(
           child: ListView(
             children: [

               CarouselSlider.builder(
                   options: CarouselOptions(
                     height: 134.v,
                     initialPage: 0,
                     autoPlay: true,
                     viewportFraction: 1.0,
                     enableInfiniteScroll: false,
                     scrollDirection: Axis.horizontal,
                   ),
                   itemCount: 3,
                   itemBuilder: (context, index, realIndex) {
                     SliderData model = controller.sliderData[index];
                     return Padding(
                       padding: EdgeInsets.only(left: 20.h, right: 20.h),
                       child: Container(
                         height: 134.v,
                         width: double.infinity,
                         decoration: BoxDecoration(
                             borderRadius: BorderRadius.circular(8.h),
                             image: DecorationImage(
                                 image: AssetImage(model.image!), fit: BoxFit.fill)),
                         child: Padding(
                           padding: EdgeInsets.only(left: 24.h, right: 24.h),
                           child: Column(
                             crossAxisAlignment: CrossAxisAlignment.start,
                             mainAxisAlignment: MainAxisAlignment.center,
                             children: [
                               Container(
                                 width: 168.h,
                                 child: Text(model.title!,
                                     maxLines: 2,
                                     overflow: TextOverflow.ellipsis,
                                     textAlign: TextAlign.left,
                                     style: theme.textTheme.titleMedium!
                                         .copyWith(height: 1.50,
                                     color: Colors.black)),
                               ),
                               SizedBox(
                                 height: 16.v,
                               ),
                               GestureDetector(
                                 onTap: () {},
                                 child: Row(
                                   children: [
                                     Text("lbl_book_now".tr,
                                         style: CustomTextStyles.titleMediumMonaSans),
                                     CustomImageView(
                                         imagePath: ImageConstant.imgIcArrowRight,
                                         height: 20.adaptSize,
                                         width: 20.adaptSize,
                                         margin: EdgeInsets.only(left: 4.h))
                                   ],
                                 ),
                               )
                             ],
                           ),
                         ),
                       ),
                     );
                   }),
               SizedBox(height: 20.v),
               Padding(
                 padding: EdgeInsets.symmetric(horizontal: 16.h),
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     Text("lbl_categories".tr, style: theme.textTheme.titleMedium!),
                     GestureDetector(
                         onTap: () {
                           onTapTxtViewAll();
                         },
                         child: Padding(
                             padding: EdgeInsets.only(bottom: 3.v),
                             child: Text("lbl_view_all".tr,
                                 style: CustomTextStyles.bodyMediumOnPrimary
                                     .copyWith(color: appTheme.viewAllButtonColor))))
                   ],
                 ),
               ),

               GridView.count(
                 primary: false,
                 shrinkWrap: true,
                 padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 16.h),
                 crossAxisCount: crossCount,
                 crossAxisSpacing: margin,
                 mainAxisSpacing: margin,
                 childAspectRatio: width / height,
                 children: List.generate(categoriesController.categories.length > 4
                     ? 4
                     : categoriesController.categories.length, (index) {
                   CategoriesgridItemModel data =
                   categoriesController.categories[index];
                       return Container(
                         padding: EdgeInsets.symmetric(
                           horizontal: 8.h,
                           vertical: 0.v,
                         ),
                         decoration: AppDecoration.fillIndigo.copyWith(
                           color: data.bgColor,
                           borderRadius: BorderRadiusStyle.roundedBorder12,
                         ),
                         child: Column(
                           crossAxisAlignment: CrossAxisAlignment.center,
                           mainAxisAlignment: MainAxisAlignment.center,
                           children: [
                             CustomIconButton(
                               height: 47.adaptSize,
                               width: 47.adaptSize,
                               padding: EdgeInsets.all(11.h),
                               decoration: IconButtonStyleHelper.fillWhiteATL27,
                               child: CustomImageView(
                                 imagePath: data.icon!,
                               ),
                             ),
                             SizedBox(height: 7.v),
                             Text(
                               data.title!,
                               style: TextStyle(
                                 color: Colors.black,
                                 fontSize: 14.fSize,
                                 fontFamily: 'SF Pro Display',
                                 fontWeight: FontWeight.w600,
                               ),
                             ),
                           ],
                         ),
                       );
                     }),
               ),

               // GridView.count(
               //   padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 16.h),
               //   primary: false,
               //   shrinkWrap: true,
               //   itemCount: categoriesController.categories.length > 4
               //       ? 4
               //       : categoriesController.categories.length,
               //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
               //       mainAxisExtent: 105.v,
               //       crossAxisCount: 4,
               //       mainAxisSpacing: 16.h,
               //       crossAxisSpacing: 16.h),
               //   itemBuilder: (context, index) {
               //     CategoriesgridItemModel data =
               //     categoriesController.categories[index];
               //     return Container(
               //       padding: EdgeInsets.symmetric(
               //         horizontal: 8.h,
               //         vertical: 16.v,
               //       ),
               //       decoration: AppDecoration.fillIndigo.copyWith(
               //         color: data.bgColor,
               //         borderRadius: BorderRadiusStyle.roundedBorder12,
               //       ),
               //       child: Column(
               //         crossAxisAlignment: CrossAxisAlignment.center,
               //         mainAxisAlignment: MainAxisAlignment.center,
               //         children: [
               //           CustomIconButton(
               //             height: 47.adaptSize,
               //             width: 47.adaptSize,
               //             padding: EdgeInsets.all(11.h),
               //             decoration: IconButtonStyleHelper.fillWhiteATL27,
               //             child: CustomImageView(
               //               imagePath: data.icon!,
               //             ),
               //           ),
               //           SizedBox(height: 7.v),
               //           Text(
               //             data.title!,
               //             style: TextStyle(
               //               color: Colors.black,
               //               fontSize: 14.fSize,
               //               fontFamily: 'SF Pro Display',
               //               fontWeight: FontWeight.w600,
               //             ),
               //           ),
               //         ],
               //       ),
               //     );
               //   },
               // ),
               Padding(
                 padding: EdgeInsets.symmetric(horizontal: 16.h),
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     Text("msg_featured_courses".tr,
                         style: theme.textTheme.titleMedium!),
                     GestureDetector(
                       onTap: () {
                         onTapTxtViewAll1();
                       },
                       child: Padding(
                           padding: EdgeInsets.only(bottom: 3.v),
                           child: Text("lbl_view_all".tr,
                               style: CustomTextStyles.bodyMediumOnPrimary
                                   .copyWith(color: appTheme.viewAllButtonColor))),
                     )
                   ],
                 ),
               ),
               SizedBox(height: 16.v),
               Padding(
                   padding: EdgeInsets.symmetric(horizontal: 16.h),
                   child: GridView.builder(
                       shrinkWrap: true,
                       primary: false,
                       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                           mainAxisExtent: 240.v,
                           crossAxisCount: 2,
                           mainAxisSpacing: 16.h,
                           crossAxisSpacing: 16.h),
                       physics: BouncingScrollPhysics(),
                       itemCount:
                       featuredCourseController.featuredCourceList.length > 2
                           ? 2
                           : featuredCourseController.featuredCourceList.length,
                       itemBuilder: (context, index) {
                         FavoritegridItemModel model =
                         featuredCourseController.featuredCourceList[index];
                         return animationfunction(
                             index,
                             FavoritegridItemWidget(model, onTapFund: () {
                               Get.toNamed(AppRoutes.courseDetailsAboutScreen);
                             }));
                       })),
               SizedBox(height: 16.v),
               Padding(
                 padding: EdgeInsets.symmetric(horizontal: 16.h),
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     Text("msg_popular_instructors".tr,
                         style: theme.textTheme.titleMedium!),
                     GestureDetector(
                       onTap: () {
                         Get.toNamed(AppRoutes.popularInstructorScreen);
                       },
                       child: Padding(
                           padding: EdgeInsets.only(bottom: 3.v),
                           child: Text("lbl_view_all".tr,
                               style: CustomTextStyles.bodyMediumOnPrimary
                                   .copyWith(color: appTheme.viewAllButtonColor))),
                     )
                   ],
                 ),
               ),
               SingleChildScrollView(
                 scrollDirection: Axis.horizontal,
                 child: Padding(
                   padding:  EdgeInsets.symmetric(horizontal: 8.h,vertical: 16.v),
                   child: Row(
                     children: List.generate(
                         popularInstructorController.populerInstructor.length > 3
                             ? 3
                             : popularInstructorController.populerInstructor.length,
                             (index) {
                           RonaldrichardsItemModel data = popularInstructorController.populerInstructor[index];
                           return animationfunction(index, Padding(
                             padding:  EdgeInsets.only(left: 8.h,right: 8.h),
                             child: GestureDetector(
                               onTap: (){
                                 Get.toNamed(AppRoutes.instructorDetailsScreen);
                               },
                               child: Container(
                                 height: 65.v,
                                 width: 173.h,
                                 decoration: AppDecoration.fillGray.copyWith(
                                   borderRadius: BorderRadiusStyle.roundedBorder12,
                                 ),
                                 child: Padding(
                                   padding:  EdgeInsets.all(12.h),
                                   child: Row(
                                     crossAxisAlignment: CrossAxisAlignment.center,
                                     children: [
                                       CustomImageView(
                                         height: 39.adaptSize,
                                         width: 39.adaptSize,
                                         imagePath: data.userImage!,

                                       ),
                                       SizedBox(width: 6.h),
                                       Expanded(
                                         child: Column(
                                           crossAxisAlignment: CrossAxisAlignment.start,
                                           children: [
                                             Text(
                                               data.userName!,
                                               style: theme.textTheme.titleSmall!.copyWith(
                                                 color: appTheme.black900,
                                               ),
                                             ),
                                             SizedBox(height: 4.v),
                                             Expanded(
                                               child: Text(
                                                   data.userType!,
                                                   style: theme.textTheme.bodySmall!.copyWith(
                                                     color: appTheme.black900,
                                                   )
                                               ),
                                             ),
                                           ],
                                         ),
                                       )
                                     ],
                                   ),
                                 ),
                               ),
                             ),
                           ));
                         }),
                   ),
                 ),
               ),
               Padding(
                 padding: EdgeInsets.symmetric(horizontal: 16.h),
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     Text("lbl_popular_courses".tr,
                         style: theme.textTheme.titleMedium!),
                     GestureDetector(
                       onTap: () {
                         onTapTxtViewAll2();
                       },
                       child: Padding(
                           padding: EdgeInsets.only(bottom: 3.v),
                           child: Text("lbl_view_all".tr,
                               style: CustomTextStyles.bodyMediumOnPrimary
                                   .copyWith(color: appTheme.viewAllButtonColor))),
                     )
                   ],
                 ),
               ),
               ListView.builder(
                 padding: EdgeInsets.symmetric(horizontal: 16.h,vertical: 8.v),
                   physics: NeverScrollableScrollPhysics(),
                 primary: false,
                   shrinkWrap: true,
                   itemCount: popularCoursesController.getPopulerCource.length>2?2:popularCoursesController.getPopulerCource.length,
                   itemBuilder: (context, index) {
                     LearnnewskillslistItemModel model = popularCoursesController
                         .getPopulerCource[index];
                     return animationfunction(index, Padding(
                       padding:  EdgeInsets.symmetric(vertical: 8.v),
                       child: LearnnewskillslistItemWidget(model),
                     ));
                   })
             ],
           ),
         ),
       )
      ],
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar() {
    return CustomAppBar(
        height: 99.v,
        title: Container(

            margin: EdgeInsets.only(left: 16.h),
            child: RichText(
                text: TextSpan(children: [
                  TextSpan(
                      text: "lbl_welcome_back".tr,
                      style: theme.textTheme.titleMedium),
                  TextSpan(text: " \n".tr, style: theme.textTheme.bodyLarge),
                  TextSpan(
                      text: "msg_ronald_richards".tr,
                      style: theme.textTheme.titleLarge)
                ]),
                textAlign: TextAlign.left)),
        actions: [
          AppbarTrailingIconbutton(
            onTap: ()
            {
              Get.toNamed(AppRoutes.notificationsScreen);
            },
              imagePath: ImageConstant.imgLock,
              margin: EdgeInsets.fromLTRB(16.h, 9.v, 16.h, 26.v))
        ]);
  }







  /// Navigates to the courseDetailsAboutScreen when the action is triggered.
  onTapUserProfile() {
    Get.toNamed(AppRoutes.courseDetailsAboutScreen);
  }

  /// Navigates to the categoriesScreen when the action is triggered.
  onTapTxtViewAll() {
    Get.toNamed(
      AppRoutes.categoriesScreen,
    );
  }

  /// Navigates to the featuredCourseScreen when the action is triggered.
  onTapTxtViewAll1() {
    Get.toNamed(
      AppRoutes.featuredCourseScreen,
    );
  }

  /// Navigates to the popularCoursesScreen when the action is triggered.
  onTapTxtViewAll2() {
    Get.toNamed(
      AppRoutes.popularCoursesScreen,
    );
  }
}
