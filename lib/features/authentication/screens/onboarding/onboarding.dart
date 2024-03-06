
import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:iconsax/iconsax.dart";
import "package:mobile_app/features/authentication/screens/onboarding/widgets/onboardingDotNavigation.dart";
import "package:mobile_app/features/authentication/screens/onboarding/widgets/onboardingNextButton.dart";
import "package:mobile_app/features/authentication/screens/onboarding/widgets/onboarding_skip.dart";
import "package:smooth_page_indicator/smooth_page_indicator.dart";

import "../../../../utils/constants/image_strings.dart";
import "../../../../utils/constants/text_strings.dart";
import "../../controllers/onboarding_controller.dart";
import "widgets/onboarding_page.dart";

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller =Get.put(OnBoardingController());

    return Scaffold(
      body: Stack(
        children: [
          ///Horizontal Scroll Page
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: const [
              OnboardingPage(
                image: TImages.onboard1,
                title: TTexts.onBoardingTitle1,
                subTitle: TTexts.onBoardingSubTitle1,
              ),
              OnboardingPage(
                image: TImages.onboard2,
                title: TTexts.onBoardingTitle2,
                subTitle: TTexts.onBoardingSubTitle2,
              ),
              OnboardingPage(
                image: TImages.onboard3,
                title: TTexts.onBoardingTitle3,
                subTitle: TTexts.onBoardingSubTitle3,
              ),
            ],
          ),

          ///Skip Button
          const OnboardingSkip(),

          ///Dot navigation smooth  page indicator
          const OnboardingDotNavigation(),

          ///Circular Button
          const OnboardingNextButton(),
        ],
      ),
    );
  }
}


