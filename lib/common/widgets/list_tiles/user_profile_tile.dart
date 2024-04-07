import 'package:flutter/material.dart';

class TUserProfileTile extends StatelessWidget {
  const TUserProfileTile({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTitle(
      leading: const TCircularImage(
          image: TImages.user, width: 50, height: 50, padding: 0),
      title: Text('Coding with T',
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .apply(color: TColors.white)),
      subtitile: Text('support@example.com',
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .apply(color: TColors.white)),
      trailing: IconButton(
          onPressed: (), icon: const Icon(Iconsax.edit, color: TColors.white)),
    );
  }
}
