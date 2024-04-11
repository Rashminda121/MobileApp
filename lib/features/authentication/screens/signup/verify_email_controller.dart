import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_app/common/widgets/success_screen/success_screen.dart';
import 'package:mobile_app/data/repositories.authentication/authentication/authentication_repository.dart';
import 'package:mobile_app/utils/constants/image_strings.dart';
import 'package:mobile_app/utils/constants/text_strings.dart';
import 'dart:async';
import '../../../../utils/popups/loaders.dart';

class VerifyEmailController extends GetxController {
  static VerifyEmailController get instance => Get.find();

  /// Send Email Whenever Verify Screen appears & Set Timer for auto redirect.
  @override
  void onInit() {
    sendEmailVerification();
    setTimerForAutoRedirect();
    super.onInit();
  }

  /// Send Email Verification link
  sendEmailVerification() async {
    try {
      await AuthenticationRepository.instance.sendEmailVerification();
      TLoaders.successSnackBar(title: 'Email Sent', message: 'Please Check your inbox and verify your email.');
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
    /// Timer to automatically redirect on Email Verification
    setTimerForAutoRedirect() {
      Timer.periodic(const Duration(seconds: 1), (timer) async {
          await FirebaseAuth.instance.currentUser?.reload();
          final user = FirebaseAuth.instance.currentUser;
          if (user?.emailVerified ?? false){
            timer.cancel();
            Get.off(() => SuccessScreen(image: TImages.success, title: TTexts.yourAccountCreatedTitle, subTitle: TTexts.yourAccountCreatedSubTitle, onPressed:()=> AuthenticationRepository.instance.screenRedirect(), ),);
          }
      });
    }


    /// Manually Check if Email Verified
    checkEmailVerification() async {
      final currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser != null && currentUser.emailVerified) {
        Get.off(() => SuccessScreen(image: TImages.success, title: TTexts.yourAccountCreatedTitle, subTitle: TTexts.yourAccountCreatedSubTitle, onPressed:()=> AuthenticationRepository.instance.screenRedirect(), ),);
        
      }
    }
  }
