import 'package:flutter_elearning_app/core/app_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_elearning_app/presentation/cart_screen/controller/cart_controller.dart';

class PaymentMethodController extends GetxController {
  TextEditingController searchController = TextEditingController();
  final CartController _cartController = Get.find<CartController>();

  double get totalAmount => _cartController.totalAmount;

  Future<void> payNow() async {
    await _cartController.checkout();
  }

  @override
  void onClose() {
    super.onClose();
    searchController.dispose();
  }
}
