import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mobile_app/features/personalization/screens/settings/settings.dart';
import 'package:mobile_app/features/shop/screens/home/home.dart';
import 'package:mobile_app/features/shop/screens/store/store.dart';
import 'package:mobile_app/features/shop/screens/wishlist/wishlist.dart';
import 'package:mobile_app/utils/constants/colors.dart';
import 'package:mobile_app/utils/helpers/helper_functions.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    final darkMode = THelperFunctions.isDarkMode(context);

    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
          height: 80,
          elevation: 0,
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index) => controller.selectedIndex.value = index,
          backgroundColor: darkMode ? TColors.black : Colors.white,
          indicatorColor: darkMode ? TColors.white.withOpacity(0.1) : TColors.black.withOpacity(0.1),
          destinations: const [
            NavigationDestination(icon: Icon(Iconsax.home), label: 'Home'),
            NavigationDestination(icon: Icon(Iconsax.shop), label: 'Store'),
            NavigationDestination(icon: Icon(Iconsax.heart), label: 'Wishlist'),
            NavigationDestination(icon: Icon(Iconsax.user), label: 'Profile'),
          ],
        ),
      ),
      body: Obx(() {
        switch (controller.selectedIndex.value) {
          case 0:
            return const HomeScreen();
          case 1:
            return const StoreScreen();
          case 2:
            //return const FavoriteScreen();
          case 3:
            return const SettingsScreen();
          default:
            return Container(); // Return a default widget or handle the case as needed
        }
      }),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;
}
