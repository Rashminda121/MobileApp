import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mobile_app/common/widgets/loaders/animation_loader.dart';
import 'package:mobile_app/common/widgets/products/favourites_controller.dart';
import 'package:mobile_app/common/widgets/shimmers/vertical_product_shimmer.dart';
import 'package:mobile_app/navigation_menu.dart';
import 'package:mobile_app/utils/constants/image_strings.dart';
import 'package:mobile_app/utils/helpers/cloud_helper_functions.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/icons/t_circular_icon.dart';
import '../../../../common/widgets/layouts/grid_layout.dart';
import '../../../../common/widgets/products/product_cards/product_card_vertical.dart';
import '../../../../features/shop/screens/home/home.dart';
import '../../../../features/shop/models/product_model.dart'; // Import ProductModel
import '../../../../utils/constants/sizes.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = FavouritesController.instance;
    return Scaffold(
      appBar: TAppBar(
        title: Text(
          'Wishlist',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        actions: [
          TCircularIcon(
            icon: Iconsax.add,
            onPressed: () => Get.to(const HomeScreen()),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
        
            child: FutureBuilder(
              future: controller.favoriteProducts(),
              builder: (context, snapshot) {
                final emptyWidget = TAnimationLoaderWidget(text: 'Whoops! Empty', animation: TImages.shoeIcon,showAction: true,actionText: 'Let\'s add some',onActionPressed: () => Get.off(() => const NavigationMenu()),);
                const loader = TVerticalProductShimmer(itemCount: 6);
                final widget = TCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot, loader: loader, nothingFound: emptyWidget);
                if (widget != null) return widget;
                final products = snapshot.data!;
                return TGridLayout(
                    itemCount: products.length,
                    itemBuilder: (_, index) => TProductCardVertical(
                      product: products[index] // Pass ProductModel object here
                    )
                  );
              }
            ),
            
          ),
        ),
      );
  
  }
}
