
import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/helpers/helper_functions.dart';
import '../custom_shapes/container/circular_container.dart';

class TChoiceChip extends StatelessWidget {
  const TChoiceChip({
    super.key,
    required this.text,
    required this.selected,
    this.onSelected,
  });

  final String text;
  final bool selected;
  final void Function(bool)? onSelected;

  @override
  Widget build(BuildContext context) {
    final isColor=THelperFunctions.getColor(text) !=null;
    final dark=THelperFunctions.isDarkMode(context);

    return Theme(
      data: Theme.of(context).copyWith(canvasColor: Colors.transparent),
      child: ChoiceChip(
        label: isColor ? const SizedBox() : Text(text),
        selected: selected,
        onSelected: onSelected,
        labelStyle: TextStyle(color: selected ? TColors.white : dark?TColors.white:TColors.dark),
        avatar: isColor? TCircularContainer(width: 50, height: 50, backgroundColor: THelperFunctions.getColor(text)!) : null,
        labelPadding: isColor
            ? const EdgeInsets.all(0)
            : null, // Make icon in the center
        padding: isColor
            ? const EdgeInsets.all(0)
            : null,
        shape: isColor
            ? const CircleBorder()
            : null,
        backgroundColor: isColor
            ? THelperFunctions.getColor(text)!
            : null,
      ),
    );
  }
}
