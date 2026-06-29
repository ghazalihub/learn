import 'package:flutter/material.dart';
import 'package:flutter_elearning_app/core/app_export.dart';
import 'package:flutter_elearning_app/widgets/app_bar/appbar_leading_image.dart';
import 'package:flutter_elearning_app/widgets/app_bar/appbar_subtitle.dart';
import 'package:flutter_elearning_app/widgets/app_bar/custom_app_bar.dart';
import 'controller/popular_courses_controller.dart';
import 'widgets/learnnewskillslist_item_widget.dart';
import 'models/learnnewskillslist_item_model.dart';

class PopularCoursesScreen extends StatefulWidget {
  const PopularCoursesScreen({super.key});
  @override
  State<PopularCoursesScreen> createState() => _PopularCoursesScreenState();
}

class _PopularCoursesScreenState extends State<PopularCoursesScreen> {
  PopularCoursesController controller = Get.put(PopularCoursesController());

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
              : ListView.separated(
                  padding: EdgeInsets.symmetric(horizontal: 16.h),
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  separatorBuilder: (context, index) => SizedBox(height: 16.v),
                  itemCount: controller.courses.length,
                  itemBuilder: (context, index) {
                    var model = controller.courses[index];
                    return animationfunction(index, LearnnewskillslistItemWidget(course: model,
                      LearnnewskillslistItemModel(model.thumbnailUrl, model.title, model.instructorImage, model.instructorName, model.category, "${model.currency} ${model.price}")
                    ));
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
        title: AppbarSubtitle(text: "lbl_popular_courses".tr),
      ),
    );
  }
}
