import 'package:flutter_elearning_app/core/app_export.dart';import 'package:flutter_elearning_app/presentation/instructor_details_screen/models/instructor_details_model.dart';/// A controller class for the InstructorDetailsScreen.
///
/// This class manages the state of the InstructorDetailsScreen, including the
/// current instructorDetailsModelObj
class InstructorDetailsController extends GetxController {Rx<InstructorDetailsModel> instructorDetailsModelObj = InstructorDetailsModel().obs;

 }
