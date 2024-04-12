
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:mobile_app/features/shop/controllers/brand_controller.dart';
import 'package:mobile_app/features/shop/models/brand_model.dart';
import 'package:mobile_app/features/shop/screens/brand/brand_shimmer.dart';
import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/brands/brand_card.dart';
import '../../../../common/widgets/layouts/grid_layout.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import '../../../../utils/constants/sizes.dart';
import 'brand_product.dart';

class AllBrandsScreen extends StatelessWidget {
  const AllBrandsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final brandController = BrandController.instance;
    return Scaffold(
      appBar: const TAppBar(title: Text('Brand'), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              /// Heading
              const TSectionHeading(title: 'Brands',showActionButton: false,),
              const SizedBox(height: TSizes.spaceBtwItems),

              /// -- Brands
                        Obx(
                          (){
                            if (brandController.isLoading.value) return const TBrandsShimmer();
                            if (brandController.allBrands.isEmpty){
                              return Center(child: Text('No Data Found!', style: Theme.of(context).textTheme.bodyMedium!.apply(color:Colors.white)));
                            }
                            return TGridLayout(
                              itemCount: brandController.allBrands.length,
                              mainAxisExtent: 80,
                              itemBuilder: (_, index) {
                                final brand = brandController.allBrands[index];
                                return TBrandCard(showBorder: true, brand: brand,
                                onTap:() => Get.to(()=> BrandProducts(brand:brand)),
                        );},);
                          },
                        ),


            ],
          ),
        ),
      ),
    );
  }
}