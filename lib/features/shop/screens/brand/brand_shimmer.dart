import 'package:flutter/material.dart';
import 'package:mobile_app/common/widgets/layouts/grid_layout.dart';
import 'package:mobile_app/common/widgets/loaders/shimmer.dart';

class TBrandsShimmer extends StatelessWidget {
  const TBrandsShimmer({super.key, this.itemCount = 4});
final int itemCount;
  @override
  Widget build(BuildContext context) {
    return TGridLayout(
      mainAxisExtent: 80,
      itemCount: itemCount,
      itemBuilder: (_, __) => const TShimmerEffect(width: 300, height: 80),
    );
  }
        
}