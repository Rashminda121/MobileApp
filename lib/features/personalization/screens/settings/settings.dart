import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mobile_app/common/widgets/list_tiles/user_profile_tile.dart';

import '../../../../common/widgets/list_tiles/settings_menu_tiles.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Column(
              children: [
                TPrimaryHeaderContainer(
                  child: Column(
                    children: [
                      TAppBar(title: Text('Account', style: Theme
                          .of(context)
                          .textTheme
                          .headlineMedium!
                          .apply(color: TColor:white))),

                      const TUserProfileTile()
                      const SizedBox(height: Tsizes.spaceBtwSections),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(TSizes.defaultSpace),
                  child: Column(
                    children: [

                      //account settings
                      TSectionHeading(title: 'Account Settings', showActionButton: false),
                      SizedBox((height: TSizes.spaceBtwItems),


                      
                          TSettingsMenuTile(
                            icon: Iconsax.safe_home,
                            title: 'My Addresses',
                            subtitle: 'Set Shopping Delivery Address',
                            onTap: () => Get.to(() => const UserAddressScreen()),
                          ),

                          TSettingsMenuTile(
                            icon: Iconsax.shopping_cart,
                            title: 'My Cart',
                            subtitle: 'Add, remove products and move to checkout',
                          ),

                          TSettingsMenuTile(
                            icon: Iconsax.bag_tick,
                            title: 'My Orders',
                            subtitle: 'In-progress and completed orders',
                          ),

                          TSettingsMenuTile(
                            icon: Iconsax.bank,
                            title: 'Bank Account',
                            subtitle: 'Withdraw balance to registered bank account',
                          ),

                           TSettingsMenuTile(
                            icon: Iconsax.discount_shope, 
                            title: 'My Coupons', 
                            subtitle: 'List of all the discounted coupons'
                          ),

                           TSettingsMenuTile(
                            icon: Iconsax.notification, 
                            title: 'Notifications', 
                            subtitle: 'Set any kind of notification message'
                          ),

                          TSettingsMenuTile(
                            icon: Iconsax.security_card, 
                            title: 'Account Privacy', 
                            subtitle: 'Manage data usage and connected accounts'
                          ),


                        //app settings
                        SizedBox(height: TSizes.spaceBtwSections),
                        TSectionHeading(title: 'App Settings', showActionButton: false),
                        SizedBox(height: TSizes.spaceBtwItems),
                        TSettingsMenuTile(
                          icon: Iconsax.upload,
                          title: 'Load Data',
                          subtitle: 'Upload data to your cloud firebase',
                        ),

                        TSettingsMenuTile(
                          icon: Iconsax.security_user,
                          title: 'Safe Mode',
                          subtitle: 'Search results in safe fpr all ages',
                          trailing: Switch(value: true, onChanged: (value) {}),
                        ), 

                        TSettingsMenuTile(
                          icon: Iconsax.image,
                          title: 'HD Image Quality',
                          subtitle: 'Set Image quality to HD',
                          trailing: Switch(value: true, onChanged: (value) {}),
                        ), 


                      )
                    ],
                  ),
                )
              ],
            )));
  }
}
