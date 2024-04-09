import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

    ///Variables
    final email = TextEditingController();
    final lastName = TextEditingController();
    final username = TextEditingController();
    final password = TextEditingController();
    final firstName = TextEditingController();
    final phoneNumber = TextEditingController();
    GlobalKey <FormState> signupFormKey = GlobalKey<FormState>();

  Future<void> signup() async {
    try {
  // Start Loading
  // Check Internet Connectivity
 


  // Form Validation
  

  // Privacy Policy Check


  // Register user in the Firebase Authentication & Save user data in the Firebase
 
  // Save Authenticated user data in the Firebase Firestore

  // Show Success Message
  // Move to Verify Email Screen
} catch (e) {
  // Show some Generic Error to the user
} finally {
  // Remove Loader
}
}
}