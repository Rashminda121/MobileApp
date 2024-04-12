import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mobile_app/common/widgets/products/favourite_icon/favourite_icon.dart';
import 'package:mobile_app/features/shop/controllers/product/images_controller.dart';
import 'package:mobile_app/features/shop/models/product_model.dart';

import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import '../../../../../common/widgets/icons/t_circular_icon.dart';
import '../../../../../common/widgets/images/t_rounded_image.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';


class TProductImageSlider extends StatelessWidget {
  const TProductImageSlider({
    super.key, required this.product,
  });

final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    final controller =Get.put(ImagesController());
    final images= controller.getAllProductImages(product);


    return TCurvedEdgesWidget(
      child: Container(
        color: dark ? TColors.darkerGrey : TColors.light,
        child: Stack(
          children: [
            /// Main Large Image
             SizedBox(
              height: 400,
              child: Padding(
                padding: EdgeInsets.all(TSizes.productImageRadius * 2),
                child: Center(
                    child: Obx((){
                      final image= controller.selectedProductImage.value;
                      return GestureDetector(
                        onTap: ()=>controller.showEnlargedImage(image),
                          child:CachedNetworkImage(
                          imageUrl:image,
                          progressIndicatorBuilder:(_,__,downloadProgress)=>
                          CircularProgressIndicator(value:downloadProgress.progress,color:TColors.primary)
                      ));
                    }
              )),
              ),
            ),

            /// image slider
            Positioned(
              right: 0,
              bottom: 30,
              left: TSizes.defaultSpace,
              child: SizedBox(
                height: 80,
                child: ListView.separated(
                  itemCount: images.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemBuilder: (_, index) => Obx(
                      (){
                        final imageSelected= controller.selectedProductImage.value==images[index];
                        return TRoundedImage(
                          width: 80,
                          isNetworkImage: true,
                          backgroundColor:
                          dark ? TColors.dark : TColors.white,
                          padding: const EdgeInsets.all(TSizes.sm),
                          imageUrl: images[index],
                          onPressed: ()=>controller.selectedProductImage.value=images[index],
                          border: Border.all(color: imageSelected?TColors.primary:Colors.transparent),
                        );
                      }
                  ),
                  separatorBuilder: (_, __) =>
                  const SizedBox(width: TSizes.spaceBtwItems),
                ),
              ),
            ),

            ///App Bar Icons
             TAppBar(
              showBackArrow: true,
              actions: [TFavouriteIcon(productId: product.id),
                
              ],
            ),




          ], // TCurvedEdgesWidget
        ),
      ),
    );
  }
}

