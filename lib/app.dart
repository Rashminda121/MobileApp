import 'package:flutter/material.dart';
import 'package:mobile_app/utils/theme/theme.dart';

///use this class to setup themes, inital bindingd and any animations and much more
class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.system,
      theme: GAppTheme.lightTheme,
      darkTheme: GAppTheme.darkTheme,
    );
  }
}
