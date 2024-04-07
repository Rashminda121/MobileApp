
import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';

class TCircularIcon extends StatelessWidget {
  const TCircularIcon({
    super.key,
    this.width,
    this.height,
    this.size=TSizes.lg,
    required this.icon,
    this.color,
    this.backgroundColor,
    this.onPressed,
  });

  final double? width;
  final double? height;
  final double? size;
  final IconData icon;
  final Color? color;
  final Color? backgroundColor;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final dark =THelperFunctions.isDarkMode(context);
    return Container(
      width: width,
      height: height,

      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: backgroundColor !=null ? backgroundColor! : dark
              ? TColors.black.withOpacity(0.9)
              : TColors.white.withOpacity(0.9)),
      child: IconButton(onPressed: onPressed, icon: Icon(icon,color: color,size: size)),
    );
  }
}
