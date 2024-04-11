
import 'package:flutter/material.dart';

import '../../../../../common/styles/rounded_container.dart';
import '../../../../../common/widgets/images/t_circular_image.dart';
import '../../../../../common/widgets/texts/product_price_text.dart';
import '../../../../../common/widgets/texts/product_title_text.dart';
import '../../../../../common/widgets/texts/t_brand_title_text_with_verified_icon.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/enums.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';
import '../../../controllers/product_controller.dart';
import '../../../models/produt_model.dart';

class TProductMetaData extends StatelessWidget {
  const TProductMetaData({
    super.key, required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller =ProductController.instance;
    final salePercentage = controller.calculateSalePercentage(product.price, product.salePrice);
    final darkMode = THelperFunctions.isDarkMode(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Price & Sale Price
        Row(
          children: [
            /// Sale Tag
            TRoundedContainer(
              radius: TSizes.sm,
              backgroundColor: TColors.secondary.withOpacity(0.8),
              padding: const EdgeInsets.symmetric(
                  horizontal: TSizes.sm, vertical: TSizes.xs),
              child: Text('$salePercentage%',
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge!
                      .apply(color: TColors.black)),
            ),
            const SizedBox(width: TSizes.spaceBtwItems),

            /// Price

            if(product.productType==productType.single.toString() && product.salePrice>0)
            Text('\$${product.price}',
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .apply(decoration: TextDecoration.lineThrough)),
            if(product.productType==productType.single.toString() && product.salePrice>0) const SizedBox(width: TSizes.spaceBtwItems),
            TProductPriceText(price: controller.getProductPrice(product), isLarge: true),
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems / 1.5),

        /// Title
        TProductTitleText(title: product.title),
        const SizedBox(height: TSizes.spaceBtwItems / 1.5),

        /// Stock Status

        Row(
          children: [
            const TProductTitleText(title: 'Status'),
            const SizedBox(width: TSizes.spaceBtwItems),
            Text(controller.getProductStockStatus(product.stock), style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: TSizes.spaceBtwItems / 1.5),
          ],
        ),

        /// Brand
        Row(
          children: [
            TCircularImage(
              image: product.brand!=null?product.brand!.image : '',
              width: 32,
              height: 32,
              overlayColor: darkMode ? TColors.white : TColors.black,
            ),
            TBrandTitleWithVerifiedIcon(
                title: product.brand!=null?product.brand!.name:'', brandTextSize: TextSizes.medium),
          ],
        )
      ],
    );
  }
}
