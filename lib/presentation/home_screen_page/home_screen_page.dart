import 'package:carousel_slider/carousel_slider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_elearning_app/core/app_export.dart';
import 'package:flutter_elearning_app/widgets/app_bar/appbar_trailing_iconbutton.dart';
import 'package:flutter_elearning_app/widgets/app_bar/custom_app_bar.dart';
import 'package:flutter_elearning_app/widgets/custom_search_view.dart';
import '../../widgets/custom_icon_button.dart';
import '../featured_course_screen/models/favoritegrid_item_model.dart';
import '../featured_course_screen/widgets/favoritegrid_item_widget.dart';
import 'controller/home_screen_controller.dart';
import 'models/home_screen_model.dart';
import 'package:flutter_elearning_app/services/auth_service.dart';

class HomeScreenPage extends StatefulWidget {
  HomeScreenPage({Key? key}) : super(key: key);
  @override
  State<HomeScreenPage> createState() => _HomeScreenPageState();
}

class _HomeScreenPageState extends State<HomeScreenPage> {
  HomeScreenController controller = Get.put(HomeScreenController(HomeScreenModel().obs));
  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return Obx(() {
      if (controller.isLoading.value) return Center(child: CircularProgressIndicator());
      return Column(children: [
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
          SizedBox(height: 20.v),
          _buildSectionHeader("lbl_categories".tr, () => Get.toNamed(AppRoutes.categoriesScreen)),
          _buildCategoriesGrid(),
          _buildSectionHeader("msg_featured_courses".tr, () => Get.toNamed(AppRoutes.featuredCourseScreen)),
          _buildFeaturedGrid(),
          _buildSectionHeader("lbl_popular_courses".tr, () => Get.toNamed(AppRoutes.popularCoursesScreen)),
          _buildPopularList(),
        ]))
      ]);
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
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.h),
                      image: DecorationImage(image: CachedNetworkImageProvider(model.imageUrl!), fit: BoxFit.fill)),
                  child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.h),
                      child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.center, children: [
                        Text(model.title!, maxLines: 2, style: theme.textTheme.titleMedium!.copyWith(color: Colors.black)),
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
        padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 10.v),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(title, style: theme.textTheme.titleMedium),
          GestureDetector(onTap: onTap, child: Text("lbl_view_all".tr, style: CustomTextStyles.bodyMediumOnPrimary.copyWith(color: appTheme.viewAllButtonColor)))
        ]));
  }

  Widget _buildCategoriesGrid() {
    return GridView.count(
        primary: false, shrinkWrap: true, crossAxisCount: 4, crossAxisSpacing: 16.h, mainAxisSpacing: 16.h,
        padding: EdgeInsets.all(16.h),
        childAspectRatio: 1.0,
        children: List.generate(controller.categories.length > 4 ? 4 : controller.categories.length, (index) {
          var data = controller.categories[index];
          return Container(
              decoration: AppDecoration.fillIndigo.copyWith(
                  color: Color(int.parse(data.colorHex!.replaceFirst('#', '0xff'))),
                  borderRadius: BorderRadiusStyle.roundedBorder12),
              child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                CustomIconButton(height: 40.adaptSize, width: 40.adaptSize, padding: EdgeInsets.all(8.h), decoration: IconButtonStyleHelper.fillWhiteATL27, child: CustomImageView(imagePath: data.icon!)),
                SizedBox(height: 4.v),
                Text(data.title!, style: TextStyle(color: Colors.black, fontSize: 12.fSize, fontWeight: FontWeight.w600))
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
                  onTapFund: () => Get.toNamed(AppRoutes.courseDetailsAboutScreen, arguments: model));
            }));
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
              child: Container(
                  padding: EdgeInsets.all(16.h),
                  decoration: AppDecoration.fillGray.copyWith(borderRadius: BorderRadiusStyle.roundedBorder12),
                  child: Row(children: [
                    CustomImageView(imagePath: model.thumbnailUrl, height: 60.adaptSize, width: 60.adaptSize, radius: BorderRadius.circular(8.h)),
                    SizedBox(width: 12.h),
                    Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      Text(model.title!, style: theme.textTheme.titleMedium),
                      Text(model.instructorName!, style: theme.textTheme.bodySmall)
                    ])),
                    Text("${model.currency} ${model.price}", style: theme.textTheme.titleSmall)
                  ])));
        });
  }
}
