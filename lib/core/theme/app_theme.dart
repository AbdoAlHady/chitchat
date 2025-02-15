import 'package:chitchat/core/theme/font_size.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.white,
    scaffoldBackgroundColor: Color(0xFF1B202D),
    textTheme: TextTheme(
      titleMedium: GoogleFonts.alegreyaSans(
        fontSize: FontSize.medium,
        color: Colors.white,
      ),
      titleLarge: GoogleFonts.alegreyaSans(
        fontSize: FontSize.large,
        color: Colors.white,
      ),
      bodySmall: GoogleFonts.alegreyaSans(
        fontSize: FontSize.small,
        color: Colors.white,
      ),
      bodyMedium: GoogleFonts.alegreyaSans(
        fontSize: FontSize.standard,
        color: Colors.white,
      ),
      bodyLarge: GoogleFonts.alegreyaSans(
        fontSize: FontSize.standard,
        color: Colors.white,
      ),
    ),
  );

  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.black,
    scaffoldBackgroundColor: Colors.white,
    textTheme: TextTheme(
      titleMedium: GoogleFonts.alegreyaSans(
        fontSize: FontSize.medium,
        color: Colors.black,
      ),
      titleLarge: GoogleFonts.alegreyaSans(
        fontSize: FontSize.large,
        color: Colors.black,
      ),
      bodySmall: GoogleFonts.alegreyaSans(
        fontSize: FontSize.standard,
        color: Colors.black,
      ),
      bodyMedium: GoogleFonts.alegreyaSans(
        fontSize: FontSize.standardUp,
        color: Colors.black,
      ),
      bodyLarge: GoogleFonts.alegreyaSans(
        fontSize: FontSize.large,
        color: Colors.black,
      ),
    ),
  );
}
