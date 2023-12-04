import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';

class MyThemeData{

  static ThemeData lightTheme=ThemeData(
    colorScheme: ColorScheme(
        brightness: Brightness.light,
        primary:green, onPrimary:green, secondary: Colors.black,
        onSecondary:Colors.white, error: Colors.red, onError: Colors.red,
        background:Colors.white,
        onBackground:Colors.white,
        surface:Colors.black,
        onSurface: Colors.white),

      appBarTheme: AppBarTheme(
        centerTitle: true,
        color: green,
        iconTheme: IconThemeData(
          color: Colors.white
        )
      ),
    textTheme: TextTheme(
      bodySmall: GoogleFonts.exo(
        fontSize: 14.sp,
        color:Colors.white,
      ),
      bodyMedium: GoogleFonts.poppins(
        fontSize: 18.sp,
        fontWeight: FontWeight.w500,
        color:grey,
      ),
      bodyLarge: GoogleFonts.exo(
        fontSize: 22.sp,
        color:Colors.white,
      ),
    ),
  );
  static ThemeData darkTheme=ThemeData(
    colorScheme: ColorScheme(
        brightness: Brightness.dark,
        primary:green, onPrimary:Colors.white10, secondary: Colors.white,
        onSecondary:Colors.black, error: Colors.red, onError: Colors.red,
        background:Colors.grey,
        onBackground:Colors.white,
        surface:Colors.white,
        onSurface: grey),

    appBarTheme: AppBarTheme(
        centerTitle: true,
        color: green,
        iconTheme: IconThemeData(
            color: Colors.white
        )
    ),
    textTheme: TextTheme(
      bodySmall: GoogleFonts.exo(
        fontSize: 14.sp,
        color:Colors.white,
      ),
      bodyMedium: GoogleFonts.poppins(
        fontSize: 18.sp,
        fontWeight: FontWeight.w500,
        color:Colors.white,
      ),
      bodyLarge: GoogleFonts.exo(
        fontSize: 22.sp,
        color:Colors.white,
      ),
    ),
  );
}