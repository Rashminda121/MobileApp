
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mobile_app/common/widgets/shimmers/vertical_product_shimmer.dart';
import 'package:mobile_app/features/shop/screens/product_details/widgets/product_attributes.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/products/sortable/sortable_products.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/cloud_helper_functions.dart';
import '../../controllers/product/all_product_controller.dart';
import '../../models/produt_model.dart';

class AllProducts extends StatelessWidget {
  const AllProducts({super.key, required this.title, this.query, this.futureMethod});
  
  final String title;
  final Query? query;
  final Future<List<ProductModel>>? futureMethod;

  @override
  Widget build(BuildContext context) {

    final controller =Get.put(AllProductsController());

    return Scaffold (
      /// AppBar
      appBar: TAppBar(title: Text (title), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
            child: FutureBuilder(
              future: futureMethod ?? controller.fetchProductsByQuery(query),
              builder: (context, snapshot) {

                const loader= TVerticalProductShimmer();
                final widget = TCloudHelperFunctions.checkMultiRecordState (snapshot : snapshot , loader : loader);


                if (widget!= null)return widget;
                
                final products=snapshot.data!;

                return TSortableProducts(products: products);
                },
        ),
      ),
    ),
    );
  }
}

