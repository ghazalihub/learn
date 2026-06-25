import '../../../core/app_export.dart';import 'lessonslist_item_model.dart';/// This class defines the variables used in the [course_details_about_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class CourseDetailsAboutModel {Rx<List<LessonslistItemModel>> lessonslistItemList = Rx([LessonslistItemModel(lessonCount: "154 lessons".obs,viewAllText: "View all".obs)]);

 }
