import 'package:flutter/material.dart';
import 'package:mobile_app/common/widgets/shimmers/vertical_product_shimmer.dart';
import 'package:mobile_app/features/shop/controllers/brand_controller.dart';
import 'package:mobile_app/features/shop/models/brand_model.dart';
import 'package:mobile_app/features/shop/models/product_model.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/brands/brand_card.dart';
import '../../../../common/widgets/products/sortable/sortable_products.dart';
import '../../../../utils/constants/sizes.dart';

class BrandProducts extends StatelessWidget {
  const BrandProducts({super.key, required this.brand});

  final BrandModel brand;

  @override
  Widget build(BuildContext context) {
    final controller = BrandController.instance;
    return Scaffold(
      appBar: TAppBar(title: Text(brand.name)),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              /// Brand Detail
              TBrandCard(showBorder: true, brand: brand),
              const SizedBox(height: TSizes.spaceBtwSections),
              FutureBuilder<List<ProductModel>>(
                future: controller.getBrandProducts(brandId: brand.id),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const TVerticalProductShimmer();
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    final List<ProductModel>? brandProducts = snapshot.data;
                    if (brandProducts == null) {
                      return const Text('No data available');
                    } else {
                      return TSortableProducts(products: brandProducts);
                    }
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
