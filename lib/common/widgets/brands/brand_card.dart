import 'package:flutter/material.dart';

import '../../../../../common/styles/rounded_container.dart';
import '../../../../../common/widgets/images/t_circular_image.dart';
import '../../../../../common/widgets/texts/t_brand_title_text_with_verified_icon.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/enums.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class TBrandCard extends StatelessWidget {
  const TBrandCard({
    super.key,this.showBorder=true, this.onTap,
  });
  final bool showBorder;
  final void Function()?onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: TRoundedContainer(
        padding: const EdgeInsets.all(TSizes.sm),
        showBorder: false,
        backgroundColor: Colors.transparent,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            /// -- Icon
            Flexible(
              child: TCircularImage (
                isNetworkImage: false,
                image: TImages.product1,
                backgroundColor: Colors.transparent,
                overlayColor: THelperFunctions.isDarkMode (context) ? TColors.white: TColors.black,
              ),
            ),
            const SizedBox(width: TSizes.spaceBtwItems/2),

            ///Text
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  const TBrandTitleWithVerifiedIcon(title: 'Nike',brandTextSize: TextSizes.large),

                  Text(
                    '256 products sample text',
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ],
              ),
            )


          ],
        ),
      ),
    );
  }
}