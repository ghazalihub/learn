import 'package:flutter/material.dart';
import 'package:flutter_elearning_app/core/app_export.dart';
import 'package:flutter_elearning_app/widgets/app_bar/appbar_leading_image.dart';
import 'package:flutter_elearning_app/widgets/app_bar/appbar_subtitle.dart';
import 'package:flutter_elearning_app/widgets/app_bar/custom_app_bar.dart';
import 'package:flutter_elearning_app/widgets/custom_elevated_button.dart';
import 'package:flutter_elearning_app/widgets/custom_search_view.dart';
import 'package:flutter_elearning_app/widgets/custom_text_form_field.dart';
import '../cart_screen/widgets/learnnewskillslist1_item_widget.dart';
import 'controller/cart_controller.dart';
import 'models/learnnewskillslist1_item_model.dart';





class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
 CartController controller = Get.put(CartController());
 @override
 Widget build(BuildContext context) {
  mediaQueryData = MediaQuery.of(context);
  return Scaffold(
    backgroundColor: appTheme.bgColor,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SizedBox(
            width: double.maxFinite,
            child: Stack(
              children: [
                Column(children: [
                 _buildHeader(),
                 SizedBox(height: 24.v),
                 Expanded(
                     child: SingleChildScrollView(
                         child: Padding(
                             padding: EdgeInsets.only(
                                 left: 16.h, right: 16.h, bottom: 5.v),
                             child: Column(children: [
                              _buildLearnNewSkillsList(),
                              SizedBox(height: 18.v),
                              Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text("lbl_promo_code".tr,
                                      style: theme.textTheme.titleMedium!.copyWith(
                                        color:appTheme.black900
                                      ))),
                              SizedBox(height: 10.v),
                              _buildPromoCodeRow(),
                              SizedBox(height: 20.v),
                              Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text("lbl_payment_summary".tr,
                                      style: theme.textTheme.titleMedium)),
                              SizedBox(height: 18.v),
                              _buildTax(
                                  addOns: "lbl_item_total".tr,
                                  price: "lbl_110_00".tr),
                              SizedBox(height: 19.v),
                              _buildTax(
                                  addOns: "lbl_add_ons".tr,
                                  price: "lbl_10_00".tr),
                              SizedBox(height: 19.v),
                              _buildTax(
                                  addOns: "lbl_tax".tr, price: "lbl_2_00".tr),
                              SizedBox(height: 17.v),
                              Divider(),
                              SizedBox(height: 18.v),
                              _buildTax(
                                  addOns: "msg_total_payment_amount".tr,
                                  price: "lbl_122_00".tr),
                              SizedBox(height: 120.v),
                             ]))))
                ]),
               Align(
                alignment: Alignment.bottomCenter,
                 child: Container(
                  child:  _buildProceedToPaymentButton(),
                 ),
               )
              ],
            )),
      ),
     );
 }

 /// Section Widget
 Widget _buildHeader() {
  return Container(
      padding: EdgeInsets.symmetric(vertical: 20.v),
      decoration: AppDecoration.white,
      child: CustomAppBar(
          leadingWidth: 44.h,
          leading: AppbarLeadingImage(
              imagePath: ImageConstant.imgArrowLeft,
              margin: EdgeInsets.only(left: 20.h, top: 1.v, bottom: 1.v),
              onTap: () {
               onTapArrowLeft();
              }),
          centerTitle: true,
          title: AppbarSubtitle(text: "lbl_cart".tr)));
 }

 /// Section Widget
 Widget _buildLearnNewSkillsList() {
  return Obx(() => ListView.separated(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      separatorBuilder: (context, index) {
       return SizedBox(height: 16.v);
      },
      itemCount: controller
          .cartModelObj.value.learnnewskillslist1ItemList.value.length,
      itemBuilder: (context, index) {
       Learnnewskillslist1ItemModel model = controller
           .cartModelObj.value.learnnewskillslist1ItemList.value[index];
       return Learnnewskillslist1ItemWidget(model);
      }));
 }

 /// Section Widget
 Widget _buildPromoCodeRow() {
  return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
   Expanded(
       child:
       CustomSearchView(
  controller: controller.promoCodeController,
   hintText: "msg_enter_coupon_code".tr,
   suffix: GestureDetector(
     onTap: () {
      onTapTxtViewAll();
     },
     child: Padding(
       padding:  EdgeInsets.only(right: 16.h ),
       child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(29.h),
            color: appTheme.buttonColor),
        child: Center(
            child: Text("Apply",style: theme.textTheme.bodyMedium!.copyWith(color: appTheme.whiteA700))
        ),
       ),
     ),
   ),
   prefix: SizedBox(width: 16.h),
   suffixConstraints: BoxConstraints(maxWidth: 76.h,maxHeight: 32.v,minWidth: 76.h,minHeight: 32.v),
      contentPadding:
      EdgeInsets.symmetric(horizontal: 16.h, vertical: 14.v),
      borderDecoration: TextFormFieldStyleHelper.fillGray,
      fillColor: appTheme.gray10002
  )
  ),
   GestureDetector(
       onTap: () {
        onTapTxtViewAll();
       },
       child: Padding(
           padding: EdgeInsets.only(left: 16.h, top: 16.v, bottom: 15.v),
           child: Text("lbl_view_all".tr, style: theme.textTheme.bodyLarge)))
  ]);
 }

 /// Section Widget
 Widget _buildProceedToPaymentButton() {
  return CustomElevatedButton(
      text: "msg_proceed_to_payment".tr,
      margin: EdgeInsets.only(left: 16.h, right: 16.h, bottom: 40.v),
      onPressed: () {
       onTapProceedToPaymentButton();
      });
 }

 /// Common widget
 Widget _buildTax({
  required String addOns,
  required String price,
 }) {
  return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
   Text(addOns,
       style: theme.textTheme.bodyLarge!
           .copyWith(color: appTheme.black900,
       fontWeight: FontWeight.w600,
       fontSize: 16.fSize)),
   Text(price,
       style: theme.textTheme.bodyLarge!
           .copyWith(color: appTheme.black900,
           fontWeight: FontWeight.w600,
           fontSize: 16.fSize))
  ]);
 }

 /// Navigates to the previous screen.
 onTapArrowLeft() {
  Get.back();
 }

 /// Navigates to the promoCodeScreen when the action is triggered.
 onTapTxtViewAll() {
  Get.toNamed(
   AppRoutes.promoCodeScreen,
  );
 }

 /// Navigates to the paymentMethodScreen when the action is triggered.
 onTapProceedToPaymentButton() {
  Get.toNamed(
   AppRoutes.paymentMethodScreen,
  );
 }
}


