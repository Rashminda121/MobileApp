import 'package:flutter/material.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/products/sortable/sortable_products.dart';
import '../../../../utils/constants/sizes.dart';

class AllProducts extends StatelessWidget {
  const AllProducts({super.key});

  final String title;
  final Query? query;
  final Future<List<ProductionModel>>? futureMethod;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AllProductsController());

    return Scaffold(
      appBar: TAppBar(title: Text(title), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: FutureBuilder(
            future: futureMethod ?? controller.fetchProducts(query),
            builder: (context, snapshot) {
              //handle prder, no record or error message
              const loader = THorizontalProductShimmer();
              final widget = TCloudeHelperFunctions.checkMultiRecordState(
                  snapshot: snapshot, loader: loader);
              if (widget != null) return widget;

              //record found
              final products = snapshot.data!;

              return TSortableProducts(
                products: products,
              );
            },
          ),
        ),
      ),
    );
  }
}
