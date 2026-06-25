import 'package:flutter_elearning_app/core/app_export.dart';import 'package:flutter_elearning_app/presentation/payment_method_screen/models/payment_method_model.dart';import 'package:flutter/material.dart';/// A controller class for the PaymentMethodScreen.
///
/// This class manages the state of the PaymentMethodScreen, including the
/// current paymentMethodModelObj
class PaymentMethodController extends GetxController {TextEditingController searchController = TextEditingController();

Rx<PaymentMethodModel> paymentMethodModelObj = PaymentMethodModel().obs;

Rx<String> radioGroup = "".obs;

Rx<String> radioGroup1 = "".obs;

Rx<String> radioGroup2 = "".obs;

@override void onClose() { super.onClose(); searchController.dispose(); } 
 }
