import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mobile_app/features/shop/controllers/product/all_product_controller.dart';
import 'package:mobile_app/features/shop/models/produt_model.dart';

import '../../../../utils/constants/sizes.dart';
import '../../layouts/grid_layout.dart';
import '../product_cards/product_card_vertical.dart';

class TSortableProducts extends StatelessWidget {
  const TSortableProducts({
    super.key, required this.products,
  });

  final List<ProductModel> products;


  @override
  Widget build(BuildContext context) {

    final controller =Get.put(AllProductsController());
    controller.assignProducts(products);
    return Column(
      children: [
        /// Dropdown
        DropdownButtonFormField(
          decoration: const InputDecoration(prefixIcon: Icon(Iconsax.sort)),
          value: controller.selectedSortOption.value,
          onChanged: (value) {
            controller.sortProducts(value!);
          },
          items: ['Name','Higher Price','Lower Price','Sale','Newest','Popularity'].map((option) =>DropdownMenuItem(value:option,child: Text(option))).toList(),
        ),
        const SizedBox(height: TSizes.spaceBtwSections),

        ///products

        Obx(()=> TGridLayout(itemCount: controller.products.length, itemBuilder: (_,index)=>TProductCardVertical(product: controller.products[index],))),


      ],
    );
  }
}