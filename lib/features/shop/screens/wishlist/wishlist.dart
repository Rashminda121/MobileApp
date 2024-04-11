import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/icons/t_circular_icon.dart';
import '../../../../common/widgets/layouts/grid_layout.dart';
import '../../../../common/widgets/products/product_cards/product_card_vertical.dart';
import '../../../../utils/constants/sizes.dart';
import '../home/home.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<FavouritesController>();
    return Scaffold(
      appBar: TAppBar(
        title: Text(
          'Wishlist',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        actions: [
          TCircularIcon(
              icon: Iconsax.add, onPressed: () => Get.to(const HomeScreen())),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.spaceDefault),
          child: obx(() => FutureBuilder(
                future: controller.favoriteProducts(),
                builder: (context, snapshot) {
                  final emptyWidget = TAnimationLoaderWidget(
                    text: 'Whoops! Wishlist is Empty...',
                    animation: TImages.pencilAnimation,
                    showAction: true,
                    actionText: 'Let\'s add some',
                    onActionPressed: () =>
                        Get.off(() => const NavigationMenu()),
                  );
                  const loader = TVerticalProductShimmer(itemCount: 6);
                  final widget = TCloudHelperFunctions.checkMultiRecordState(
                    snapshot: snapshot,
                    loader: loader,
                    nothingFound: emptyWidget,
                  );
                  if (widget != null) return widget;
                  final products = snapshot.data!;
                  return TGridLayout(
                      itemCount: products.length,
                      itemBuilder: (context, index) =>
                          TProductCardVertical(product: products[index]));
                },
              )),
        ),
      ),
    );
  }
}
