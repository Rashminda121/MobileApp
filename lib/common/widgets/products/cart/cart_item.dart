import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../images/t_rounded_image.dart';
import '../../texts/product_title_text.dart';
import '../../texts/t_brand_title_text_with_verified_icon.dart';

class TCartItem extends StatelessWidget {
  const TCartItem({
    super.key,
  });

  final CartItemModel = cartItem;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Row(
      children: [
        ///Image
        TRoundedImage(
          imageUrl: cartItem.image ?? '',
          width: 60,
          height: 60,
          isNetworkImage: true,
          padding: const EdgeInsets.all(TSizes.sm),
          backgroundColor: dark ? TColors.darkerGrey : TColors.light,
        ),

        const SizedBox(width: TSizes.spaceBtwItems),

        ///Title, price, & size
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TBrandTitleWithVerifiedIcon(title: cartItem.brandName ??''),
              Flexible(child: TProductTitleText(title: cartItem.title, maxLines: 1)),
              

              ///Attributes
              Text.rich(
                TextSpan(
                children: (cartItem.selectedVariation ?? {})
                .entries
                .map(
                  (e) => TextSpan(
                    children:[
                      TextSpan(text: '${e.key}: ', style: Theme.of(context).textTheme.bodySmall),
                      TextSpan(text: '${e.value}', style: Theme.of(context).textTheme.bodyLarge),
                ],
                ),
                )
                toList(),
              ),
              )
            ],
          ),
        )
      ],
    );
  }
}
