
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_app/common/widgets/shimmers/vertical_product_shimmer.dart';
import 'package:mobile_app/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:mobile_app/features/shop/screens/home/widgets/promo_slider.dart';
import '../../../../common/widgets/custom_shapes/container/primary_header_container.dart';
import '../../../../common/widgets/custom_shapes/container/search_container.dart';
import '../../../../common/widgets/layouts/grid_layout.dart';
import '../../../../common/widgets/products/product_cards/product_card_vertical.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../controllers/product_controller.dart';
import '../all_products/all_products.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller=Get.put(ProductController());
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
                  const TPromoSlider(),
                  const SizedBox(height: TSizes.spaceBtwSections),

                  ///Heading
                  TSectionHeading(
                    title: 'Popular Products',
                    onPressed: () => Get.to(() => AllProducts(
                      title: 'Popular Products',
                      futureMethod: controller.fetchAllFeaturedProducts(),
                    )),
                  ),
                  const SizedBox(height: TSizes.spaceBtwSections),

                  ///popular products

                  Obx((){
                    if(controller.isLoading.value)return const TVerticalProductShimmer();

                    if(controller.featuredProducts.isEmpty){
                      return Center(child: Text('No Data Found!',style: Theme.of(context).textTheme.bodyMedium));
                    }
                    return TGridLayout(itemCount: controller.featuredProducts.length, itemBuilder: (_,index)=> TProductCardVertical(product: controller.featuredProducts[index]));
                  } ),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}


