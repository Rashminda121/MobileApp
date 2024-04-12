import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mobile_app/data/repositories.authentication/firebase_exception.dart';
import 'package:mobile_app/features/shop/models/brand_model.dart';

class BrandRepository extends GetxController {
  static BrandRepository get instance => Get.find();
  ///variables
  final _db = FirebaseFirestore.instance;

  ///get all categories
  Future<List<BrandModel>> getAllBrands() async {
    try {
      final snapshot = await _db.collection('Brands').get();
      final result = snapshot.docs.map((e) => BrandModel.fromSnapshot(e)).toList();
      return result;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong while fetching brands';
    }
  }

  ///get brands for category
  Future<List<BrandModel>> getBrandsForCategory(String categoryId) async {
    try {
      // Query to get all documents where categoryId matches the provided categoryId
      QuerySnapshot brandCategoryQuery = await _db.collection('BrandCategory').where('categoryId', isEqualTo: categoryId).get();

      // Extract brandIds from the documents
      List<String> brandIds = brandCategoryQuery.docs.map((doc) => doc['brandId'] as String).toList();

      // Query to get all documents where the brandId is in the list of brandIds, FieldPath.documentId to query documents in Coll
      final brandsQuery = await _db.collection('Brands').where(FieldPath.documentId, whereIn: brandIds).limit(2).get();

      // Extract brand names or other relevant data from the documents
      List<BrandModel> brands = brandsQuery.docs.map((doc) => BrandModel.fromSnapshot(doc)).toList();

      return brands;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong while fetching brands.';
    }
  }
}
