
import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:mobile_app/features/authentication/screens/login/widgets/login_header.dart";

import "../../../../common/styles/spacing_styles.dart";
import "../../../../common/widgets/login_signup/login_form_divider.dart";
import "../../../../utils/constants/sizes.dart";
import "../../../../utils/constants/text_strings.dart";
import "../../../../utils/helpers/helper_functions.dart";
import "widgets/login_form.dart";
import '../../../../common/widgets/login_signup/social_buttons.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              ///logo title & sub tiitle
              TLoginHeader(dark: dark),

              ///Form
              const TLoginForm(),

              ///Divider
              TFormDivider(dark: dark, dividerText: TTexts.orSignInWith.capitalize!,),

              const SizedBox(
                height: TSizes.sm,
              ),

              ///Footer
              const TSocialButtons(),
            ],
          ),
        ),
      ),
    );
  }
}
