import 'package:flutter/material.dart';
import 'package:flutter_elearning_app/core/app_export.dart';
import 'package:flutter_elearning_app/data/models/course_model.dart';
import '../course_details_screen/widgets/widget_item_widget.dart';
import '../course_details_screen/models/widget_item_model.dart';

class LessonsScreen extends StatefulWidget {
  const LessonsScreen({super.key});
  @override
  State<LessonsScreen> createState() => _LessonsScreenState();
}

class _LessonsScreenState extends State<LessonsScreen> {
  late CourseModel course;
  @override
  void initState() {
    super.initState();
    course = Get.arguments as CourseModel;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: appTheme.bgColor,
        body: SafeArea(
          child: Column(children: [
            _buildHeader(),
            Expanded(
              child: ListView.separated(
                  padding: EdgeInsets.all(16.h),
                  separatorBuilder: (context, index) => SizedBox(height: 16.v),
                  itemCount: course.lessons?.length ?? 0,
                  itemBuilder: (context, index) {
                    var lesson = course.lessons![index];
                    return WidgetItemWidget(
                      WidgetItemModel((index + 1).toString().padLeft(2, '0'), lesson.title, lesson.duration, false),
                      onTap: () => Get.toNamed(AppRoutes.videoScreen, arguments: lesson),
                    );
                  }),
            )
          ]),
        ));
  }

  Widget _buildHeader() {
    return Padding(
        padding: EdgeInsets.all(16.h),
        child: Row(children: [
          IconButton(icon: Icon(Icons.arrow_back), onPressed: () => Get.back()),
          Spacer(),
          Text("Lessons", style: theme.textTheme.titleLarge),
          Spacer(),
          SizedBox(width: 48)
        ]));
  }
}
