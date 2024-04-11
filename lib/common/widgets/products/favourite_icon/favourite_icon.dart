import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../icons/t_circular_icon.dart';

class TFavouriteIcon extends StatelessWidget {
  const TFavouriteIcon({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FavouritesController());
    return Obx(
      () => TCircularIcon(
        icon:
            controller.isFavourite(productId) ? Iconsax.heart5 : Iconsax.heart,
        color: controller.isFavourite(productId) ? TColors.error : null,
        onPressed: () => controller.toggleFavoriteProduct(productId),
      ), // TCircularIcon
    ); // Obx
  }
}
