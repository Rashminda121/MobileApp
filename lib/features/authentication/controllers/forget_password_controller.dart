import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:mobile_app/data/repositories.authentication/authentication/authentication_repository.dart';
import 'package:mobile_app/features/authentication/screens/password_configuration/reset_password.dart';
import 'package:mobile_app/utils/constants/image_strings.dart';
import 'package:mobile_app/utils/helpers/network_manager.dart';
import 'package:mobile_app/utils/popups/full_screen_loader.dart';
import 'package:mobile_app/utils/popups/loaders.dart';

class ForgetPasswordController extends GetxController {
  static ForgetPasswordController get instance => Get.find();

  //variables
  final email = TextEditingController();
  GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();

  //Send Reset Password Email
  sendPasswordResetEmail() async {
    try {
      // Start Loading
      TFullScreenLoader.openLoadingDialog(
          'Processing your request...', TImages.docerAnimation);

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }
      // Form Validation
      if (!forgetPasswordFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // Send EMail to Reset Password
      await AuthenticationRepository.instance
          .sendPasswordResetEmail(email.text.trim());

      //Remove Loader
      TFullScreenLoader.stopLoading();

      // Show Success Screen
      TLoaders.successSnackBar(
          title: 'Email Sent',
          message: 'Email Link Sent to Reset your Password'.tr);

      // Redirect
      Get.to(() => ResetPasswordScreen(email: email.text.trim()));
    } catch (e) {
      // Remove Loader
      TFullScreenLoader.stopLoading();

      TLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }

  resendPasswordResetEmail(String email) async {
    try {
      // Start Loading
      TFullScreenLoader.openLoadingDialog(
          'Processing your request...', TImages.docerAnimation);

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // Send EMail to Reset Password
      await AuthenticationRepository.instance.sendPasswordResetEmail(email);

      //Remove Loader
      TFullScreenLoader.stopLoading();

      // Show Success Screen
      TLoaders.successSnackBar(
          title: 'Email Sent',
          message: 'Email Link Sent to Reset your Password'.tr);
    } catch (e) {
      // Remove Loader
      TFullScreenLoader.stopLoading();

      TLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }
}
