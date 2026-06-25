import 'package:flutter/material.dart';
import 'package:flutter_elearning_app/core/app_export.dart';
import 'package:flutter_elearning_app/widgets/app_bar/appbar_subtitle.dart';
import 'package:flutter_elearning_app/widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_elevated_button.dart';
import '../my_courses1_page/widgets/fundlist_item_widget.dart';
import 'controller/my_courses1_controller.dart';
import 'models/fundlist_item_model.dart';

class MyCourses1Page extends StatefulWidget {
  MyCourses1Page({Key? key}) : super(key: key);
  @override
  State<MyCourses1Page> createState() => _MyCourses1PageState();
}

class _MyCourses1PageState extends State<MyCourses1Page> {
  MyCourses1Controller controller = Get.put(MyCourses1Controller());
  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return Obx(() {
      if (controller.isLoading.value) return Center(child: CircularProgressIndicator());
      if (controller.enrolledCourses.isEmpty) return _buildEmptyState();
      return Column(children: [
        _buildAppBar(),
        Expanded(
          child: ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 16.v),
              separatorBuilder: (context, index) => SizedBox(height: 16.v),
              itemCount: controller.enrolledCourses.length,
              itemBuilder: (context, index) {
                var model = controller.enrolledCourses[index];
                int completed = controller.progress[model.id]?.length ?? 0;
                int total = model.lessons?.length ?? 1;
                double percent = completed / total;
                return FundlistItemWidget(
                  FundlistItemModel(model.thumbnailUrl, model.title, "Duration: ${model.lessons?.length ?? 0} lessons", "${(percent * 100).toInt()}%", percent),
                  onTapFund: () => Get.toNamed(AppRoutes.courseDetailsAboutScreen, arguments: model),
                );
              }),
        )
      ]);
    });
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        CustomImageView(imagePath: ImageConstant.imgGroup34160Indigo5002154x154, height: 154.adaptSize, width: 154.adaptSize),
        SizedBox(height: 26.v),
        Text("lbl_no_course_yet".tr, style: theme.textTheme.titleLarge),
        SizedBox(height: 28.v),
        CustomElevatedButton(onPressed: () => Get.back(), text: "Browse Courses", margin: EdgeInsets.symmetric(horizontal: 50.h))
      ]),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return CustomAppBar(height: 64.v, centerTitle: true, title: AppbarSubtitle(text: "lbl_my_courses".tr));
  }
}
