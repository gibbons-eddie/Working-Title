import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Keep all common colors here to make a central point of control
class CustomColors {
  static const white = Color(0xFFFFFFFF);
  static const black = Color(0xFF000000);
  static const lightGray = Color(0xFFE5E5E5);
  static const darkGray = Color(0xFF868686);
  static const lightPurple = Color(0xFF9F76B4);
  static const darkPurple = Color(0xFF542d69);
  static const lightGreen = Color(0xFF61C791);
  static const darkGreen = Color(0xFF19AE60);
}

final appTheme = ThemeData(
  brightness: Brightness.light,

  // Color data
  primaryColor: CustomColors.darkPurple,

  // Bottom navigation bar data
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: CustomColors.white,
    selectedItemColor: CustomColors.darkGreen,
    selectedLabelStyle: GoogleFonts.lexend(
      textStyle: const TextStyle(color: CustomColors.darkGreen),
    ),
    unselectedItemColor: CustomColors.lightGreen,
    unselectedLabelStyle: GoogleFonts.lexend(
      textStyle: const TextStyle(color: CustomColors.lightGreen),
    ),
    showUnselectedLabels: false, // Toggle this to show/hide the labels
  ),

  // Buttom data
  textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
    backgroundColor: MaterialStateProperty.all(CustomColors.lightGreen),
    foregroundColor: MaterialStateProperty.all(CustomColors.white),
    textStyle: MaterialStateProperty.all(GoogleFonts.lexend()),
  )),

  // Text data
  typography: Typography.material2018(platform: defaultTargetPlatform),
  textTheme: GoogleFonts.lexendTextTheme(
    const TextTheme(
      titleMedium: TextStyle(
        fontSize: 21,
        fontWeight: FontWeight.w500,
      ),
      titleSmall: TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.w500,
        color: CustomColors.darkGray,
      ),
      bodyMedium: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: CustomColors.black,
      ),
      bodySmall: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        color: CustomColors.black,
      ),
    ),
  ),
);
