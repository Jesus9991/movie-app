import 'package:appmovie_request/controllers/exports/exports.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/*
clase para manejar los tipos de fuentes del tema oscuro o claro 
*/

class FontsTheme {
  /*tipo de fuente */
  static TextStyle typeFont = GoogleFonts.urbanist();
  static TextStyle secondFont = GoogleFonts.sora();

  /*tipos de textos a usar modo claro*/
  static TextTheme lightThemeFont = TextTheme(
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
      color: PaletteTheme.secondary,
    ),
    headlineMedium: typeFont.copyWith(
      fontSize: 15,
      fontWeight: FontWeight.w600,
      color: PaletteTheme.secondary,
    ),
    headlineSmall: typeFont.copyWith(
      fontSize: 12,
      fontWeight: FontWeight.w200,
      color: PaletteTheme.secondary,
    ),
    titleLarge: typeFont.copyWith(
      fontSize: 15,
      fontWeight: FontWeight.bold,
      color: PaletteTheme.secondary,
    ),
    titleMedium: typeFont.copyWith(
      fontSize: 12,
      fontWeight: FontWeight.w600,
      color: PaletteTheme.secondary,
    ),
    titleSmall: typeFont.copyWith(
      fontSize: 10,
      fontWeight: FontWeight.w300,
      color: PaletteTheme.purpleOne,
    ),
    bodyLarge: typeFont.copyWith(
      fontSize: 15,
      fontWeight: FontWeight.w500,
      color: PaletteTheme.secondary,
    ),
    bodyMedium: typeFont.copyWith(
      fontSize: 12,
      fontWeight: FontWeight.w300,
      color: PaletteTheme.secondary,
    ),
    bodySmall: typeFont.copyWith(
      fontSize: 10,
      fontWeight: FontWeight.w100,
      color: PaletteTheme.purpleOne,
    ),
    labelLarge: typeFont.copyWith(
      fontSize: 13,
      fontWeight: FontWeight.bold,
      color: PaletteTheme.greyColor,
    ),
    labelMedium: typeFont.copyWith(
      fontSize: 12,
      fontWeight: FontWeight.w200,
      color: PaletteTheme.greyColor,
    ),
    labelSmall: typeFont.copyWith(
      fontSize: 12,
      fontWeight: FontWeight.w100,
      color: PaletteTheme.greyColor,
    ),
  );
  /*tipos de textos a usar modo oscuro*/
  static TextTheme dartThemeFont = TextTheme(
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
      color: PaletteTheme.principal,
    ),
    headlineSmall: typeFont.copyWith(
      fontSize: 12,
      fontWeight: FontWeight.w200,
      color: PaletteTheme.principal,
    ),
    titleLarge: typeFont.copyWith(
      fontSize: 15,
      fontWeight: FontWeight.bold,
      color: PaletteTheme.principal,
    ),
    titleMedium: typeFont.copyWith(
      fontSize: 12,
      fontWeight: FontWeight.w600,
      color: PaletteTheme.principal,
    ),
    titleSmall: typeFont.copyWith(
      fontSize: 10,
      fontWeight: FontWeight.w300,
      color: PaletteTheme.principal,
    ),
    bodyLarge: typeFont.copyWith(
      fontSize: 15,
      fontWeight: FontWeight.w500,
      color: PaletteTheme.principal,
    ),
    bodyMedium: typeFont.copyWith(
      fontSize: 12,
      fontWeight: FontWeight.w300,
      color: PaletteTheme.principal,
    ),
    bodySmall: typeFont.copyWith(
      fontSize: 10,
      fontWeight: FontWeight.w100,
      color: PaletteTheme.principal,
    ),
    labelLarge: typeFont.copyWith(
      fontSize: 13,
      fontWeight: FontWeight.bold,
      color: PaletteTheme.greyColor,
    ),
    labelMedium: typeFont.copyWith(
      fontSize: 12,
      fontWeight: FontWeight.w200,
      color: PaletteTheme.greyColor,
    ),
    labelSmall: typeFont.copyWith(
      fontSize: 12,
      fontWeight: FontWeight.w100,
      color: PaletteTheme.greyColor,
    ),
  );
}
