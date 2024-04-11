import 'package:get/get.dart';

class CategoryController extends GetxController {
  static CategoryController get instance => Get.find();
  final isLoading = false.obs;
  final categoryRepository = CategoryRepository();
  RxList<CategoryModel> allCategories = <CategoryModel>[].obs;
  RxList<CategoryModel> featuredCategories = <CategoryModel>[].obs;

  @override
  void onInit() {
    fetchCategories();
    super.onInit();
  }

  Future<void> fetchCategories() async {
    try {
      isLoading.value = true;
      final categories = await categoryRepository.getAllCategories();
      allCategories.assignAll(categories);
      // Filter featured categories
featuredCategories.assignAll(
    allCategories.where((category) => category.isFeatured && category.parentId.isEmpty).take(8).toList());
} catch (e) {
  TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
} finally {
  //Remove Loader
  isLoading.value = false;
}

/// Load selected category data
/// Get Category or Sub-Category Products.
Future<List<ProductModel>> getCategoryProducts({required String categoryId, int limit = 4}) async {
  // Fetch limited (4) products against each subcategory;
  final products = await ProductRepository.instance.getProductsForCategory(categoryId: categoryId, limit: limit);
  return products;
}
  }