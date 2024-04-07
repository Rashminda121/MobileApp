import 'package:flutter/material.dart';

import '../../../../../common/widgets/products/cart/add_remove_button.dart';
import '../../../../../common/widgets/products/cart/cart_item.dart';
import '../../../../../common/widgets/texts/product_price_text.dart';
import '../../../../../utils/constants/sizes.dart';

class TCartItems extends StatelessWidget {
  const TCartItems({
    super.key,  this.showAddRemoveButtons=true,
  });
  final bool showAddRemoveButtons;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: 2,
      separatorBuilder: (_, __) =>
      const SizedBox(height: TSizes.spaceBtwSections),

      itemBuilder: (_, index) => Column(
        children: [
          ///cart item
          const TCartItem(),
          if(showAddRemoveButtons)const SizedBox(height: TSizes.spaceBtwItems,),

          if(showAddRemoveButtons)
            ///add remove button with total price
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              Row(

                children: [
                  ///extra space
                  SizedBox(width: 70),

                  ///add remove buttons
                  TProductQuantityWithAddRemoveButton(),
                ],
              ),
              ///total price

              TProductPriceText(price: '256'),

            ],
          )
        ],
      ),
    );
  }
}