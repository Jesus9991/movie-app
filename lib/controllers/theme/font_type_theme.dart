import 'package:appmovie_request/controllers/exports/exports.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/*
clase para manejar los tipos de fuentes del tema oscuro o claro 
*/

class FontsTheme {
  /*tipo de fuente */
  static TextStyle typeFont = GoogleFonts.lato();
  static TextStyle secondFont = GoogleFonts.mulish();

  /*tipos de textos a usar modo claro*/
  static TextTheme lightThemeFont = TextTheme(
    displayLarge: typeFont.copyWith(
      fontSize: 35,
      fontWeight: FontWeight.bold,
      color: PaletteTheme.principal,
    ),
    displayMedium: typeFont.copyWith(
      fontSize: 30,
      fontWeight: FontWeight.w600,
      color: PaletteTheme.principal,
    ),
    displaySmall: typeFont.copyWith(
      fontSize: 20,
      fontWeight: FontWeight.w300,
      color: PaletteTheme.principal,
    ),
    headlineLarge: typeFont.copyWith(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: PaletteTheme.principal,
    ),
    headlineMedium: typeFont.copyWith(
      fontSize: 15,
      fontWeight: FontWeight.w600,
      color: PaletteTheme.blackThree,
    ),
    headlineSmall: typeFont.copyWith(
      fontSize: 12,
      fontWeight: FontWeight.w200,
      color: PaletteTheme.blackThree,
    ),
    titleLarge: typeFont.copyWith(
      fontSize: 15,
      fontWeight: FontWeight.bold,
      color: PaletteTheme.blackThree,
    ),
    titleMedium: typeFont.copyWith(
      fontSize: 12,
      fontWeight: FontWeight.w600,
      color: PaletteTheme.blackThree,
    ),
    titleSmall: typeFont.copyWith(
      fontSize: 10,
      fontWeight: FontWeight.w300,
      color: PaletteTheme.blackThree,
    ),
    bodyLarge: typeFont.copyWith(
      fontSize: 15,
      fontWeight: FontWeight.w500,
      color: PaletteTheme.blackThree,
    ),
    bodyMedium: typeFont.copyWith(
      fontSize: 12,
      fontWeight: FontWeight.w300,
      color: PaletteTheme.blackThree,
    ),
    bodySmall: typeFont.copyWith(
      fontSize: 10,
      fontWeight: FontWeight.w100,
      color: PaletteTheme.principal,
    ),
    labelLarge: typeFont.copyWith(
      fontSize: 13,
      fontWeight: FontWeight.bold,
      color: PaletteTheme.blackTwo,
    ),
    labelMedium: typeFont.copyWith(
      fontSize: 12,
      fontWeight: FontWeight.w200,
      color: PaletteTheme.blackTwo,
    ),
    labelSmall: typeFont.copyWith(
      fontSize: 12,
      fontWeight: FontWeight.w100,
      color: PaletteTheme.blackTwo,
    ),
  );
  /*tipos de textos a usar modo oscuro*/
  static TextTheme dartThemeFont = TextTheme(
    displayLarge: typeFont.copyWith(
      fontSize: 35,
      fontWeight: FontWeight.bold,
      color: PaletteTheme.secondary,
    ),
    displayMedium: typeFont.copyWith(
      fontSize: 30,
      fontWeight: FontWeight.w600,
      color: PaletteTheme.secondary,
    ),
    displaySmall: typeFont.copyWith(
      fontSize: 20,
      fontWeight: FontWeight.w300,
      color: PaletteTheme.secondary,
    ),
    headlineLarge: typeFont.copyWith(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: PaletteTheme.whiteTwo,
    ),
    headlineMedium: typeFont.copyWith(
      fontSize: 15,
      fontWeight: FontWeight.w600,
      color: PaletteTheme.whiteTwo,
    ),
    headlineSmall: typeFont.copyWith(
      fontSize: 12,
      fontWeight: FontWeight.w200,
      color: PaletteTheme.whiteTwo,
    ),
    titleLarge: typeFont.copyWith(
      fontSize: 15,
      fontWeight: FontWeight.bold,
      color: PaletteTheme.whiteThree,
    ),
    titleMedium: typeFont.copyWith(
      fontSize: 12,
      fontWeight: FontWeight.w600,
      color: PaletteTheme.whiteThree,
    ),
    titleSmall: typeFont.copyWith(
      fontSize: 10,
      fontWeight: FontWeight.w300,
      color: PaletteTheme.whiteThree,
    ),
    bodyLarge: typeFont.copyWith(
      fontSize: 15,
      fontWeight: FontWeight.w500,
      color: PaletteTheme.whiteThree,
    ),
    bodyMedium: typeFont.copyWith(
      fontSize: 12,
      fontWeight: FontWeight.w300,
      color: PaletteTheme.whiteThree,
    ),
    bodySmall: typeFont.copyWith(
      fontSize: 10,
      fontWeight: FontWeight.w100,
      color: PaletteTheme.whiteThree,
    ),
    labelLarge: typeFont.copyWith(
      fontSize: 13,
      fontWeight: FontWeight.bold,
      color: PaletteTheme.whiteThree,
    ),
    labelMedium: typeFont.copyWith(
      fontSize: 12,
      fontWeight: FontWeight.w200,
      color: PaletteTheme.whiteThree,
    ),
    labelSmall: typeFont.copyWith(
      fontSize: 12,
      fontWeight: FontWeight.w100,
      color: PaletteTheme.whiteTwo,
    ),
  );
}
