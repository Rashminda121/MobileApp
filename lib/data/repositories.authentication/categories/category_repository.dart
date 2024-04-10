import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mobile_app/data/repositories.authentication/categories/platformException.dart';

import '../../../features/shop/models/category_model.dart';

class CategoryRepository extends GetxController {
  static CategoryRepository get instance => Get.find();

  /// Variables
  final _db = FirebaseFirestore.instance;

  /// Get all categories
  Future<List<CategoryModel>> getAllCategories() async {
    try {
      final snapshot = await _db.collection('Categories').get();
      final list = snapshot.docs.map((document) => CategoryModel.fromSnapshot(document)).toList();
      return list;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on TPlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
    }
    throw 'Something went wrong. Please try again';
  }

/// Get Sub Categories
/// Upload Categories to the Cloud Firebase
  Future<void> uploadDummyData(List<CategoryModel> categories) async {
    try {
      final storage = Get.put(TFirebaseStorageService());

      for (final category in categories) {
        final file = await storage.getImageDataFromAssets(category.image);
        final url = await storage.uploadImageData('Categories', file, category.name);
        category.image = url;

        await _db.collection("Categories").doc(category.id).set(category.toJson());
      }
    } on FirebaseException catch (e, stackTrace) {
      print('FirebaseException: $e');
      print('stackTrace: $stackTrace');
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e, stackTrace) {
      print('PlatformException: $e');
      print('stackTrace: $stackTrace');
      throw TPlatformException(e.code).message;
    } catch (e, stackTrace) {
      print('Exception: $e');
      print('stackTrace: $stackTrace');
      // Replace this with your own error handling
      rethrow;
    }
  }



}