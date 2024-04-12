import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:mobile_app/common/widgets/texts/section_heading.dart';
import 'package:mobile_app/utils/constants/image_strings.dart';
import 'package:mobile_app/utils/constants/sizes.dart';

class CheckoutController extends GetxController {
  static CheckoutController get instance => Get.find();

  final Rx<PaymentMethodModel> selectedPaymentMethod =
      PaymentMethodModel.empty().obs;

  @override
  void onInit() {
    selectedPaymentMethod.value =
        PaymentMethodModel(name: 'Paypal', image: TImages.paypal);
    super.onInit();
  }

   Future<dynamic> selectPaymentMethod(BuildContext context) {

    return showModalBottomSheet(
      context: context,
      builder: (_) => SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all (TSizes.lg),
          child: Column (
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            const TSectionHeading (title: 'Select Payment Method', showActionButton: false),
            const SizedBox (height: TSizes.spaceBtwSections),
            TPaymentTile (paymentMethod: PaymentMethod Model (name: 'Paypal', image: TImages.paypal)),
            const SizedBox(height: TSizes.spaceBtwItems/2),
            TPaymentTile (paymentMethod: PaymentMethod Model (name: 'Google Pay', image: TImages.googlePay)),
            const SizedBox(height: TSizes.spaceBtwItems/2),
            TPaymentTile (paymentMethod: PaymentMethod Model (name: 'Apple Pay', image: TImages.applePay)),
            const SizedBox(height: TSizes.spaceBtwItems/2),
            TPaymentTile (paymentMethod: PaymentMethod Model (name: 'VISA', image: TImages.visa)),
            const SizedBox(height: TSizes.spaceBtwItems/2),
            TPaymentTile (paymentMethod: PaymentMethod Model (name: 'Master Card', image: TImages.masterCard)),
            const SizedBox(height: TSizes.spaceBtwItems/2),
            TPaymentTile (paymentMethod: PaymentMethod Model (name: 'Paytm', image: TImages.paytm)),
            const SizedBox(height: TSizes.spaceBtwItems/2),
            TPaymentTile (paymentMethod: PaymentMethod Model (name: 'Paystack', image: TImages.paystack)),
            const SizedBox(height: TSizes.spaceBtwItems/2),
            TPaymentTile (paymentMethod: PaymentMethod Model (name: 'Credit Card', image: TImages.creditCard)),
            const SizedBox(height: TSizes.spaceBtwItems/2),

            ]
          ), // Column
        ), // Container
      ), // SingleChild ScrollView
    );
   }
}
