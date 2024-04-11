import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mobile_app/common/widgets/loaders/shimmer.dart';
import 'package:mobile_app/features/personalization/controllers/user_controller.dart';
import 'package:mobile_app/features/personalization/screens/profile/widgets/profile_menu.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/images/t_circular_image.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: const TAppBar(title: Text('Profile'), showBackArrow: true),

      ///-- Body
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          children: [
            ///Profile Picture
            SizedBox(
              width: double.infinity,
              child: Column(
                children: [
                  Obx(() {
                    final networkImage = controller.user.value.profilePicture;
                    final image =
                        networkImage.isNotEmpty ? networkImage : TImages.user;

                    return controller.imageUploading.value
                        ? const TShimmerEffect(
                            width: 80, height: 80, radius: 80)
                        : TCircularImage(
                            image: image,
                            width: 80,
                            height: 80,
                            isNetworkImage: networkImage.isNotEmpty);
                  }),
                  TextButton(
                      onPressed: () => controller.uploadUserProfilePicture(),
                      child: const Text('Change Profile Picture')),
                ],
              ),
            ),

            ///Details
            const SizedBox(height: TSizes.spaceBtwItems / 2),
            const Divider(),
            const SizedBox(height: TSizes.spaceBtwItems),

            /// Heading Profile Info
            const TSectionHeading(
                title: 'Profile Information', showActionButton: false),
            const SizedBox(height: TSizes.spaceBtwItems),

            TProfileMenu(
                title: 'Name',
                value: controller.user.value.fullName,
                onPressed: () {}),
            TProfileMenu(
                title: 'Username',
                value: controller.user.value.username.toString(),
                onPressed: () {}),

            const SizedBox(height: TSizes.spaceBtwItems),
            const Divider(),
            const SizedBox(height: TSizes.spaceBtwItems),

            /// Heading Personal Info
            const TSectionHeading(
                title: 'Personal Information', showActionButton: false),
            const SizedBox(height: TSizes.spaceBtwItems),

            TProfileMenu(
                title: 'User ID',
                value: controller.user.value.id,
                icon: Iconsax.copy,
                onPressed: () {}),
            TProfileMenu(
                title: 'E-mail',
                value: controller.user.value.email,
                onPressed: () {}),
            TProfileMenu(
                title: 'Phone Number',
                value: controller.user.value.phoneNumber,
                onPressed: () {}),
            TProfileMenu(title: 'Gender', value: 'Male', onPressed: () {}),
            TProfileMenu(
                title: 'Date of Birth',
                value: '10 Oct, 2024',
                onPressed: () {}),

            const Divider(),
            const SizedBox(height: TSizes.spaceBtwItems),

            Center(
              child: TextButton(
                onPressed: () {},
                child: const Text('Close Account',
                    style: TextStyle(color: Colors.red)),
              ),
            ),
          ],
        ),
      )),
    ); // Scaffold
  }
}
