import 'package:carousel_slider/carousel_slider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_elearning_app/core/app_export.dart';
import 'package:flutter_elearning_app/widgets/app_bar/appbar_trailing_iconbutton.dart';
import 'package:flutter_elearning_app/widgets/app_bar/custom_app_bar.dart';
import 'package:flutter_elearning_app/widgets/custom_search_view.dart';
import '../../widgets/custom_icon_button.dart';
import '../categories_screen/controller/categories_controller.dart';
import '../featured_course_screen/controller/featured_course_controller.dart';
import '../featured_course_screen/models/favoritegrid_item_model.dart';
import '../featured_course_screen/widgets/favoritegrid_item_widget.dart';
import '../popular_courses_screen/controller/popular_courses_controller.dart';
import '../popular_courses_screen/models/learnnewskillslist_item_model.dart';
import '../popular_courses_screen/widgets/learnnewskillslist_item_widget.dart';
import '../popular_instructor_screen/controller/popular_instructor_controller.dart';
import 'controller/home_screen_controller.dart';
import 'models/home_screen_model.dart';
import 'package:flutter_elearning_app/services/auth_service.dart';
import 'package:flutter_elearning_app/services/ad_service.dart';
import 'package:flutter_elearning_app/widgets/banner_ad_widget.dart';

class HomeScreenPage extends StatefulWidget {
  HomeScreenPage({Key? key}) : super(key: key);
  @override
  State<HomeScreenPage> createState() => _HomeScreenPageState();
}

class _HomeScreenPageState extends State<HomeScreenPage> {
  HomeScreenController controller = Get.put(HomeScreenController(HomeScreenModel().obs));
  CategoriesController categoriesController = Get.put(CategoriesController());
  FeaturedCourseController featuredCourseController = Get.put(FeaturedCourseController());
  PopularInstructorController popularInstructorController = Get.put(PopularInstructorController());
  PopularCoursesController popularCoursesController = Get.put(PopularCoursesController());

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return Obx(() {
      if (controller.isLoading.value) return Scaffold(body: Center(child: CircularProgressIndicator()));
      return Scaffold(
        backgroundColor: appTheme.bgColor,
        body: SafeArea(
          child: Column(children: [
            _buildAppBar(),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.h),
                child: CustomSearchView(
                    onTap: () => Get.toNamed(AppRoutes.searchScreen),
                    textInputType: TextInputType.none,
                    controller: controller.searchController,
                    hintText: "lbl_search".tr)),
            SizedBox(height: 16.h),
            Expanded(child: ListView(children: [
              _buildBanners(),
              SizedBox(height: 10.v),
              BannerAdWidget(),
              SizedBox(height: 10.v),
              _buildSectionHeader("lbl_categories".tr, onTapTxtViewAll),
              _buildCategoriesGrid(),
              _buildSectionHeader("msg_featured_courses".tr, onTapTxtViewAll1),
              _buildFeaturedGrid(),
              _buildSectionHeader("msg_popular_instructors".tr, () => Get.toNamed(AppRoutes.popularInstructorScreen)),
              _buildInstructorsRow(),
              _buildSectionHeader("lbl_popular_courses".tr, onTapTxtViewAll2),
              _buildPopularList(),
              SizedBox(height: 20.v),
            ]))
          ]),
        ),
      );
    });
  }

  Widget _buildAppBar() {
    return CustomAppBar(
        height: 99.v,
        title: Container(
            margin: EdgeInsets.only(left: 16.h),
            child: RichText(
                text: TextSpan(children: [
                  TextSpan(text: "lbl_welcome_back".tr, style: theme.textTheme.titleMedium),
                  TextSpan(text: " \n".tr, style: theme.textTheme.bodyLarge),
                  TextSpan(text: Get.find<AuthService>().currentUser.value?.name ?? "Student", style: theme.textTheme.titleLarge)
                ]),
                textAlign: TextAlign.left)),
        actions: [
          AppbarTrailingIconbutton(
              onTap: () => Get.toNamed(AppRoutes.notificationsScreen),
              imagePath: ImageConstant.imgLock,
              margin: EdgeInsets.fromLTRB(16.h, 9.v, 16.h, 26.v))
        ]);
  }

  Widget _buildBanners() {
    return CarouselSlider.builder(
        options: CarouselOptions(height: 134.v, autoPlay: true, viewportFraction: 1.0, enableInfiniteScroll: false),
        itemCount: controller.banners.length,
        itemBuilder: (context, index, realIndex) {
          var model = controller.banners[index];
          return Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.h),
              child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.h),
                      image: DecorationImage(image: CachedNetworkImageProvider(model.imageUrl!), fit: BoxFit.fill)),
                  child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.h),
                      child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.center, children: [
                        Container(width: 168.h, child: Text(model.title!, maxLines: 2, style: theme.textTheme.titleMedium!.copyWith(color: Colors.black))),
                        SizedBox(height: 16.v),
                        Row(children: [
                          Text("lbl_book_now".tr, style: CustomTextStyles.titleMediumMonaSans),
                          CustomImageView(imagePath: ImageConstant.imgIcArrowRight, height: 20.adaptSize, width: 20.adaptSize, margin: EdgeInsets.only(left: 4.h))
                        ])
                      ]))));
        });
  }

  Widget _buildSectionHeader(String title, VoidCallback onTap) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.h),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(title, style: theme.textTheme.titleMedium),
          GestureDetector(onTap: onTap, child: Text("lbl_view_all".tr, style: CustomTextStyles.bodyMediumOnPrimary.copyWith(color: appTheme.viewAllButtonColor)))
        ]));
  }

  Widget _buildCategoriesGrid() {
    return GridView.count(
        primary: false, shrinkWrap: true, crossAxisCount: 4, crossAxisSpacing: 16.h, mainAxisSpacing: 16.h,
        padding: EdgeInsets.all(16.h),
        childAspectRatio: 0.8,
        children: List.generate(controller.categories.length > 4 ? 4 : controller.categories.length, (index) {
          var data = controller.categories[index];
          return Container(
              padding: EdgeInsets.symmetric(horizontal: 8.h, vertical: 0.v),
              decoration: AppDecoration.fillIndigo.copyWith(
                  color: Color(int.parse(data.colorHex!.replaceFirst('#', '0xff'))),
                  borderRadius: BorderRadiusStyle.roundedBorder12),
              child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                CustomIconButton(height: 47.adaptSize, width: 47.adaptSize, padding: EdgeInsets.all(11.h), decoration: IconButtonStyleHelper.fillWhiteATL27, child: CustomImageView(imagePath: data.icon!)),
                SizedBox(height: 7.v),
                Text(data.title!, style: TextStyle(color: Colors.black, fontSize: 14.fSize, fontWeight: FontWeight.w600))
              ]));
        }));
  }

  Widget _buildFeaturedGrid() {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.h),
        child: GridView.builder(
            shrinkWrap: true, primary: false,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(mainAxisExtent: 240.v, crossAxisCount: 2, mainAxisSpacing: 16.h, crossAxisSpacing: 16.h),
            itemCount: controller.featuredCourses.length > 2 ? 2 : controller.featuredCourses.length,
            itemBuilder: (context, index) {
              var model = controller.featuredCourses[index];
              return FavoritegridItemWidget(
                  FavoritegridItemModel(model.thumbnailUrl, model.title, model.instructorImage, model.instructorName, model.category, "${model.currency} ${model.price}", false),
                  onTapFund: () {
                    Get.find<AdService>().showInterstitialAd(onAdDismissed: () {
                      Get.toNamed(AppRoutes.courseDetailsAboutScreen, arguments: model);
                    });
                  });
            }));
  }

  Widget _buildInstructorsRow() {
    return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 8.h, vertical: 16.v),
        child: Row(children: controller.instructors.map((inst) => Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.h),
            child: GestureDetector(
              onTap: () => Get.toNamed(AppRoutes.instructorDetailsScreen),
              child: Container(
                  height: 65.v, width: 173.h,
                  decoration: AppDecoration.fillGray.copyWith(borderRadius: BorderRadiusStyle.roundedBorder12),
                  padding: EdgeInsets.all(12.h),
                  child: Row(children: [
                      CustomImageView(imagePath: inst.image, height: 39.adaptSize, width: 39.adaptSize, radius: BorderRadius.circular(20.h)),
                      SizedBox(width: 6.h),
                      Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                          Text(inst.name!, style: theme.textTheme.titleSmall, overflow: TextOverflow.ellipsis),
                          Text(inst.role!, style: theme.textTheme.bodySmall, overflow: TextOverflow.ellipsis)
                      ]))
                  ])),
            )
        )).toList()));
  }

  Widget _buildPopularList() {
    return ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 8.v),
        physics: NeverScrollableScrollPhysics(), shrinkWrap: true,
        itemCount: controller.popularCourses.length > 2 ? 2 : controller.popularCourses.length,
        itemBuilder: (context, index) {
          var model = controller.popularCourses[index];
          return Padding(
              padding: EdgeInsets.symmetric(vertical: 8.v),
              child: LearnnewskillslistItemWidget(
                LearnnewskillslistItemModel(
                  model.thumbnailUrl,
                  model.title,
                  model.instructorImage,
                  model.instructorName,
                  model.category,
                  "${model.currency} ${model.price}",
                ),
                course: model,
              ));
        });
  }

  onTapUserProfile() { Get.toNamed(AppRoutes.courseDetailsAboutScreen); }
  onTapTxtViewAll() { Get.toNamed(AppRoutes.categoriesScreen); }
  onTapTxtViewAll1() { Get.toNamed(AppRoutes.featuredCourseScreen); }
  onTapTxtViewAll2() { Get.toNamed(AppRoutes.popularCoursesScreen); }
}
