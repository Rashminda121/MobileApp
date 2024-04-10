import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mobile_app/data/repositories.authentication/firebase_exception.dart';
import 'package:mobile_app/features/authentication/screens/login/login.dart';
import 'package:mobile_app/features/authentication/screens/onboarding/onboarding.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';

import 'package:flutter/services.dart'; // Add this line to import PlatformException


class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  /// Variables
  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;

  /// Called from main.dart on app launch
  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  /// Function to Show Relevant Screen
  screenRedirect() async {

    // if(kDebugMode){
    //   print('================ Debug Mode ================ GET STORAGE =============');
    //   print(deviceStorage.read('IsFirstTime'));
    // }
    /// Local Storage
    deviceStorage.writeIfNull('IsFirstTime', true);
    deviceStorage.read('IsFirstTime') != true
        ? Get.offAll(() => const LoginScreen())
        : Get.offAll(() => const OnboardingScreen());
  }

  /// [EmailAuthentication] SignIn
  Future<UserCredential> registerWithEmailAndPassword(String email, String password) async {
  try {
    return await _auth.createUserWithEmailAndPassword(email: email, password: password);
  } on FirebaseAuthException catch (e) {
    throw TFirebaseAuthException(e.code).message;
  } on FirebaseException catch (e) {
    throw TFirebaseException(e.code).message;
  } on FormatException catch (_) {
    throw const TFormatException();
  } on PlatformException catch (e){
        throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
}
  /// [EmailAuthentication] - REGISTER
