import 'package:flutter/material.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/images/t_rounded_image.dart';
import '../../../../common/widgets/products/product_cards/product_card_horizontal.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';

class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen({super.key});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final controller = CategoryController.instance;
    return Scaffold(
      appBar: TAppBar(title: Text(category.name), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
            child: Column(
              children: [
                const TRoundedImage(
                    width: double.infinity,
                    imageUrl: TImages.promobanner,
                    applyImageRadius: true),
                const SizedBox(height: TSizes.spaceBtwSections),

                //sub categories
                FutureBuilder(
                    future: controller.getSubCategories(category.id),
                    builder: (context, snapshot) {
                      //handle prder, no record or error message
                      const loader = THorizontalProductShimmer();
                      final widget =
                          TCloudeHelperFunctions.checkMultiRecordState(
                              snapshot: snapshot, loader: loader);
                      if (widget != null) return widget;

                      //record found
                      final subCategories = snapshot.data!;

                      return ListView.builder(
                        shrinkWrap: true,
                        itemCount: subCategories.length,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (_,index){

                          final subCategory = subCategories[index];
                      
                      return FutureBuilder(
                        future: controller.getCategoryProducts(categoryId:subCategory.id),
                        builder: (context, snapshot) {

                             //handle prder, no record or error message
             
                      final widget =
                          TCloudeHelperFunctions.checkMultiRecordState(
                              snapshot: snapshot, loader: loader);
                      if (widget != null) return widget;

                      //record found
                      final subCategories = snapshot.data!;

                          return Column(
                            children: [
                              ///heading
                          
                              TSectionHeading(
                                title: subCategory.name
                                onPressed: () => Get.to (
                                  ()=> AllProducts(
                                    title: subCategory.name,
                                    futureMethod: controller.getcategoryProducts(CategoryId: subCategory.id,limit: -1),
                                  ),
                                ),
                              ),
                              const SizedBox(height: TSizes.spaceBtwItems / 2),
                          
                              SizedBox(
                                height: 120,
                                child: ListView.separated(
                                    itemCount: products.length,
                                    scrollDirection: Axis.horizontal,
                                    separatorBuilder: (context, index) =>
                                        const SizedBox(width: TSizes.spaceBtwItems),
                                    itemBuilder: (context, index) =>
                                         TProductCardHorizontal(products:products[index]),
                                ),
                              ),
                            ],
                          );
                        }
                      );
                    },
                  );
                  }
                ),
              ],
            )),
      ),
    );
  }
}
