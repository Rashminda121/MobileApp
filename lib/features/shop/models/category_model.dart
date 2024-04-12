import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryModel {
  String id;
  String name;
  String image;
  String prentId;
  bool isFeatured;

  CategoryModel({
    required this.id,
    required this.name,
    required this.image,
    required this.isFeatured,
    this.prentId = '',
  });

  /// Empty Helper Function
  static CategoryModel empty() => CategoryModel(id: '', name: '', image: '', isFeatured: false);

  /// Convert model to Json structure so that you can store data in Firebase
  Map<String, dynamic> toJson() => {
    'Name': name,
    'Image': image,
    'PrentId': prentId,
    'IsFeatured': isFeatured,
  };


  /// Map Json oriented document snapshot from Firebase to UserModel
  factory CategoryModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;
      // Map JSON Record to the Model
      return CategoryModel(
        id: document.id,
        name: data['Name'] ?? '',
        image: data['Image'] ?? '',
        prentId: data['PrentId'] ?? '',
        isFeatured: data['IsFeatured'] ?? false,
      );
    } else {
      return CategoryModel.empty();
    }
  }
}
