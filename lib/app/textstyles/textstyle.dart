import 'package:flutter/material.dart';
import 'package:fmlfantasy/app/app_colors/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle globalTextStyle({
  required double fontSize,
  Color? color,
  double? letterSpacing,
  FontWeight? fontWeight,
  TextDecoration? decoration,
}) =>
    TextStyle(
      color: color ?? AppColors.dark,
      fontSize: fontSize,
      fontWeight: fontWeight ?? FontWeight.w800,
      fontFamily: GoogleFonts.raleway().fontFamily,
      decoration: decoration ?? TextDecoration.none,
    );

TextStyle globalTextStyle2({
  required double fontSize,
  Color? color,
  double? letterSpacing,
  FontWeight? fontWeight,
  TextDecoration? decoration,
}) =>
    TextStyle(
      color: color ?? AppColors.dark,
      fontSize: fontSize,
      fontWeight: fontWeight ?? FontWeight.w800,
      fontFamily: GoogleFonts.raleway().fontFamily,
      decoration: decoration ?? TextDecoration.none,
    );
