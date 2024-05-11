import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FontStyles {
  static TextStyle textLogo = TextStyle(
    fontSize: 60,
    fontWeight: FontWeight.w800
  );

  static TextStyle text36Bold = GoogleFonts.nunitoSans(
    fontSize: 36,
    fontWeight: FontWeight.w700
  );

  static TextStyle text26Bold = GoogleFonts.nunitoSans(
      fontSize: 26,
      fontWeight: FontWeight.w800
  );

  static TextStyle text22 = GoogleFonts.nunitoSans(
      fontSize: 22,
      fontWeight: FontWeight.w600
  ) as TextStyle;

  static TextStyle text20 = GoogleFonts.nunitoSans(
      fontSize: 20,
      fontWeight: FontWeight.w500
  ) as TextStyle;

  static TextStyle text20Bold = GoogleFonts.nunitoSans(
      fontSize: 20,
      fontWeight: FontWeight.w600
  ) as TextStyle;

  static TextStyle text20Italic = GoogleFonts.nunitoSans(
      fontSize: 20,
      fontStyle: FontStyle.italic
  ) as TextStyle;

  static TextStyle text18 = GoogleFonts.nunitoSans(
      fontSize: 18,
      fontWeight: FontWeight.w600
  ) as TextStyle;

  static TextStyle text18Italic = GoogleFonts.nunitoSans(
      fontSize: 18,
      fontStyle: FontStyle.italic
  ) as TextStyle;


}