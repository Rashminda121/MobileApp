
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_app/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:mobile_app/features/shop/screens/home/widgets/home_ctegories.dart';
import 'package:mobile_app/features/shop/screens/home/widgets/promo_slider.dart';
import '../../../../common/widgets/custom_shapes/container/primary_header_container.dart';
import '../../../../common/widgets/custom_shapes/container/search_container.dart';
import '../../../../common/widgets/layouts/grid_layout.dart';
import '../../../../common/widgets/products/product_cards/product_card_vertical.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../all_products/all_products.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const TPrimaryheaderContainer(
              child: Column(
                children: [

                  ///App Bar
                  THomeAppBar(),
                  SizedBox(height: TSizes.spaceBtwSections),

                  /// search bar

                  TSearchContainer(text: 'Search in Store'),
                  SizedBox(height: TSizes.spaceBtwSections),

                  /// categories

                  Padding(
                    padding: EdgeInsets.only(left: TSizes.defaultSpace),
                    child: Column(
                      children: [

                        ///heading
                        TSectionHeading(
                          title: 'Popular Categories',
                          showActionButton: false,
                          textColor: TColors.white,
                        ),
                        SizedBox(height: TSizes.spaceBtwItems),

                        ///categories

                        THomeCategories(),
                      ],
                    ),
                  ),
                  SizedBox(height: TSizes.spaceBtwSections),
                ],
              ),
            ),

            ///body

            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),

              child: Column(
                children: [

                  /// promo slider
                  const TPromoSlider(banners: [
                    TImages.promobanner,
                    TImages.promobanner2,
                    TImages.promobanner3
                  ],),
                  const SizedBox(height: TSizes.spaceBtwSections),

                  ///Heading
                  TSectionHeading(title: 'Popular Products',onPressed: ()=>Get.to(()=>const AllProducts())),
                  const SizedBox(height: TSizes.spaceBtwSections),

                  ///popular products

                  TGridLayout(itemCount: 2, itemBuilder: (_,index)=>const TProductCardVertical()),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}


