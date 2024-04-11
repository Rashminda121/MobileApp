import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mobile_app/features/shop/screens/product_details/widgets/bottom_add_to_cart.dart';
import 'package:mobile_app/features/shop/screens/product_details/widgets/product_attributes.dart';
import 'package:mobile_app/features/shop/screens/product_details/widgets/product_detail_image_slider.dart';
import 'package:mobile_app/features/shop/screens/product_details/widgets/product_meta_data.dart';
import 'package:mobile_app/features/shop/screens/product_details/widgets/rating_share_widget.dart';
import 'package:readmore/readmore.dart';

import '../../../../common/widgets/texts/section_heading.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../product_reviews/product_reviews.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  final ProductModel = product;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      bottomNavigationBar: TBottomAddToCart(product: product),
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// product image slider
            const TProductImageSlider(),

            ///product details
            Padding(
              padding: const EdgeInsets.only(
                  right: TSizes.defaultSpace,
                  left: TSizes.defaultSpace,
                  bottom: TSizes.defaultSpace),
              child: Column(
                children: [
                  /// Rating & Share
                  const TRatingAndShare(),

                  /// - Price, Title, Stock, & Brand
                  const TProductMetaData(),

                  /// -- Attributes
                  const TProductAttributes(),
                  const SizedBox(height: TSizes.spaceBtwSections),

                  /// -- Checkout Button
                  SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () {}, child: const Text('Checkout'))),
                  const SizedBox(height: TSizes.spaceBtwItems),

                  /// Description

                  const TSectionHeading(
                    title: 'Description',
                    showActionButton: false,
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  const ReadMoreText(
                    'This is a sleeveless vest from Nike, available in a stylish blue color. It is made from high-quality, breathable materials for maximum comfort and performance. Perfect for running, working out, or any other activity where you need freedom of movement and a cool, comfortable fit.',
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: 'Show More',
                    trimExpandedText: 'Show less',
                    moreStyle:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                    lessStyle:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                  ),

                  /// - Reviews
                  const Divider(),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const TSectionHeading(
                          title: 'Reviews (199)', showActionButton: false),
                      IconButton(
                          icon: const Icon(Iconsax.arrow_right_3, size: 18),
                          onPressed: () =>
                              Get.to(() => const ProductReviewsScreen())),
                    ],
                  ),
                  const SizedBox(height: TSizes.spaceBtwSections),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
