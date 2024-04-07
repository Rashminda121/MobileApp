import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mobile_app/utils/constants/colors.dart';
import 'package:mobile_app/utils/constants/sizes.dart';
import 'package:mobile_app/utils/helpers/helper_functions.dart';

class TOrderListItems extends StatelessWidget {
  const TOrderListItems({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return ListView.separated(
        shrinkWrap: true,
        itemCount: 10,
        separatorBuilder: (_, __) =>
            const SizedBox(height: TSizes.spaceBtwItems),
        itemBuilder: (_, index) => TRoundedContainer(
            showBorder: true,
            padding: const EdgeInsets.all(TSizes.md),
            backgorundColor: dark ? TColors.dark : TColors.light,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                //row 1
                Row(
                  children: [
                    // icon 1
                    const Icon(Iconsax.ship),
                    const SizedBox(width: TSizes.spaceBtwItems / 2),

                    //status and date
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Processing',
                            style: Theme.of(context).textTheme.bodyLarge!.apply(
                                color: TColors.primary, fontWeightDelta: 1),
                          ),
                          Text(
                            '07 Nov 2024',
                            style: Theme.of(context).textTheme.headlineSmall,
                          )
                        ],
                      ),
                    ),

                    //icon 3
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(Iconsax.arrow_right_34,
                            size: TSizes.iconSm))
                  ],
                ),
                const SizedBox(
                  height: TSizes.spaceBtwItems,
                ),

                //row 2
                Row(
                  children: [
                    //row 1
                    Expanded(
                      child: Row(
                        children: [
                          // icon 1
                          const Icon(Iconsax.tag),
                          const SizedBox(width: TSizes.spaceBtwItems / 2),

                          //status and date
                          Expanded(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Order',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .apply(
                                          color: TColors.primary,
                                          fontWeightDelta: 1),
                                ),
                                Text(
                                  '#45d5a',
                                  style:
                                      Theme.of(context).textTheme.headlineSmall,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    //row 2
                    Expanded(
                      child: Row(
                        children: [
                          // icon 1
                          const Icon(Iconsax.calendar),
                          const SizedBox(width: TSizes.spaceBtwItems / 2),

                          //status and date
                          Expanded(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Shipping Date',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .apply(
                                          color: TColors.primary,
                                          fontWeightDelta: 1),
                                ),
                                Text(
                                  '07 Nov 2024',
                                  style:
                                      Theme.of(context).textTheme.headlineSmall,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            )));
  }
}
