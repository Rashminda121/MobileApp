
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_app/features/shop/models/product_model.dart';

import '../../../../../common/styles/rounded_container.dart';
import '../../../../../common/widgets/chips/choice_chip.dart';
import '../../../../../common/widgets/texts/product_price_text.dart';
import '../../../../../common/widgets/texts/product_title_text.dart';
import '../../../../../common/widgets/texts/section_heading.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';
import '../../../controllers/product/variation_controller.dart';

class TProductAttributes extends StatelessWidget {
  const TProductAttributes({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final dark=THelperFunctions.isDarkMode(context);
    final controller= Get.put(VariationController());
    return Obx(
        ()=> Column(
        children: [
      
          if (controller.selectedVariation.value.id.isNotEmpty)
          TRoundedContainer(
            padding: const EdgeInsets.all(TSizes.md),
            backgroundColor: dark? TColors.darkerGrey:TColors.grey,
            child:Column(
              children: [
                ///title,price and stock status
                Row(
                  children: [
                    const TSectionHeading(title: 'Variation',showActionButton: false),
                    const SizedBox(width: TSizes.spaceBtwItems),
      
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
      
                        Row(
                          children: [
                            const TProductTitleText(title: 'Price: ',smallSize: true),
      
                            /// Actual Price
                            if(controller.selectedVariation.value.salePrice>0)
                            Text(
                              '\$${controller.selectedVariation.value.price}',
                              style: Theme.of(context).textTheme.titleSmall!.apply(
                                decoration: TextDecoration.lineThrough,
                              ),
                            ),
                            const SizedBox(width: TSizes.spaceBtwItems),
      
                            ///sale price
                            TProductPriceText(price: controller.getVariationPrice()),
                          ],
                        ),
      
                        ///stack
                        Row(
                          children: [
                            const TProductTitleText(title: 'Stock: ', smallSize: true),
                            Text(controller.variationStockStatus.value, style: Theme.of(context).textTheme.titleMedium),
                          ],
                        ),
      
      
                      ],
                    ),
      
                  ],
                ),
      
                /// Variation Description
      
               TProductTitleText(
                  title: controller.selectedVariation.value.description ?? '',
                  smallSize: true,
                  maxLines: 4,
                ),
      
              ],
            ),
          ),
          const SizedBox(height: TSizes.spaceBtwItems),
      
          ///atributes
      
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: product.productAttributes!.map((attribute)=>Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              TSectionHeading(title: attribute.name ??'' ,showActionButton: false,),
              const SizedBox(height: TSizes.spaceBtwItems / 2),
              Obx(
                  ()=>Wrap(
                  spacing: 8,
                  children: attribute.values!.map((attributeValue) {
      
                    final isSelected = controller.selectedAttributes[attribute.name] == attributeValue;
                    final available = controller
                        .getAttributesAvailabilityInVariation(product.productVariations!, attribute.name!)
                        .contains(attributeValue);
      
                    return TChoiceChip(
                      text: attributeValue,
                      selected: isSelected,
                      onSelected: available
                          ? (selected) {
                        if (selected && available) {
                          // Do something
                        }
                        controller.onAttributeSelected(product, attribute.name ?? '', attributeValue);
                      }
                          : null,
                    );
                  }
      
      
                  ).toList()
                 ),
              ),
              ],
            ),).toList(),
          ),
      
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TSectionHeading(title: 'Colors' ,showActionButton: false,),
              const SizedBox(height: TSizes.spaceBtwItems / 2),
              Wrap(
                spacing: 8,
                children: [
                  TChoiceChip(text: 'Green',selected: true ,onSelected: (value){}),
                  TChoiceChip(text: 'Blue',selected: false,onSelected: (value){}),
                  TChoiceChip(text: 'Red',selected: false,onSelected: (value){}),
      
      
                ],
              )
            ],
          ),
      
      
        ],
      ),
    );
  }
}


