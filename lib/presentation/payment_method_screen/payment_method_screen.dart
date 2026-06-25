import 'package:flutter/material.dart';
import 'package:flutter_elearning_app/core/app_export.dart';
import 'package:flutter_elearning_app/widgets/app_bar/appbar_leading_image.dart';
import 'package:flutter_elearning_app/widgets/app_bar/appbar_subtitle.dart';
import 'package:flutter_elearning_app/widgets/app_bar/custom_app_bar.dart';
import 'package:flutter_elearning_app/widgets/custom_elevated_button.dart';
import '../my_cards_screen/controller/my_cards_controller.dart';
import '../my_cards_screen/models/my_cards_model.dart';
import 'controller/payment_method_controller.dart';


class PaymentMethodScreen extends StatefulWidget {
  const PaymentMethodScreen({super.key});

  @override
  State<PaymentMethodScreen> createState() => _PaymentMethodScreenState();
}

class _PaymentMethodScreenState extends State<PaymentMethodScreen> {
 PaymentMethodController paymentMethodController = Get.put(PaymentMethodController());
 MyCardsController myCardsController = Get.put(MyCardsController());
 @override
 Widget build(BuildContext context) {
  mediaQueryData = MediaQuery.of(context);
  return Scaffold(
    backgroundColor: appTheme.bgColor,
      resizeToAvoidBottomInset: false,
      body: GetBuilder<MyCardsController>(
        init: MyCardsController(),
        builder:(controller) =>  SafeArea(
          child: SizedBox(
              width: double.maxFinite,
              child: Column(children: [
               _buildHeader(),
               Column(children: [
                 SizedBox(height: 24.v),
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 16.h),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text("msg_select_payment_method".tr,
                          style: theme.textTheme.titleMedium)),
                ),
                SizedBox(height: 16.v),
                ListView.builder(
                 padding: EdgeInsets.symmetric(horizontal: 16.h),
                 primary: false,
                 shrinkWrap: true,
                 itemCount: controller.cardData.length,
                 itemBuilder: (context, index) {
                  MyCardsModel model = controller.cardData[index];
                  return animationfunction(index, buildPaymentDetails(model));
                 },)
               ])
              ])),
        ),
      ),
      bottomNavigationBar: _buildBtnAndPrice());
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
              margin: EdgeInsets.only(left: 20.h, bottom: 3.v),
              onTap: () {
               onTapArrowLeft();
              }),
          centerTitle: true,
          title: AppbarSubtitle(text: "lbl_payment_method".tr)));
 }

 Widget buildPaymentDetails(MyCardsModel model) {
  return Padding(
   padding:  EdgeInsets.symmetric(vertical: 8.v),
   child: GestureDetector(
     onTap: (){
       myCardsController.currentCardId = model.id!;
       myCardsController.update();
     },
     child: Container(
         padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 20.v),
         decoration: AppDecoration.fillGray
             .copyWith(borderRadius: BorderRadiusStyle.circleBorder15),
         child: Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
        Row(
          children: [
            CustomImageView(
                imagePath: model.icon,
                height: 34.adaptSize,
                width: 34.adaptSize),
            Padding(
                padding: EdgeInsets.only(left: 16.h, top: 9.v, bottom: 2.v),
                child:
                Text(model.title!, style: theme.textTheme.titleMedium)),
          ],
        ),
           CustomImageView(
             imagePath:myCardsController.currentCardId == model.id?ImageConstant.imgRadioIconselected :ImageConstant.imgRadioIconUnselected,
               height: 24.adaptSize,
               width: 24.adaptSize
           )
         ])),
   ),
  );
 }





 /// Section Widget
 Widget _buildBtnAndPrice() {
  return Padding(
      padding: EdgeInsets.only(left: 16.h, right: 16.h, bottom: 40.v),
      child:
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
       Padding(
           padding: EdgeInsets.symmetric(vertical: 14.v),
           child: Text("lbl_50_00".tr, style: theme.textTheme.titleLarge)),
       CustomElevatedButton(
           width: 206.h,
           text: "lbl_pay_now".tr,
           onPressed: () {
            onTapPayNow();
           })
      ]));
 }

 /// Navigates to the previous screen.
 onTapArrowLeft() {
  Get.back();
 }

 /// Navigates to the bookSuccessScreen when the action is triggered.
 onTapPayNow() {
  Get.toNamed(
   AppRoutes.bookSuccessScreen,
  );
 }
}




