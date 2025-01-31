import 'package:appmovie_request/controllers/exports/exports.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
/*
tema para manejar el appbar de la aplicación
*/

class AppBarMainTheme {
  /*tipo de fuente */
  static TextStyle typeFont = GoogleFonts.inter();

  static AppBarTheme appbarLight = AppBarTheme(
    iconTheme: const IconThemeData(
      color: PaletteTheme.secondary,
      size: 25,
    ),
    actionsIconTheme: const IconThemeData(
      color: PaletteTheme.secondary,
      size: 25,
    ),
    color: PaletteTheme.transparent,
    centerTitle: true,
    elevation: 0,
    titleTextStyle: typeFont.copyWith(
        fontSize: 15,
        fontWeight: FontWeight.bold,
        color: PaletteTheme.secondary),
  );
  //: modo oscuro
  static AppBarTheme appbarDark = AppBarTheme(
    iconTheme: const IconThemeData(color: PaletteTheme.principal, size: 25),
    actionsIconTheme:
        const IconThemeData(color: PaletteTheme.principal, size: 25),
    color: PaletteTheme.transparent,
    centerTitle: true,
    elevation: 0,
    titleTextStyle: typeFont.copyWith(
        fontSize: 15,
        fontWeight: FontWeight.bold,
        color: PaletteTheme.principal),
  );
}
