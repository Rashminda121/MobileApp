
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:mobile_app/features/shop/controllers/category_ontroller.dart';

import '../../../../../common/widgets/image_text_widgets/vertical_image_text.dart';
import '../../../../../common/widgets/shimmers/category_shimmer.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../sub_category/sub_categories.dart';


class THomeCategories extends StatelessWidget {
  const THomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final categoryController= Get.put(CategoryController());
    return Obx(

      () {
        if(categoryController.isLoading.value) return const TCategoryShimmer();

        if(categoryController.featuredCategories.isEmpty){
          return Center(
            child: Text(
              'No Data Found!',
              style: Theme.of(context).textTheme.bodyMedium!.apply(color: Colors.white),
            ),
          );
        }
        return SizedBox(
          height: 80,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: categoryController.featuredCategories.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (_, index) {
              final category= categoryController.featuredCategories[index];
              return TVerticalImageText(image: category.image, title: category.name,onTap: ()=>Get.to(()=>const SubCategoriesScreen()));
            },
          ),
        );
      });
  }
}