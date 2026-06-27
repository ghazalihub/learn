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
    if (isAvailable.value) {
      final repo = Get.find<CourseRepository>();
      final allCourses = await repo.getCourses();
      final Set<String> _kIds = allCourses.map((c) => c.id!).toSet();
      if (_kIds.isNotEmpty) {
        final ProductDetailsResponse response = await _inAppPurchase.queryProductDetails(_kIds);
        products.assignAll(response.productDetails);
      }
    }
  }

  Future<void> buyCourse(CourseModel course) async {
    if (!isAvailable.value) {
      Get.snackbar("Error", "Store not available");
      return;
    }

    final product = products.firstWhereOrNull((p) => p.id == course.id);
    if (product != null) {
      final PurchaseParam purchaseParam = PurchaseParam(productDetails: product);
      await _inAppPurchase.buyNonConsumable(purchaseParam: purchaseParam);
    } else {
      // For demo purposes, we still allow enrollment if product ID not found in store
      await Get.find<CartService>().enroll(course);
    }
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
          final courseId = purchaseDetails.productID;
          final repo = Get.find<CourseRepository>();
          final allCourses = await repo.getCourses();
          final course = allCourses.firstWhereOrNull((c) => c.id == courseId);
          if (course != null) {
            await Get.find<CartService>().enroll(course);
          }
          Get.snackbar("Success", "Course purchased successfully!");
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
