import 'package:flutter/material.dart';
import 'package:flutter_elearning_app/core/app_export.dart';
import 'package:flutter_elearning_app/widgets/app_bar/appbar_leading_image.dart';
import 'package:flutter_elearning_app/widgets/app_bar/appbar_subtitle.dart';
import 'package:flutter_elearning_app/widgets/app_bar/custom_app_bar.dart';
import 'controller/popular_instructor_controller.dart';

class PopularInstructorScreen extends StatefulWidget {
  const PopularInstructorScreen({super.key});
  @override
  State<PopularInstructorScreen> createState() => _PopularInstructorScreenState();
}

class _PopularInstructorScreenState extends State<PopularInstructorScreen> {
  PopularInstructorController controller = Get.put(PopularInstructorController());

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: appTheme.bgColor,
      body: SafeArea(
        child: Column(children: [
          _buildHeader(),
          SizedBox(height: 24.v),
          Expanded(
            child: Obx(() => controller.isLoading.value
              ? Center(child: CircularProgressIndicator())
              : GridView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 16.h),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisExtent: 180.v,
                    crossAxisCount: 2,
                    mainAxisSpacing: 16.h,
                    crossAxisSpacing: 16.h
                  ),
                  itemCount: controller.instructors.length,
                  itemBuilder: (context, index) {
                    var inst = controller.instructors[index];
                    return GestureDetector(
                      onTap: () => Get.toNamed(AppRoutes.instructorDetailsScreen, arguments: inst),
                      child: Container(
                        padding: EdgeInsets.all(16.h),
                        decoration: AppDecoration.fillGray.copyWith(borderRadius: BorderRadiusStyle.roundedBorder12),
                        child: Column(children: [
                          CustomImageView(imagePath: inst.image, height: 80.adaptSize, width: 80.adaptSize, radius: BorderRadius.circular(40.h)),
                          SizedBox(height: 12.v),
                          Text(inst.name!, style: theme.textTheme.titleSmall, textAlign: TextAlign.center, overflow: TextOverflow.ellipsis),
                          SizedBox(height: 4.v),
                          Text(inst.role!, style: theme.textTheme.bodySmall, textAlign: TextAlign.center, overflow: TextOverflow.ellipsis)
                        ]),
                      ),
                    );
                  }
                )
            ),
          )
        ]),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20.v),
      decoration: AppDecoration.white,
      child: CustomAppBar(
        leadingWidth: 44.h,
        leading: AppbarLeadingImage(
          imagePath: ImageConstant.imgArrowLeft,
          margin: EdgeInsets.only(left: 20.h, top: 1.v, bottom: 1.v),
          onTap: () => Get.back(),
        ),
        centerTitle: true,
        title: AppbarSubtitle(text: "msg_popular_instructor".tr),
      ),
    );
  }
}
