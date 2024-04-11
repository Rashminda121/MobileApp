import 'package:get/get.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavouritesController extends GetxController {
  static FavouritesController get instance => Get.find();

  /// Variables
  final favorites = <String, bool>{}.obs;

  @override
  void onInit() {
    super.onInit();
    initFavorites();
  }

  // Method to initialize favorites by reading from storage
  void initFavorites() {
    final json = TLocalStorage.instance().readData('favorites');
    if (json != null) {
      final storedFavorites = jsonDecode(json) as Map<String, dynamic>;
      favorites.assignAll(
          storedFavorites.map((key, value) => MapEntry(key, value as bool)));
    }
  }

  bool isFavourite(String productId) {
    return favorites[productId] ?? false;
  }
}

class TLocalStorage {
  static TLocalStorage instance() => Get.find();

  Future<String?> readData(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }
}

void toggleFavoriteProduct(String productId) {
  if (!favorites.containsKey(productId)) {
    favorites[productId] = true;
    saveFavoritesToStorage();
    TLoaders.customToast(message: 'Product has been added to the Wishlist.');
  } else {
    TLocalStorage.instance().removeData(productId);
    favorites.remove(productId);
    saveFavoritesToStorage();
    favorites.refresh();
    TLoaders.customToast(
        message: 'Product has been removed from the Wishlist.');
  }
}

void saveFavoritesToStorage() {
  final encodedFavorites = json.encode(favorites);
  TLocalStorage.instance().saveData('favorites', encodedFavorites);
}

Future<List<ProductModel>> favoriteProducts() async {
  return await ProductRepository.instance
      .getFavoriteProducts(favorites.keys.toList());
}
