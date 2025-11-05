import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyles {
  static TextStyle get heading => GoogleFonts.poppins(
        fontSize: 24,
        fontWeight: FontWeight.bold,
      );

  static TextStyle get title => GoogleFonts.poppins(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      );

  static TextStyle get body => GoogleFonts.poppins(
        fontSize: 16,
      );

  static TextStyle get caption => GoogleFonts.poppins(
        fontSize: 14,
      );

  static TextStyle get button => GoogleFonts.poppins(
        fontSize: 16,
        fontWeight: FontWeight.w600,
      );

  static TextStyle custom({
    required double fontSize,
    FontWeight? fontWeight,
    Color? color,
  }) =>
      GoogleFonts.poppins(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
      );
}

