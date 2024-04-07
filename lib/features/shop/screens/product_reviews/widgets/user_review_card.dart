
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

import '../../../../../common/styles/rounded_container.dart';
import '../../../../../common/widgets/products/ratings/rating_indicator.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class UserReviewCard extends StatelessWidget {
  const UserReviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const CircleAvatar(
                    backgroundImage: AssetImage(TImages.profile1)),
                const SizedBox(width: TSizes.spaceBtwItems),
                Text(' John Doe ',
                    style: Theme.of(context).textTheme.titleLarge),
              ],
            ), // Row
            IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
          ],
        ), // Row
        const SizedBox(height: TSizes.spaceBtwItems),

        ///Review

        Row(
          children: [
            const TRatingBarIndicator(rating: 4),
            const SizedBox(width: TSizes.spaceBtwItems),
            Text('01 Nov, 2023', style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),

        const SizedBox(height: TSizes.spaceBtwItems),
        const ReadMoreText(
          'The user interface of the app is quite intuitive. I was able to navigate and make purchases seamlessly. Great job!',
          trimLines: 1,
          trimExpandedText: 'show less',
          trimCollapsedText: 'show more',
          trimMode: TrimMode.Line,
          moreStyle: TextStyle(fontWeight: FontWeight.bold,fontSize: 14,color: TColors.primary),
          lessStyle: TextStyle(fontWeight: FontWeight.bold,fontSize: 14,color: TColors.primary),
        ),
        const SizedBox(height: TSizes.spaceBtwItems),

        ///Review
        TRoundedContainer(
          backgroundColor: dark ? TColors.darkerGrey : TColors.grey,
          child: Padding(
            padding: const EdgeInsets.all(TSizes.md),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Store", style: Theme.of(context).textTheme.titleMedium),
                    Text('02 Nov, 2023', style: Theme.of(context).textTheme.bodyMedium),
                  ],
                ),
                const SizedBox(height: TSizes.spaceBtwItems),
                const ReadMoreText(
                  'Thank You For your Feedback! The user interface of the app is quite intuitive. I was able to navigate and make purchases seamlessly. Great job!',
                  trimLines: 1,
                  trimExpandedText: 'show less',
                  trimCollapsedText: 'show more',
                  trimMode: TrimMode.Line,
                  moreStyle: TextStyle(fontWeight: FontWeight.bold,fontSize: 14,color: TColors.primary),
                  lessStyle: TextStyle(fontWeight: FontWeight.bold,fontSize: 14,color: TColors.primary),
                ),


              ],
            ),
          ),
        ),


        const SizedBox(height: TSizes.spaceBtwSections),
      ],

    );
  }
}
