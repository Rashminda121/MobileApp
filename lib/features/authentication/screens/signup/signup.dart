
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_app/features/authentication/screens/signup/widgets/signup_form.dart';


import '../../../../common/widgets/login_signup/login_form_divider.dart';
import '../../../../common/widgets/login_signup/social_buttons.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';
import '../../../../utils/helpers/helper_functions.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ///title
              Text(
                TTexts.signupTitle,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),

              ///form
              const TSignupForm(),
              const SizedBox(height: TSizes.spaceBtwSections),

              ///Divider
              TFormDivider(dark: dark, dividerText: TTexts.orSignUpWith.capitalize!),
              const SizedBox(height: TSizes.spaceBtwSections),

              /// Social Buttons

              const TSocialButtons(),
              const SizedBox(height: TSizes.spaceBtwSections),



            ],
          ),
        ),
      ),
    );
  }
}


