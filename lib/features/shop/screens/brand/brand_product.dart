import 'package:flutter/material.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/brands/brand_card.dart';
import '../../../../common/widgets/products/sortable/sortable_products.dart';
import '../../../../utils/constants/sizes.dart';

class BrandProducts extends StatelessWidget {
  const BrandProducts({super.key});

  final BrandModel brand;

  @override
  Widget build(BuildContext context) {
    final controller = brandController.instance;
    return Scaffold(
      appBar: TAppBar(title: Text('brand.name')),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              /// Brand Detail
              TBrandCard(
                showBorder: true,
                brand: null,
              ),
              const SizedBox(height: TSizes.spaceBtwSections),

              FutureBuilder(
                future:controller.getBrandProducts(brandId : brand.id),
                builder: (context ,snapsot){

                  ///handle loader,noRecord,or Error messages
                  const loader = =TverticalProductsShimmer();
                  final widget = TCloudHelperFunctions.checkMultiRecordState(snapsot: snapshot,loader: loader);
                  if (widget !=null) return widget;

                  ///record found
                  final BrandProducts = snapshot.data!;
                  return TSortableProducts(products: brandProducts);

                }
              ),
            ],
          ),
        ),
      ),
    );
  }
}
