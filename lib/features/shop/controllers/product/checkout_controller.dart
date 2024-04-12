import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

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
            TPaymentTile (paymentMethod: PaymentMethod Model (name: 'Paypal', image: TImages.paypal))
            ]
          ), // Column
        ), // Container
      ), // SingleChild ScrollView
    );
   }
}
