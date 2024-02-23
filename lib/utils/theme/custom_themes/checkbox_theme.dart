import 'package:flutter/material.dart';

///custom class for light and dark text theme

class GCheckboxTheme{
  GCheckboxTheme._();

  static CheckboxThemeData lightCheckboxThemeData = CheckboxThemeData(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(4)),
      checkColor: MaterialStateProperty.resolveWith((states){
        if (states.contains(MaterialState.selected)){
          return Colors.white;
        }
        else{
          return Colors.black;
        }
      }),

      fillColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.selected)){
          return Colors.green;
      }
      else{
        return Colors.transparent;
      }
})
  );
static CheckboxThemeData darkCheckboxThemeData = CheckboxThemeData(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(4)),
      checkColor: MaterialStateProperty.resolveWith((states){
        if (states.contains(MaterialState.selected)){
          return Colors.white;
        }
        else{
          return Colors.black;
        }
      }),

      fillColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.selected)){
          return Colors.green;
      }
      else{
        return Colors.transparent;
      }
})
  );

  
}