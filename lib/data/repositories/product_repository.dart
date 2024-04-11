import ...

class ProductRepository extends GetxController {
  static ProductRepository get instance => Get.find();
  final db = FirebaseFirestore.instance;

  Future<List<ProductModel>> getFeaturedProducts() async {
    try {
      final snapshot = await _db.collection('Products').where('IsFeatured', isEqualTo: true).limit(4).get();
      return snapshot.docs.map((e) => ProductModel.fromSnapshot(e)).toList();
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }
}
/// Get Limited featured products
Future<List<ProductModel>> getAllFeaturedProducts() async {
  try {
    final snapshot = await _db.collection('Products').where('IsFeatured', isEqualTo: true).get();
    return snapshot.docs.map((e) => ProductModel.fromSnapshot(e)).toList();
  } on FirebaseException catch (e) {
    throw TFirebaseException(e.code).message;
  } on PlatformException catch (e) {
    throw TPlatformException(e.code).message;
  } catch (e) {
    throw 'Something went wrong. Please try again';
  }
}

/// Get Products based on the Query
Future<List<ProductModel>> fetchProductsByQuery(Query query) async {
  try {
    final querySnapshot = await query.get();
    final List<ProductModel> productList = querySnapshot.docs.map((doc) => ProductModel.fromQuerySnapshot(doc)).toList();
    return productList;
  } on FirebaseException catch (e) {
    throw TFirebaseException(e.code).message;
  } on PlatformException catch (e) {
    throw TPlatformException(e.code).message;
  } catch (e) {
    throw 'Something went wrong. Please try again';
  }
}
Future<List<ProductModel>> getProductsForCategory({required String categoryId, int limit = 4}) async {
  try {
    QuerySnapshot productCategoryQuery = limit == -1
        ? await _db.collection('ProductCategory').where('categoryId', isEqualTo: categoryId).get()
        : await _db.collection('ProductCategory').where('categoryId', isEqualTo: categoryId).limit(limit).get();
    List<String> productIds = productCategoryQuery.docs.map((doc) => doc['productId'] as String).toList();
    final productsQuery = await _db.collection('Products').where(FieldPath.documentId, whereIn: productIds).get();
    List<ProductModel> products = productsQuery.docs.map((doc) => ProductModel.fromSnapshot(doc)).toList();
    return products;
  } on FirebaseException catch (e) {
    throw TFirebaseException(e.code).message;
  } on PlatformException catch (e) {
    throw TPlatformException(e.code).message;
  } catch (e) {
    throw 'Something went wrong. Please try again';
  }
}
/// Get Products based on the Query
Future<List<ProductModel>> getFavouriteProducts(List<String> productIds) async {
  try {
    final snapshot = await _db.collection('Products').where(FieldPath.documentId, whereIn: productIds).get();
    return snapshot.docs.map((querySnapshot) => ProductModel.fromSnapshot(querySnapshot)).toList();
  } on FirebaseException catch (e) {
    throw TFirebaseException(e.code).message;
  } on PlatformException catch (e) {
    throw TPlatformException(e.code).message;
  } catch (e) {
    // Handle other exceptions here
  }
  throw 'Something went wrong. Please try again';
}
Future<List<ProductModel>> getProductsForCategory({required String categoryId, int limit = 4}) async {
  try {
    QuerySnapshot productCategoryQuery = limit == -1
        ? await _db.collection('ProductCategory').where('categoryId', isEqualTo: categoryId).get()
        : await _db.collection('ProductCategory').where('categoryId', isEqualTo: categoryId).limit(limit).get();
    List<String> productIds = productCategoryQuery.docs.map((doc) => doc['productId'] as String).toList();
    final productsQuery = await _db.collection('Products').where(FieldPath.documentId, whereIn: productIds).get();
    List<ProductModel> products = productsQuery.docs.map((doc) => ProductModel.fromSnapshot(doc)).toList();
    return products;
  } on FirebaseException catch (e) {
    throw TFirebaseException(e.code).message;
  } on PlatformException catch (e) {
    throw TPlatformException(e.code).message;
  } catch (e) {
    throw 'Something went wrong. Please try again';
  }
}