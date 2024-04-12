import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mobile_app/features/shop/controllers/product/checkout_controller.dart';

import '../../../../../common/styles/rounded_container.dart';
import '../../../../../common/widgets/texts/section_heading.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class TBillingPaymentSection extends StatelessWidget {
  const TBillingPaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CheckoutController());

    final dark = THelperFunctions.isDarkMode(context);
    return Column(
      children: [
        TSectionHeading(
            title: 'Payment Method',
            buttonTitle: 'Change',
            onPressed: () => controller.selectPaymentMethod(context)),
        const SizedBox(height: TSizes.spaceBtwItems / 2),
        obx(() => Row(
              children: [
                TRoundedContainer(
                  width: 60,
                  height: 35,
                  backgroundColor: dark ? TColors.light : TColors.white,
                  padding: const EdgeInsets.all(TSizes.sm),
                  child: const Image(
                    image: AssetImage(
                        controller.selectedPaymentMethod.value.image),
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(height: TSizes.spaceBtwItems / 2),
                Text(controller.selectedPaymentMethod.value.image,
                    style: Theme.of(context).textTheme.bodyLarge),
              ],
            )),
      ],
    );
  }
}
