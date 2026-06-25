import 'dart:async';
import 'package:flutter_elearning_app/core/app_export.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import '../data/models/course_model.dart';
import 'cart_service.dart';

class PaymentService extends GetxService {
  final InAppPurchase _inAppPurchase = InAppPurchase.instance;
  late StreamSubscription<List<PurchaseDetails>> _subscription;

  RxList<ProductDetails> products = <ProductDetails>[].obs;
  RxBool isAvailable = false.obs;

  @override
  void onInit() {
    super.onInit();
    final Stream<List<PurchaseDetails>> purchaseUpdated = _inAppPurchase.purchaseStream;
    _subscription = purchaseUpdated.listen((purchaseDetailsList) {
      _listenToPurchaseUpdated(purchaseDetailsList);
    }, onDone: () {
      _subscription.cancel();
    }, onError: (error) {
      // handle error here.
    });
    initStoreInfo();
  }

  Future<void> initStoreInfo() async {
    isAvailable.value = await _inAppPurchase.isAvailable();
    // In a real app, you would fetch product IDs from your backend or courses.json
  }

  Future<void> buyCourse(CourseModel course) async {
    // This is a placeholder. Real implementation needs product IDs mapped to courses.
    // final PurchaseParam purchaseParam = PurchaseParam(productDetails: productDetails);
    // _inAppPurchase.buyNonConsumable(purchaseParam: purchaseParam);

    // For now, let's simulate a successful purchase
    Get.snackbar("Processing", "Connecting to Store...");
    await Future.delayed(Duration(seconds: 2));
    Get.find<CartService>().enroll(course);
  }

  void _listenToPurchaseUpdated(List<PurchaseDetails> purchaseDetailsList) {
    purchaseDetailsList.forEach((PurchaseDetails purchaseDetails) async {
      if (purchaseDetails.status == PurchaseStatus.pending) {
        // show pending UI
      } else {
        if (purchaseDetails.status == PurchaseStatus.error) {
          // handle error
        } else if (purchaseDetails.status == PurchaseStatus.purchased ||
                   purchaseDetails.status == PurchaseStatus.restored) {
          // verify purchase and deliver content
        }
        if (purchaseDetails.pendingCompletePurchase) {
          await _inAppPurchase.completePurchase(purchaseDetails);
        }
      }
    });
  }

  @override
  void onClose() {
    _subscription.cancel();
    super.onClose();
  }
}
