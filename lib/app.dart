
import 'package:flutter/material.dart';

import 'package:get/get_navigation/get_navigation.dart';
import 'package:mobile_app/utils/theme/theme.dart';

import 'features/authentication/screens/onboarding/onboarding.dart';



class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      themeMode: ThemeMode.system,
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      home: const OnboardingScreen(),
    );
  }
}
