import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';

class MyThemeData{

  static ThemeData lightTheme=ThemeData(
    colorScheme: ColorScheme(
        brightness: Brightness.light,
        primary:green, onPrimary:green, secondary: Colors.black,
        onSecondary:Colors.black, error: Colors.red, onError: Colors.red,
        background:Colors.white,
        onBackground:Colors.white,
        surface:Colors.white,
        onSurface: Colors.black),

      appBarTheme: AppBarTheme(
        centerTitle: true,
        color: green,
        iconTheme: IconThemeData(
          color: Colors.white
        )
      ),
    textTheme: TextTheme(
      bodySmall: GoogleFonts.exo(
        fontSize: 14,
        color:Colors.white,
      ),
      bodyMedium: GoogleFonts.poppins(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        color:grey,
      ),
      bodyLarge: GoogleFonts.exo(
        fontSize: 22,
        color:Colors.white,
      ),
    ),
  );
  static ThemeData darkTheme=ThemeData(
    colorScheme: ColorScheme(
        brightness: Brightness.dark,
        primary:Colors.grey, onPrimary:Colors.white10, secondary: Colors.black,
        onSecondary:Colors.black, error: Colors.red, onError: Colors.red,
        background:Colors.grey,
        onBackground:Colors.white,
        surface:Colors.white,
        onSurface: Colors.black),

    appBarTheme: AppBarTheme(
        centerTitle: true,
        color: Colors.black,
        iconTheme: IconThemeData(
            color: Colors.white
        )
    ),
    textTheme: TextTheme(
      bodySmall: GoogleFonts.exo(
        fontSize: 14,
        color:Colors.white,
      ),
      bodyMedium: GoogleFonts.poppins(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        color:Colors.white,
      ),
      bodyLarge: GoogleFonts.exo(
        fontSize: 22,
        color:Colors.white,
      ),
    ),
  );
}