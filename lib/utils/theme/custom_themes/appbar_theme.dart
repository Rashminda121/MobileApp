import 'package:flutter/material.dart';

class GAppBarTheme{
  GAppBarTheme._();

  static const lightAppBarTheme = AppBarTheme(
    backgroundColor: Colors.transparent,
    elevation: 0,
    centerTitle: false,
    scrolledUnderElevation: 0,
    surfaceTintColor: Colors.transparent,
    iconTheme:IconThemeData(color: Colors.black, size:24),
    titleTextStyle: TextStyle(color: Colors.black, fontSize: 18.0, fontWeight: FontWeight.w600),
    actionsIconTheme: IconThemeData(color: Colors.black, size:24),
  );

  static const darkAppBarTheme = AppBarTheme(
    backgroundColor: Colors.transparent,
    elevation: 0,
    centerTitle: false,
    scrolledUnderElevation: 0,
    surfaceTintColor: Colors.transparent,
    iconTheme:IconThemeData(color: Colors.black, size:24),
    titleTextStyle: TextStyle(color: Colors.white, fontSize: 18.0, fontWeight: FontWeight.w600),
    actionsIconTheme: IconThemeData(color: Colors.white, size:24),
  );
}