import 'package:get/get.dart';
import 'package:mobile_app/data/repositories.authentication/product/product_repository.dart';
import 'package:mobile_app/features/shop/models/product_model.dart';

import 'package:mobile_app/utils/popups/loaders.dart';

import '../../../data/repositories.authentication/categories/category_repository.dart';
import '../models/category_model.dart';

class CategoryController extends GetxController {
  static CategoryController get instance => Get.find();

  final isLoading =false.obs;
  final CategoryRepository _categoryRepository = Get.put(CategoryRepository());
  RxList<CategoryModel> allCategories= <CategoryModel>[].obs;
  RxList<CategoryModel> featuredCategories= <CategoryModel>[].obs;

  @override
  void onInit() {
    fetchCategories();
    super.onInit();

  }

  Future<void> fetchCategories() async {
    try {
      // Show Loader while loading categories
      isLoading.value = true;
      // Fetch categories from data source (Firestore, API, etc.)
      final categories = await _categoryRepository.getAllCategories();
      // Update the categories list
      allCategories.assignAll(categories);
      // Filter featured categories
      featuredCategories.assignAll(allCategories.where((category) => category.isFeatured && category.parentId.isEmpty).take(8).toList());
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      //Remove Loader
      isLoading.value=false;
    }
  }
Future<List<ProductModel>> getCategoryProducts({required String categoryId, int limit = 4}) async {
  // Fetch limited (4) products against each subcategory;
  final products = await ProductRepository.instance.getProductsForCategory(categoryId: categoryId, limit: limit);
  return products;
}
  }

