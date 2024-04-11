import 'dart:js_util';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_app/features/shop/controllers/product/cart_controller.dart';

import '../../../../../common/widgets/products/cart/add_remove_button.dart';
import '../../../../../common/widgets/products/cart/cart_item.dart';
import '../../../../../common/widgets/texts/product_price_text.dart';
import '../../../../../utils/constants/sizes.dart';

class TCartItems extends StatelessWidget {
  const TCartItems({
    super.key,
    this.showAddRemoveButtons = true,
    required cartItem,
  });
  final bool showAddRemoveButtons;

  @override
  Widget build(BuildContext context) {
    final cartController = CartController.instance;
    return Obx(
      () => ListView.separated(
        shrinkWrap: true,
        itemCount: cartController.cartItems.length,
        separatorBuilder: (_, __) =>
            const SizedBox(height: TSizes.spaceBtwSections),
        itemBuilder: (_, index) => Obx(() {
          final item = cartController.cartItems[index];

          return Column(
            children: [
              ///cart item
              TCartItems(cartItem: item),
              if (showAddRemoveButtons)
                const SizedBox(
                  height: TSizes.spaceBtwItems,
                ),

              if (showAddRemoveButtons)

                ///add remove button with total price
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        ///extra space
                        SizedBox(width: 70),

                        ///add remove buttons
                        TProductQuantityWithAddRemoveButton(
                          quantity: item.quantity,
                          add: () => cartController.addOneToCart(item),
                          remove: () => cartController.removeOneFromCart(item),
                        ),
                      ],
                    ),

                    ///total price

                    TProductPriceText(
                        price: (item.price * item.quantity).toStringAsFixed(1)),
                  ],
                )
            ],
          );
        }),
      ),
    );
  }
}
