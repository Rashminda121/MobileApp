
import 'package:get/get.dart';
import 'package:mobile_app/data/repositories.authentication/brands/brand_repository.dart';
import 'package:mobile_app/data/repositories.authentication/product/product_repository.dart';
import 'package:mobile_app/features/shop/models/brand_model.dart';
import 'package:mobile_app/features/shop/models/product_model.dart';
import 'package:mobile_app/utils/popups/loaders.dart';

class BrandController extends GetxController {
  static BrandController get instance => Get.find();
  RxBool isLoading = true.obs;
  final RxList<BrandModel> featuredBrands =<BrandModel>[].obs;
  final RxList<BrandModel> allBrands =<BrandModel>[].obs;
  final brandRepository = Get.put(BrandRepository());

  @override
  void onInit() {
    getFeaturedBrands();
    super.onInit();
  }

  Future<void> getFeaturedBrands() async {
    try {
      isLoading(true);
      final brands = await brandRepository.getAllBrands();

      allBrands.assignAll(brands);
      featuredBrands.assignAll(allBrands.where((brand)=> brand.isFeatured ?? false).take(4));
      
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
  
  Future<List<ProductModel>> getBrandProducts({required String brandId , int limit = -1}) async {
    try {
      final products = await ProductRepository.instance.getProductsForBrand(brandId:brandId);
      return products;
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
      return [];
    }
  }
  Future<List<BrandModel>> getBrandsForCategory(String categoryId) async {
    try {
      final brands = await brandRepository.getBrandsForCategory(categoryId);
      return brands;
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
      return [];
    }
  }
}