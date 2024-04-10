import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:mobile_app/data/repositories.authentication/user/user_repository.dart';
import 'package:mobile_app/utils/models/user_model.dart';
import 'package:mobile_app/utils/popups/loaders.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  final userRepository = Get.put(UserRepository());

  Future<void> saveUserRecord(UserCredential? userCredentials) async {
    try{
      if (userCredentials != null) {
        final nameParts = UserModel.nameParts(userCredentials.user!.displayName?? '');
        final username = UserModel.generatedUsername(userCredentials.user!.displayName?? '');

        //map data
        final user = UserModel(
          id: userCredentials.user!.uid, 
          firstName: nameParts[0],
          lastName: nameParts.length > 1 ? nameParts.sublist(1).join(' ') : '',
          email: userCredentials.user!.email?? '', 
          username: username,
          phoneNumber: userCredentials.user!.phoneNumber?? '', 
          profilePicture: userCredentials.user!.photoURL?? '', );

          await userRepository.saveUserRecord(user);
      }

    }catch (e){
      TLoaders.warningSnackBar(title: 'Data not saved', message: 'Something went wrong while saving user data',);
    }
    // Save user record to database
  }
}
