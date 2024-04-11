import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../../../utils/constants/sizes.dart';
import '../../models/produt_model.dart';

class ImagesController extends GetxController {
  static ImagesController get instance => Get.find();

  /// Variables
  RxString selectedProductImage = ''.obs;

  /// -- Get All Images from product and Variations
  /// -- Get All Images from product and Variations
  List<String> getAllProductImages (ProductModel product) {
    // Use Set to add unique images only
    Set<String> images = {};
    // Load thumbnail image
    images.add(product.thumbnail);
    // Assign Thumbnail as Selected Image
    selectedProductImage.value = product.thumbnail;
    // Get all images from the Product Model if not null.
    if (product.images != null) {
    }
    images.addAll(product.images!);
    // Get all images from the Product Variations if not null.
    if (product.productVariations != null || product.productVariations!.isNotEmpty) {
    images.addAll(product.productVariations!.map((variation) => variation.image));
    }
    return images.toList();
  }

  /// -- Show Image Popup
  void showEnlargedImage(String image) {
    Get.to(
          () => Dialog.fullscreen(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: TSizes.defaultSpace * 2,
                  horizontal: TSizes.defaultSpace),
              child: CachedNetworkImage(imageUrl: image),
            ), // Padding
            const SizedBox(height: TSizes.spaceBtwSections),
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                width: 150,
                child: OutlinedButton(
                    onPressed: () => Get.back(), child: const Text('Close')),
              ), // SizedBox
            ), // Align
          ],
        ), // Column
        D, // Dialog.fullscreen
      ),
    );
  }
  }


}