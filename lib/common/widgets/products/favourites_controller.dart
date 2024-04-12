import 'dart:convert';

import 'package:get/get.dart';
import 'package:mobile_app/data/repositories.authentication/product/product_repository.dart';
import 'package:mobile_app/features/shop/models/product_model.dart';
import 'package:mobile_app/utils/local_storage/storage_utility.dart';
import 'package:mobile_app/utils/popups/loaders.dart';

class FavouritesController extends GetxController {
  static FavouritesController get instance => Get.find();

  final favorites = <String, bool>{}.obs;

  @override
  void onInit() {
    super.onInit();
    initFavorites();
  }

  Future<void> initFavorites() async {
    final json = TLocalStorage.instance().readData('favorites');
    if (json != null) {
      final storedFavorites = jsonDecode(json) as Map<String, dynamic>;

      favorites.assignAll(storedFavorites.map((key, value) => MapEntry(key, value as bool)));
    }
    // Fetch favourites from local storage
  }
  bool isFavourite(String productId) {
    return favorites[productId] ?? false;
  }

  void toggleFavoriteProduct(String productId) {
    if (!favorites.containsKey(productId)){
      favorites[productId] = true;
      saveFavoritesToStorage();
      TLoaders.customToast(message: 'Product added to favorites');
    } else {
      TLocalStorage.instance().removeData(productId);
      favorites.remove(productId);
      saveFavoritesToStorage();
      favorites.refresh();
      TLoaders.customToast(message: 'Product removed from favorites');
    }
  }

  void saveFavoritesToStorage() {
    final encodedFavorites = json.encode(favorites);
    TLocalStorage.instance().saveData('favorites', encodedFavorites);
  }

  Future<List<ProductModel>> favoriteProducts() async {
   return await ProductRepository.instance.getFavouriteProducts(favorites.keys.toList());
  }
}