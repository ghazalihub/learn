import 'package:flutter_elearning_app/core/app_export.dart';import 'package:flutter_elearning_app/presentation/book_success_screen/models/book_success_model.dart';/// A controller class for the BookSuccessScreen.
///
/// This class manages the state of the BookSuccessScreen, including the
/// current bookSuccessModelObj
class BookSuccessController extends GetxController {Rx<BookSuccessModel> bookSuccessModelObj = BookSuccessModel().obs;

 }
