import 'package:flutter/material.dart';
import 'package:mobile_app/features/shop/models/produt_model.dart';

import '../../../../../common/widgets/brands/brand_show_case.dart';
import '../../../../../common/widgets/layouts/grid_layout.dart';
import '../../../../../common/widgets/products/product_cards/product_card_vertical.dart';
import '../../../../../common/widgets/texts/section_heading.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../models/category_model.dart';

class TCategoryTab extends StatelessWidget {
  const TCategoryTab({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              /// Brands
              const TBrandShowcase(images: [
                TImages.product1,
                TImages.product1,
                TImages.product1
              ]),
              const TBrandShowcase(images: [
                TImages.product1,
                TImages.product1,
                TImages.product1
              ]),
              const SizedBox(height: TSizes.spaceBtwItems),

              ///products
              TSectionHeading(title: "You Might Like", onPressed: () {}),
              const SizedBox(height: TSizes.spaceBtwItems),

              TGridLayout(
                  itemCount: 6,
                  itemBuilder: (_, index) =>TProductCardVertical(product: ProductModel.empty(),)),
              const SizedBox(height: TSizes.spaceBtwItems),
            ],
          ),
        ),
      ],
    );
  }
}
