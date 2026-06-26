import 'package:flutter_elearning_app/core/app_export.dart';
import 'package:flutter_elearning_app/services/auth_service.dart';

class LogOutController extends GetxController {
  final AuthService _authService = Get.find<AuthService>();

  Future<void> logout() async {
    await _authService.signOut();
    Get.offAllNamed(AppRoutes.logInScreen);
  }
}
