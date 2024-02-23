import 'package:flutter/material.dart';

class GElevatedButtonTheme{
  GElevatedButtonTheme._();


///--Light Theme
static final lightElevatedButtonTheme = ElevatedButtonThemeData(
  style: ElevatedButton.styleFrom(
    elevation: 0,
    foregroundColor: Colors.white,
    backgroundColor: Colors.green,
    disabledForegroundColor: Colors.grey,
    disabledBackgroundColor: Colors.grey,
    side: const BorderSide(color: Colors.green),
    padding: const EdgeInsets.symmetric(vertical: 18),
    textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color:Colors.white),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12)),
  ),
);
  
  ///--Dark Theme
  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: Colors.white,
      backgroundColor: Colors.green,
      disabledForegroundColor: Colors.grey,
      disabledBackgroundColor: Colors.grey,
      side: const BorderSide(color: Colors.green),
      padding: const EdgeInsets.symmetric(vertical: 18),
      textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color:Colors.white),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12)),
    ),
  );
  
}
