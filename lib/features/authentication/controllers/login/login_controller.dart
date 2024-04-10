import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mobile_app/data/repositories.authentication/authentication/authentication_repository.dart';
import 'package:mobile_app/utils/constants/image_strings.dart';
import 'package:mobile_app/utils/helpers/network_manager.dart';
import 'package:mobile_app/utils/popups/full_screen_loader.dart';
import 'package:mobile_app/utils/popups/loaders.dart';

class LoginController extends GetxController {
  /// Variables
  final rememberMe = false.obs;
  final hidePassword = true.obs;
  final localStorage = GetStorage();
  final email = TextEditingController();
  final password = TextEditingController();

  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  ///-- Email and Password SignIn
  Future<void> emailAndPasswordSignIn() async {
  // Start Loading
  try{
  TFullScreenLoader.openLoadingDialog('Logging you in...', TImages.docerAnimation);

  // Check Internet Connectivity
  final isConnected = await NetworkManager.instance.isConnected();
  if (!isConnected) {
    TFullScreenLoader.stopLoading();
    return;
  }

  // Form Validation
  if (!loginFormKey.currentState!.validate()) {
    TFullScreenLoader.stopLoading();
    return;
  }

  // Save Data if Remember Me is selected
  if (rememberMe.value) {
    localStorage.write('REMEMBER_ME_EMAIL', email.text.trim());
    localStorage.write('REMEMBER_ME_PASSWORD', password.text.trim());
  }

  // Login user using EMail & Password Authentication
  final userCredentials = await AuthenticationRepository.instance.loginWithEmailAndPassword(email.text.trim(), password.text.trim());

  // Remove Loader
  TFullScreenLoader.stopLoading();

  // Redirect
  AuthenticationRepository.instance.screenRedirect();
} catch (e){
TFullScreenLoader.stopLoading();
TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
}
}

  
}
