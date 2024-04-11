import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_app/features/shop/controllers/banner_controller.dart';

import '../../../../../common/widgets/custom_shapes/container/circular_container.dart';
import '../../../../../common/widgets/images/t_rounded_image.dart';
import '../../../../../common/widgets/shimmers/shimmer.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../controllers/home_controller.dart';

class TPromoSlider extends StatelessWidget {
  const TPromoSlider({
    super.key,
  });



  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BannerController());
    return Obx(
        (){


          // Loader
          if (controller.isLoading.value) return const TShimmerEffect(width: double.infinity, height: 190);

          // No data found
          if (controller.banners.isEmpty) {
            return const Center(child: Text('No Data Found!'));
          } else {
            // Additional code would go here for displaying banners when data is available
            return  Column(
              children: [
                CarouselSlider(
                    options: CarouselOptions(
                        viewportFraction: 1,
                        onPageChanged: (index, _) =>
                            controller.updatePageIndicator(index)),
                    items: controller.banners.map((banner) => TRoundedImage(imageUrl: banner.imageUrl,isNetworkImage: true,onPressed: ()=>Get.toNamed(banner.targetScreen),)).toList()
                ),
                const SizedBox(height: TSizes.spaceBtwItems),
                Center(
                  child: Obx(
                        () => Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        for (int i = 0; i < controller.banners.length; i++)
                          TCircularContainer(
                              width: 20,
                              height: 4,
                              margin: const EdgeInsets.only(right: 10),
                              backgroundColor: controller.carousalCurrentIndex.value == i? TColors.primary:TColors.grey),
                      ],
                    ),
                  ),
                )
              ],
            );
          }


        }
    );
  }
}
