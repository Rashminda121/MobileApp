import 'package:flutter/material.dart';

class GColors{
  GColors._();

  //app basic colors
  static const Color primary = Color.fromARGB(255, 0, 197, 26);
  static const Color secondary = Color.fromARGB(255, 219, 219, 13);
  static const Color accent = Color.fromARGB(255, 235, 104, 11);

  //gradiant color
  static const Gradient linerGradient = LinearGradient(
    begin: Alignment(0.0,0.0),
    end: Alignment(0.707,-0.707),
    colors:[
      Color(0xffff9a9e),
      Color(0xfffad0c4),
      Color(0xfffad0c4),
    ]
  );

  //text colors
  static const Color textPrimary = Color.fromARGB(255, 0, 0, 0);
  static const Color textSecondary = Color.fromARGB(255, 103, 103, 103);
  static const Color textWhite = Colors.white;

  //background colors
  static const Color light = Color.fromARGB(255, 255, 255, 255);
  static const Color dark = Color.fromARGB(255, 0, 0, 0);
  static const Color primaryBackground = Color.fromARGB(255, 245, 245, 245);

  //background container colors
  static const Color lightContainer = Color.fromARGB(255, 255, 255, 255);
  static Color darkContainer = Colors.white.withOpacity(0.1);


  //Button Colors
  static const Color buttonPrimary = Color.fromARGB(255, 0, 197, 26);
  static const Color buttonSecondary = Color.fromARGB(255, 219, 219, 13);
  static const Color buttonDisabled = Color.fromARGB(255, 159, 159, 159);

  //Border Colors
  static const Color borderPrimary = Color.fromARGB(255, 228, 228, 228);
  static const Color borderSecondary = Color.fromARGB(255, 219, 219, 219);

  //error and validation colors
  static const Color error = Color.fromARGB(255, 255, 0, 0);
  static const Color success = Color.fromARGB(255, 0, 113, 9);
  static const Color warning = Color.fromARGB(255, 255, 153, 0);
  static const Color info = Color.fromARGB(255, 0, 0, 255);

  //Neutral shades
  static const Color black = Color.fromARGB(255, 0, 0, 0);
  static const Color darkerGrey = Color.fromARGB(255, 51, 51, 51);
  static const Color darkGrey = Color.fromARGB(255, 102, 102, 102);
  static const Color grey = Color.fromARGB(255, 153, 153, 153);
  static const Color lightGrey = Color.fromARGB(255, 204, 204, 204);
  static const Color white = Color.fromARGB(255, 255, 255, 255);
  

}