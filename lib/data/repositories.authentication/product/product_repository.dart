
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mobile_app/common/widgets/firebase/TFirebaseStorage.dart';
import 'package:mobile_app/data/repositories.authentication/firebase_exception.dart';
import 'package:mobile_app/features/shop/models/product_model.dart';
import 'package:mobile_app/utils/constants/enums.dart';


/// Repository for managing product-related data and operations.
class ProductRepository extends GetxController {
  static ProductRepository get instance => Get.find();

  /// Firestore instance for database interactions.
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  /// Get limited featured products
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

  /// Get all featured products
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

  /// Fetch products by query
  Future<List<ProductModel>> fetchProductsByQuery(Query query) async {
    try {
      final querySnapshot = await query.get();
      final List<ProductModel> productList = querySnapshot.docs.map((doc) => ProductModel.fromSnapshot(doc as DocumentSnapshot<Map<String, dynamic>>)).toList();
      return productList;
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  Future<List<ProductModel>> getFavouriteProducts(List<String> productIds) async {
  try {
    final snapshot = await _db.collection('Products').where(FieldPath.documentId, whereIn: productIds).get();
    return snapshot.docs.map((querySnapshot) => ProductModel.fromSnapshot(querySnapshot)).toList();
  } on FirebaseException catch (e) {
    throw TFirebaseException(e.code).message;
  } on PlatformException catch (e) {
    throw TPlatformException(e.code).message;
  } catch (e) {
    throw 'Something went wrong. Please try again';
  }
  
}
  /// Upload dummy data to Cloud Firestore
  Future<void> uploadDummyData(List<ProductModel> products) async {
    try {
      final storage = Get.put(TFirebaseStorageService());

      for (var product in products) {
        final thumbnail = await storage.getImageDataFromAssets(product.thumbnail);

        final url = await storage.uploadImageData('Products/Images', thumbnail, product.thumbnail.toString());
        product.thumbnail = url;

        if (product.images != null && product.images!.isNotEmpty) {
          List<String> imagesUrl = [];
          for (var image in product.images!) {
            final assetImage = await storage.getImageDataFromAssets(image);
            final url = await storage.uploadImageData('Products/Images', assetImage, image);
            imagesUrl.add(url);
          }
          product.images!.clear();
          product.images!.addAll(imagesUrl);
        }

        if (product.productType == ProductType.single) {
          for (var variation in product.productVariations!) {
            final assetImage = await storage.getImageDataFromAssets(variation.image);
            final url = await storage.uploadImageData('Products/Images', assetImage, variation.image);
            variation.image = url;
          }
        }

        await _db.collection("Products").doc(product.id).set(product.toJson());
      }
    } on FirebaseException catch (e) {
      throw e.message!;
    
    } on PlatformException catch (e) {
      throw e.message!;
    } catch (e) {
      throw e.toString();
    }
  }


   Future<List<ProductModel>> getProductsForBrand({required String brandId, int limit = -1}) async {
    try {
      final QuerySnapshot = limit == -1 ? await _db.collection('Products').where('Brand.Id', isEqualTo: brandId).get() :
      await _db.collection('Products').where('Brand.Id', isEqualTo: brandId).limit(limit).get();
      final products = QuerySnapshot.docs.map((doc) => ProductModel.fromSnapshot(doc)).toList();
      return products;
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
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
}
