import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_app/data/repositories.authentication/authentication_repository.dart';
import 'package:mobile_app/utils/helpers/network_manager.dart';
import 'package:mobile_app/utils/popups/full_screen_loader.dart';
import 'package:mobile_app/utils/constants/image_strings.dart';
import 'package:mobile_app/utils/popups/loaders.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();
  SignupController();

  ///Variables
  final hidePassword = true.obs;
  final privacyPolicy = true.obs;
  final email = TextEditingController();
  final lastName = TextEditingController();
  final username = TextEditingController();
  final password = TextEditingController();
  final firstName = TextEditingController();
  final phoneNumber = TextEditingController();
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  Future<void> signup() async {
    try {
      // Start Loading
      TFullScreenLoader.openLoadingDialog(
          'We are processing your information...', TImages.docerAnimation);

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        //Remove Loader
        TFullScreenLoader.stopLoading();
        return;
      }

      // Form Validation
      if (!signupFormKey.currentState!.validate()) {
        //Remove Loader
        TFullScreenLoader.stopLoading();
        return;
      }

      // Privacy Policy Check
      if (!privacyPolicy.value) {
        TLoaders.warningSnackBar(
          title: 'accept Privacy Policy',
          message:
              'In order to create  account, you must have to read and accept the privacy policy & tterms of use.',
        );
        return;
      }

      // Register user in the Firebase Authentication & Save user data in the Firebase
      final userCredential = await AuthenticationRepository.instance
          .registerWithEmailAndPassword(
              email.text.trim(), password.text.trim());

      // Save Authenticated user data in the Firebase Firestore
      final newUser = UserModel(
        id: userCredential.user!.vid,
        firstName: firstName.text.trim(),
        lastName: lastName.text.trim(),
        email: email.text.trim(),
        phoneNumber: phoneNumber.text.trim(),
        profilePicture: '',
      );

      // Show Success Message
      // Move to Verify Email Screen
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
      // Show some Generic Error to the user
    } finally {
      TFullScreenLoader.stopLoading();
    }
  }
}
