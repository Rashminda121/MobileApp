// import 'package:get/get.dart';
// inport 'package:cloud_firestore/cloud_firestore.dart';

// import '../../../features/personalization/models/address_model.dart';

// class AddressRepository extends GetxController {
//   static AddressRepository get instance => Get.find();

//   final _db = FirebaseFirestore.instance;

//   Future<List<AddressModel>> fetchUserAddress() async {
//     try {

//     final userId = AuthenticationRepository.instance.authUser!.uid;
//     if (userId.isEmpty) throw "Unable to find  user information. Try again in few minuts.";

//     final result = await _db.collection('users').doc(userId).collection('Address').get();
//     return result.docs.map((documentSnapshot) => AddressModel.fromDocumentSnapshot(documentSnapshot)).toList();
    

//     } catch (e) {
//       throw "Something wenst wrong while fetching address information. Try again later."
//     }
//   }

//     /// Clear the "selected" field for all addresses
//   Future<void> updateSelectedField (String addressId, bool selected) async {
//     try {
//       final userId = AuthenticationRepository.instance.authUser!.uid;
//       await _db.collection("users").doc(userId).collection('Addresses').doc(addressId).update({'SelectedAddress': selected});

//     } catch (e) {
//       throw 'Unable to update your address selection. Try again later';
//     }
//   }

//   //store new user order
//   Future<string> addAddress(AddressModel address) async {
//     try {
//       final userId = AuthenticationRepository.instance.authUser!.uid;
//       final currentAddress = await _db.collection("users").doc(userId).collection('Addresses').add(address.toJson());
//       return currentAddress.id;
//     } catch (e) {
//       throw 'Something went wrong while saving address information. Try again later.';
//     }
//   }
// }
