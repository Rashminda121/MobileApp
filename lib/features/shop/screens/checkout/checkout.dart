
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_app/features/shop/screens/checkout/widgets/billing_address_section.dart';
import 'package:mobile_app/features/shop/screens/checkout/widgets/billing_amount_section.dart';
import 'package:mobile_app/features/shop/screens/checkout/widgets/billing_payment_section.dart';

import '../../../../common/styles/rounded_container.dart';
import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/products/cart/coupon_widget.dart';
import '../../../../common/widgets/success_screen/success_screen.dart';
import '../../../../navigation_menu.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../cart/widgets/cart_items.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        title: Text('Order Review',
            style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              ///-- Items in Cart
              const TCartItems(showAddRemoveButtons: false),
              const SizedBox(height: TSizes.spaceBtwSections),

              ///coupon textfield
              const TCouponCode(),
              const SizedBox(height: TSizes.spaceBtwSections),

              ///billing Section
              TRoundedContainer(
                padding: const EdgeInsets.all(TSizes.md),
                showBorder: true,
                backgroundColor: dark ? TColors.black : TColors.white,
                child: const Column(
                  children: [
                    /// Pricing

                    TBillingAmountSection(),
                    SizedBox(height: TSizes.spaceBtwItems),

                    ///Divider
                    Divider(),
                    SizedBox(height: TSizes.spaceBtwItems),

                    /// PaymentMethods
                    TBillingPaymentSection(),
                    SizedBox(height: TSizes.spaceBtwItems),

                    ///Address
                    TBillingAddressSection(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),

      ///checkout button
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: ElevatedButton(
          onPressed: () => Get.to(() => SuccessScreen(
              image: TImages.paymentSuccess,
              title: 'Payment Success',
              subTitle: 'Your Item Will Be Shipped Soon',
              onPressed: () => Get.offAll(() => const NavigationMenu()))),
          child: const Text('Checkout \$256.0'),
        ),
      ),
    );
  }
}
