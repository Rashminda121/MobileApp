import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobile_app/features/authentication/screens/login/login.dart';
import 'package:mobile_app/utils/constants/image_strings.dart';
import 'package:mobile_app/utils/constants/sizes.dart';
import 'package:mobile_app/utils/helpers/helper_functions.dart';
class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(onPressed: () => Get.offAll(() => const LoginScreen()), icon:const Icon (CupertinoIcons.clear))
        ],
      ),
      body: SingleChildScrollView(
        //padding to give default equal space on all sides in all screens
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
                ///Image
                Image(image: const AssetImage(TImages.confirmation), width:THelperFunctions.screenWidth()* 0.6,),
                const SizedBox(height: TSizes.spaceBtwSections),

                ///title and subtitle
                Text(TT)
            ],
          ),
        ),
      ),
    );
  }
}