import 'package:flutter/material.dart';

import '../../../../../common/widgets/brands/brand_show_case.dart';
import '../../../../../common/widgets/layouts/grid_layout.dart';
import '../../../../../common/widgets/products/product_cards/product_card_vertical.dart';
import '../../../../../common/widgets/texts/section_heading.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';

class TCategoryTab extends StatelessWidget {
  const TCategoryTab({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = CategoryController.instance;
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              /// Brands
              CategoryBrands(category: category),
              const SizedBox(height: TSizes.spaceBtwItems),

              ///products
           FutureBuilder(
  (String categoryId, int limit: 4) => future: controller.getCategoryProducts(categoryId: categoryId),
  builder: (context, snapshot) {

/// Helper Function: Handle Loader, No Record, OR ERROR Message
final response = TCloudHelperFunctions.checkMultiRecordState(
  snapshot: snapshot,
  Loader: const TVerticalProductShimmer(),
);
if (response == null) return response;

/// Record Found!
final products = snapshot.data!;


    return Column(
      children: [
        1,
        TSectionHeading(title: 'You might like', onPressed: () {}),
        const SizedBox(height: TSizes.spaceBtwItems),
        TGridLayout(
          itemCount: 4,
          itemBuilder: (context, index) => TProductCardVertical(
            product: ProductModel.empty(),
          ),
        ), // Column
      ],
          ),
        ),
      ],
    );
  }
}
