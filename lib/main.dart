import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mobile_app/data/repositories.authentication/authentication_repository.dart';
import 'package:mobile_app/firebase_options.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'firebase_options.dart';
import 'app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';

/// Entry point of the application
Future <void> main() async {

///widgets binding
final WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

await GetStorage.init();
FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

 
await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform).then ((FirebaseApp value) => Get.put(AuthenticationRepository()),

    );
  runApp(const App());
}


