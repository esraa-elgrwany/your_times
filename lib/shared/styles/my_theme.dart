import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';

class MyThemeData{

  static ThemeData lightTheme=ThemeData(
    colorScheme: ColorScheme(
        brightness: Brightness.light,
        primary:green, onPrimary:Colors.white10, secondary: Colors.black,
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
}