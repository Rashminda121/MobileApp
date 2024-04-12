import 'package:flutter/material.dart';
import 'package:mobile_app/common/widgets/brands/brand_show_case.dart';
import 'package:mobile_app/features/shop/controllers/brand_controller.dart';
import 'package:mobile_app/features/shop/screens/brand/boxes_shimmer.dart';
import 'package:mobile_app/features/shop/screens/brand/list_tile_shimmer.dart';
import 'package:mobile_app/utils/constants/sizes.dart';
import 'package:mobile_app/utils/helpers/cloud_helper_functions.dart';
import 'package:mobile_app/features/shop/models/category_model.dart';

class CategoryBrands extends StatelessWidget {
  const CategoryBrands({
    super.key,
    required this.category,
  });

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final controller = BrandController.instance;
    return FutureBuilder(
      future: controller.getBrandsForCategory(category.id),
      builder: (context, snapshot) {
        const loader = Column(
          children: [
            TListTileShimmer(),
            SizedBox(height: TSizes.spaceBtwItems),
            TBoxesShimmer(),
            SizedBox(height: TSizes.spaceBtwItems),
          ],
        );

        final widget = TCloudHelperFunctions.checkMultiRecordState(
          snapshot: snapshot,
          loader: loader,
        );

        if (widget != null) return widget;
        final brands = snapshot.data!;
        return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: brands.length,
          itemBuilder: (_, index) {
            final brand = brands[index];
            String brandId = brand.id;
            return FutureBuilder(
              future: controller.getBrandProducts(brandId:brand.id, limit: 3),
              builder: (context, snapshot) {
        final widget = TCloudHelperFunctions.checkMultiRecordState(
          snapshot: snapshot,
          loader: loader,
        );
if (widget != null) return widget;

final products = snapshot.data!;
return TBrandShowcase(
  brand: brand,
  images: products.map((e) => e.thumbnail).toList(),
);
      }
    );
  },
);
  }
);}}