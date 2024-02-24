import 'package:flutter/material.dart';
import 'custom_themes/text_theme.dart';
import 'custom_themes/elevated_button_theme.dart';
import 'custom_themes/appbar_theme.dart';
import 'custom_themes/bottom_sheet_theme.dart';
import 'custom_themes/checkbox_theme.dart';
import 'custom_themes/chip_theme.dart';
import 'custom_themes/outlined_button_theme.dart';
import 'custom_themes/text_field_theme.dart';

class GAppTheme {
  GAppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    primaryColor: Colors.green,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: GAppBarTheme.lightAppBarTheme,
    checkboxTheme: GCheckboxTheme.lightCheckboxThemeData,
    bottomSheetTheme: GBottomSheetTheme.lightBottomSheetTheme,
    chipTheme: GChipTheme.lightChipTheme,
    outlinedButtonTheme: GOutlinedButtonTheme.lightOutlinedButtonTheme,
    textTheme: GTextTheme.lightTextTheme,
    elevatedButtonTheme:GElevatedButtonTheme.lightElevatedButtonTheme,
    inputDecorationTheme: GTextFormFieldTheme.lightInputDecorationTheme,
  );
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.dark,
    primaryColor: Colors.green,
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: GAppBarTheme.darkAppBarTheme,
    checkboxTheme: GCheckboxTheme.darkCheckboxThemeData,
    bottomSheetTheme: GBottomSheetTheme.darkBottomSheetTheme,
    chipTheme: GChipTheme.darkChipTheme,
    outlinedButtonTheme: GOutlinedButtonTheme.darkOutlinedButtonTheme,
    textTheme: GTextTheme.darkTextTheme,
    elevatedButtonTheme:GElevatedButtonTheme.darkElevatedButtonTheme,
    inputDecorationTheme: GTextFormFieldTheme.darkInputDecorationTheme,
  );
}