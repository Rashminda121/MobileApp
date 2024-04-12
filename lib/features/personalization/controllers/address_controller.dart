
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:mobile_app/data/repositories/address/address_repository.dart';
// import 'package:mobile_app/utils/popups/loaders.dart';




// class AddressController extends GetxController {
//   static AddressController get instance => Get.find();

//   final name = TextEditingController();
//   final phoneNumber = TextEditingController();
//   final street = TextEditingController();
//   final postalCode = TextEditingController();
//   final city = TextEditingController();
//   final state = TextEditingController();
//   final country = TextEditingController();
//   GlobalKey<FormState> addressFormKey = GlobalKey<FormState>();

//   RxBool refreshData = true.obs;
//   final Rx<AddressModel> selectedAddress = AddressModel.empty().obs;
//   final addressRepository = Get.put(AddressRepository());


// /// Fetch all user specific addresses
// Future<List<AddressModel>> getAllUserAddresses() async {
//   try {
//     final addresses = await addressRepository.fetchUserAddresses();
//     selectedAddress.value =addresses.firstWhere((element )=> element.selectedAddress, orElse: () => AddressModel.empty());
//     return addresses;
//   } catch (e) {
//     TLoaders.errorSnackBar (title: 'Address not found', message: e.toString());
//     return [];
//   }
//  }


//   Future selectAddress (AddressModel newSelectedAddress) async {
//   try {

//     Get.defaultDialog(
//       title:'',
//       onWillPop: () async{
//         return false;
//       },
//       barrierDismissible: false,
//       backgroundColor: Colors.tansparent,
//       content: const TCircularLoader();
//     )
//   // Clear the "selected" field I
//   if(selectedAddress.value.id.isEmpty){
//     await addressRepository.updateSelectField(selectedAddress.value.id,false);
//   }


//   // Assign selected address
//   newSelectedAddress.selectedAddress = true;
//   selectedAddress.value = newSelectedAddress;



//   // Set the "selected" field to true for the newly selected address
//   await addressRepository.updateSelectField(selectedAddress.value.id, true);



//     } catch (e) {
//       TLoaders.errorSnackBar (title: 'Error in Selection', message: e.toString());
//     }
//   }




// //Add new address
// Future addNewAddresses() async {
//   try {
//     //start loading
//     TFullScreenLoader.openLoadingDialog ('storing address...', TImages.docerAnimation);

//     //check internet connectivity
//     final isConnected  = await networkManager.instance.isConnected();
//     if (!isConnected) {
//       TFullScreenLoader.stopLoading();
//       return;
//     }

//     //form validation
//     if (!addressFormKey.currentState!.validate()) {
//       TFullScreenLoader.stopLoading();
//       return;
//     }

//     //save address data
//     final address = AddressModel(
//       id:'',
//       name: name.text.trim(),
//       phoneNumber: phoneNumber.text.trim(),
//       street: street.text.trim(),
//       city: city.text.trim(),
//       state: state.text.trim(),
//       postalCode: postalCode.text.trim(),
//       country: country.text.trim(),
//       selectedAddress: true,
//     );

//     final id = awit addressRepository.addAddress (address);

//     //update selected address status
//     address.id = id ;
//     await selectAddress(address);

//     //remove loader
//     TFullScreenLoader.stopLoading();

//     //show success message
//     TLoaders.successSnackBar(title: 'COngratulations', message: 'Your address has been added successfully');

//     //refresh address data
//     refreshdata.toggle();

//     //reset fields
//     resetFormFields();

//     //redirect
//     Navigator.of(Get.context!).pop();

//   }
//   catch (e) {
//     //remove loader
//     TFullScreenLoader.stopLoading();

//     //show error message
//     TLoaders.errorSnackBar(title: 'Address Not Found', message: e.toString());
//   }
// }

// //functions to Reset form fields

// void resetFormFields() {
//   name.clear();
//   phoneNumber.clear();
//   street.clear();
//   postalCode.clear();
//   city.clear();
//   state.clear();
//   country.clear();
// }
// }