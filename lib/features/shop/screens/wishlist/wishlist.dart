import 'dart:js';

import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:iconsax/iconsax.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
          title: Text('Wishlist',
              style: Theme.of(context).textTheme.headlineMedium),
          actions: [
            TCircularIcon(
                icon: Iconsax.add, onPressed: () => Get.to(const HomeScreen())),
          ]),
      body: SingleChildScrollView(
          padding: const EdgeInsets.all(Tsizes.defaultSpace),
          child: Column(
            children: [
              TGridLayout(
                  itemCount: 4,
                  itemBuilder: (context, index) => TProductCardVertical()),
            ],
          )),
    );
  }
}
